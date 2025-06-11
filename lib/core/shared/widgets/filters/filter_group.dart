import 'package:flutter/material.dart';

class FilterGroup extends StatelessWidget {
  final String title;
  final List<String> items;
  final Set<String> selectedItems;
  final ValueChanged<Set<String>> onChanged;

  const FilterGroup({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF374151)),
      ),
      children: items.map((item) {
        final isChecked = selectedItems.contains(item);
        return CheckboxListTile(
          value: isChecked,
          title: Text(item),
          contentPadding: EdgeInsets.zero,
          onChanged: (checked) {
            final updated = Set<String>.from(selectedItems);
            if (checked == true) {
              updated.add(item);
            } else {
              updated.remove(item);
            }
            onChanged(updated);
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      }).toList(),
    );
  }
}