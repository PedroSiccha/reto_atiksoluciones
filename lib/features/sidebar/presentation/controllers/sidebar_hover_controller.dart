import 'package:flutter/material.dart';

class SidebarHoverController extends ChangeNotifier {
  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  void setHoveredIndex(int? index) {
    if (_hoveredIndex != index) {
      _hoveredIndex = index;
      notifyListeners();
    }
  }

  bool isHovered(int index) => _hoveredIndex == index;
}