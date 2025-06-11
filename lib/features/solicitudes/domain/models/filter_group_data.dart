class FilterGroupData {
  final String title;
  final List<String> items;
  final Set<String> selected;

  FilterGroupData({
    required this.title,
    required this.items,
    required this.selected,
  });

  FilterGroupData copyWith({Set<String>? selected}) {
    return FilterGroupData(
      title: title,
      items: items,
      selected: selected ?? this.selected,
    );
  }
}