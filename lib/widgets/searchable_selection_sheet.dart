import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

@immutable
class SelectionOption<T> {
  const SelectionOption({required this.value, required this.label, this.icon});

  final T value;
  final String label;
  final IconData? icon;
}

/// Opens a bottom sheet with a search field and a filtered list of [options].
///
/// Resolves to a record holding the chosen value, or to null when the sheet is
/// dismissed. The record lets a null option (such as "No location") be told
/// apart from dismissal.
Future<({T value})?> showSearchableSelectionSheet<T>(
  BuildContext context, {
  required String title,
  required String searchHint,
  required String emptyMessage,
  required List<SelectionOption<T>> options,
  required T current,
}) {
  return showModalBottomSheet<({T value})>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => _SearchableSelectionSheet<T>(
      title: title,
      searchHint: searchHint,
      emptyMessage: emptyMessage,
      options: options,
      current: current,
    ),
  );
}

class _SearchableSelectionSheet<T> extends StatefulWidget {
  const _SearchableSelectionSheet({
    required this.title,
    required this.searchHint,
    required this.emptyMessage,
    required this.options,
    required this.current,
  });

  final String title;
  final String searchHint;
  final String emptyMessage;
  final List<SelectionOption<T>> options;
  final T current;

  @override
  State<_SearchableSelectionSheet<T>> createState() =>
      _SearchableSelectionSheetState<T>();
}

class _SearchableSelectionSheetState<T>
    extends State<_SearchableSelectionSheet<T>> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SelectionOption<T>> get _results {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return widget.options;
    return widget.options
        .where((o) => o.label.toLowerCase().contains(query))
        .toList();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final maxListHeight = MediaQuery.sizeOf(context).height * 0.55;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final results = _results;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 4, 20, 20 + keyboardInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 14),
          TextField(
            controller: _searchController,
            autofocus: true,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: widget.searchHint,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _query.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Clear search',
                      icon: const Icon(Icons.close),
                      onPressed: _clearSearch,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxListHeight),
            child: results.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        widget.emptyMessage,
                        style:
                            theme.textTheme.bodyMedium?.copyWith(color: muted),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final option = results[index];
                      final selected = option.value == widget.current;
                      return _OptionTile(
                        label: option.label,
                        icon: option.icon,
                        selected: selected,
                        onTap: () =>
                            Navigator.of(context).pop((value: option.value)),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      selected: selected,
      selectedTileColor: AppColors.brand.withValues(alpha: 0.10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: icon == null
          ? null
          : Icon(icon,
              color: selected
                  ? AppColors.brand
                  : theme.colorScheme.onSurfaceVariant),
      title: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
      trailing: selected
          ? const Icon(Icons.check_circle, color: AppColors.brand)
          : null,
      onTap: onTap,
    );
  }
}
