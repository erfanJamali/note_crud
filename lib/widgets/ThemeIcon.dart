
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';
import '../theme/themes.dart';

IconData themeIcon(context) {
  if (Provider.of<ThemeProvider>(context).themeData == lightMode) {
    return Icons.nightlight_rounded;
  } else {
    return Icons.sunny;
  }
}