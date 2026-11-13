import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../services/barcode_scan_session.dart';
import '../theme/app_colors.dart';
import '../widgets/app_settings_scope.dart';

/// Live camera scanner. Pops with the scanned barcode, or null when cancelled.
class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key, this.autoFlashlight = false});

  static const _supportedFormats = [
    BarcodeFormat.ean13,
    BarcodeFormat.ean8,
    BarcodeFormat.upcA,
    BarcodeFormat.upcE,
    BarcodeFormat.code128,
    BarcodeFormat.code39,
    BarcodeFormat.qrCode,
  ];

  final bool autoFlashlight;

  /// Opens the scanner using the user's Auto Flashlight setting.
  static Future<String?> scan(BuildContext context) {
    final autoFlashlight = AppSettingsScope.settingsOf(context).autoFlashlight;
    return Navigator.of(context).push<String>(
      MaterialPageRoute(
          builder: (_) => BarcodeScannerScreen(autoFlashlight: autoFlashlight)),
    );
  }

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with WidgetsBindingObserver {
  final BarcodeScanSession _session = BarcodeScanSession();
  late final MobileScannerController _controller;
  bool _detected = false;
  String? _hint;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = MobileScannerController(
      torchEnabled: !kIsWeb && widget.autoFlashlight,
      formats: BarcodeScannerScreen._supportedFormats,
    );
  }

  Future<void> _switchCamera() async {
    try {
      await _controller.switchCamera();
    } catch (_) {
      if (mounted) {
        setState(() => _hint = 'Could not switch camera.');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_stopCamera().whenComplete(_controller.dispose));
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_detected) return;
    switch (state) {
      case AppLifecycleState.resumed:
        unawaited(_startCamera());
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        unawaited(_stopCamera());
      case AppLifecycleState.inactive:
        break;
    }
  }

  void _onDetect(BarcodeCapture capture) {
    if (_detected) return;

    final raw =
        capture.barcodes.isEmpty ? null : capture.barcodes.first.rawValue;
    final accepted = _session.accept(raw);
    if (accepted == null) {
      if (raw != null && raw.trim().isNotEmpty && _hint == null) {
        setState(() => _hint = "That barcode couldn't be read. Try again.");
      }
      return;
    }

    setState(() {
      _detected = true;
      _hint = null;
    });
    unawaited(_finish(accepted));
  }

  Future<void> _finish(String barcode) async {
    await _stopCamera();
    if (mounted) Navigator.of(context).pop(barcode);
  }

  Future<void> _startCamera() async {
    try {
      await _controller.start();
    } catch (_) {
      // Failures are reported through the controller state.
    }
  }

  /// Turns the torch off before stopping so it never stays lit after leaving.
  Future<void> _stopCamera() async {
    try {
      if (_controller.value.torchState == TorchState.on) {
        await _controller.toggleTorch();
      }
      await _controller.stop();
    } catch (_) {
      // The camera may already be stopped or unavailable.
    }
  }

  Future<void> _toggleTorch() async {
    try {
      await _controller.toggleTorch();
    } catch (_) {
      if (mounted) {
        setState(() => _hint = 'The flashlight could not be changed.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder<MobileScannerState>(
          valueListenable: _controller,
          builder: (context, state, _) {
            final currentError = state.error;
            final showFrame = currentError == null && !_detected;

            return Column(
              children: [
                _TopBar(
                  onBack: () => Navigator.of(context).pop(),
                  onSwitchCamera: _switchCamera,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      MobileScanner(
                        controller: _controller,
                        onDetect: _onDetect,
                        errorBuilder: (context, error) =>
                            const SizedBox.shrink(),
                      ),
                      if (currentError != null)
                        _ScannerMessage(
                          error: currentError,
                          onRetry: _startCamera,
                        )
                      else if (showFrame)
                        const _ScanFrame(),
                      if (!kIsWeb)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: _FlashlightButton(
                            torchState: state.torchState,
                            onPressed: _toggleTorch,
                          ),
                        ),
                    ],
                  ),
                ),
                _BottomPanel(
                  title: _titleFor(state),
                  hint: _hint,
                  onCancel: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _titleFor(MobileScannerState state) {
    if (_detected) return 'Barcode found. Returning to your item…';
    if (state.error != null) return 'Camera unavailable';
    if (!state.isInitialized) return 'Starting camera…';
    return 'Point the camera at a barcode';
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBack, this.onSwitchCamera});

  final VoidCallback onBack;
  final VoidCallback? onSwitchCamera;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
      child: Row(
        children: [
          _CircleButton(
              icon: Icons.arrow_back, tooltip: 'Back', onPressed: onBack),
          const SizedBox(width: 12),
          Text(
            'Scan barcode',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
          const Spacer(),
          if (onSwitchCamera != null)
            _CircleButton(
              icon: Icons.switch_camera,
              tooltip: 'Switch camera',
              onPressed: onSwitchCamera!,
            ),
        ],
      ),
    );
  }
}

class _ScanFrame extends StatefulWidget {
  const _ScanFrame();

  @override
  State<_ScanFrame> createState() => _ScanFrameState();
}

class _ScanFrameState extends State<_ScanFrame>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => SizedBox(
        width: 260,
        height: 260,
        child: CustomPaint(
          painter: _ScanFramePainter(
            color: Colors.white,
            scanProgress: _controller.value,
          ),
        ),
      ),
    );
  }
}

