import 'package:flutter/material.dart';

class SidebarController extends ChangeNotifier {
  int? selectedSectionIndex;
  ({int section, int index})? selectedSubItem;
  int? expandedIndex;
  int? hoveredSectionIndex;
  ({int section, int index})? hoveredSubItem;
  bool isCollapsed = false;

  void toggleCollapse() {
    isCollapsed = !isCollapsed;
    notifyListeners();
  }

  void selectSection(int index, List sections) {
    selectedSectionIndex = index;
    selectedSubItem = null;

    if (sections[index].children.isNotEmpty) {
      expandedIndex = expandedIndex == index ? null : index;
    }
    notifyListeners();
  }

  void selectSubItem(int sectionIndex, int itemIndex) {
    selectedSectionIndex = sectionIndex;
    selectedSubItem = (section: sectionIndex, index: itemIndex);
    notifyListeners();
  }

  void hoverSection(int index) {
    hoveredSectionIndex = index;
    notifyListeners();
  }

  void clearHoverSection() {
    hoveredSectionIndex = null;
    notifyListeners();
  }

  void hoverSubItem(int sectionIndex, int itemIndex) {
    hoveredSubItem = (section: sectionIndex, index: itemIndex);
    notifyListeners();
  }

  void clearHoverSubItem() {
    hoveredSubItem = null;
    notifyListeners();
  }
}