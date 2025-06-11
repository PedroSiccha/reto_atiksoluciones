import 'package:flutter/material.dart';

import 'app_colors.dart';

const double kHeaderHeight = 64;
const double kHeaderIconSize = 20;
const double kHeaderButtonRadius = 8;

const EdgeInsets kHeaderHorizontalPadding = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets kHeaderButtonPadding = EdgeInsets.all(8);

const EdgeInsets kHeaderMenuItemPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);

const TextStyle kHeaderMenuItemTextStyle = TextStyle(fontSize: 13);

const double kHeaderMenuIconSize = 18;

const SizedBox kHeaderActionSpacing = SizedBox(width: 16);

final Color kHeaderButtonBackground = Colors.grey.shade100;

const List<BoxShadow> kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 4,
    offset: Offset(0, 2),
  ),
];

const TextStyle kBreadcrumbStyle = TextStyle(
  color: AppColors.primary,
  fontSize: 14,
);

const TextStyle kBreadcrumbActiveStyle = TextStyle(
  color: Colors.black87,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const TextStyle logoText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
);

const TextStyle sidebarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
);

const Widget kBreadcrumbSeparator = Padding(
  padding: EdgeInsets.symmetric(horizontal: 8),
  child: Icon(Icons.chevron_right, size: 16, color: Colors.grey),
);