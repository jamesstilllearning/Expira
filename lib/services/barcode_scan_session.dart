/// Guards barcode detection so one physical scan produces exactly one result.
class BarcodeScanSession {
  static const maxLength = 64;
  static final _printableAscii = RegExp(r'^[\x20-\x7E]+$');

  bool _locked = false;

  bool get isLocked => _locked;

  /// Returns the trimmed barcode for the first valid read and locks the
  /// session. Returns null for empty, oversized, or unreadable values, and for
  /// every read after a successful one until [reset] is called.
  String? accept(String? rawValue) {
    if (_locked || rawValue == null) return null;

    final value = rawValue.trim();
    if (value.isEmpty || value.length > maxLength) return null;
    if (!_printableAscii.hasMatch(value)) return null;

    _locked = true;
    return value;
  }

  /// Re-arms the session so a new scan can be accepted.
  void reset() => _locked = false;
}