class _ScanFramePainter extends CustomPainter {
  const _ScanFramePainter({required this.color, this.scanProgress = 0.0});

  final Color color;
  final double scanProgress;

  @override
  void paint(Canvas canvas, Size size) {
    const corner = 36.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(0, corner)
      ..lineTo(0, 0)
      ..lineTo(corner, 0)
      ..moveTo(w - corner, 0)
      ..lineTo(w, 0)
      ..lineTo(w, corner)
      ..moveTo(w, h - corner)
      ..lineTo(w, h)
      ..lineTo(w - corner, h)
      ..moveTo(corner, h)
      ..lineTo(0, h)
      ..lineTo(0, h - corner);
    canvas.drawPath(path, paint);

    // Animated scan line
    final scanY = corner + (h - 2 * corner) * scanProgress;
    final scanPaint = Paint()
      ..color = color.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(corner, scanY),
      Offset(w - corner, scanY),
      scanPaint,
    );
    // Glow effect
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawLine(
      Offset(corner, scanY),
      Offset(w - corner, scanY),
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(_ScanFramePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.scanProgress != scanProgress;
}

class _FlashlightButton extends StatelessWidget {
  const _FlashlightButton({required this.torchState, required this.onPressed});

  final TorchState torchState;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final available = torchState != TorchState.unavailable;
    final isOn = torchState == TorchState.on;
    return _CircleButton(
      icon: isOn ? Icons.flashlight_on : Icons.flashlight_off,
      tooltip: available ? 'Flashlight' : 'No flashlight on this device',
      onPressed: available ? onPressed : null,
      highlighted: isOn,
    );
  }
}

/// Translucent round control used over the camera preview.
class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.highlighted = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: highlighted ? AppColors.soon : Colors.black45,
        foregroundColor: highlighted ? AppColors.deep : Colors.white,
        disabledBackgroundColor: Colors.black26,
        disabledForegroundColor: Colors.white38,
        minimumSize: const Size(48, 48),
        shape: const CircleBorder(),
      ),
      icon: Icon(icon),
    );
  }
}

class _BottomPanel extends StatelessWidget {
  const _BottomPanel(
      {required this.title, required this.hint, required this.onCancel});

  final String title;
  final String? hint;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: scheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 18),
          Text(title,
              textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            hint ?? 'Hold steady. Barcodes are detected automatically.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: hint == null ? scheme.onSurfaceVariant : scheme.error,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onCancel,
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerMessage extends StatelessWidget {
  const _ScannerMessage({required this.error, required this.onRetry});

  final MobileScannerException error;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final denied = error.errorCode == MobileScannerErrorCode.permissionDenied;
    return ColoredBox(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
              child: Icon(
                denied
                    ? Icons.no_photography_outlined
                    : Icons.videocam_off_outlined,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              denied ? 'Camera access needed' : 'Camera unavailable',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              denied
                  ? 'Allow camera access so ExPIRA can read barcodes. If you chose "Don\'t allow", turn camera access on in your device settings.'
                  : 'The camera could not start. Close other apps that use the camera, then try again.',
              textAlign: TextAlign.center,
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => onRetry(),
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
