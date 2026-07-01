import 'package:flutter/material.dart';

class CustomTheme {
  static const double normalSpacing = 8;
  static const double incrementedSpacing = 12;
  static const double largeSpacing = 16;
  static const double xLargeSpacing = 24;
  static const double xxLargeSpacing = 48;
  static const double xxxLargeSpacing = 128;

  static const Color highlightColor = Colors.white;
  static const Color overHighlightColor = Colors.black;
  static const Color backgroundColor = Color(0xFF121212);
  static const Color containerBackgroundColor = Color(0xFF212121);

  static final TextStyle screenTitleStyle = TextStyle(
    color: highlightColor.withValues(alpha: 0.75), fontSize: 32
  );
  static final TextStyle dialogTitleStyle = TextStyle(
    color: highlightColor.withValues(alpha: 0.75), fontSize: 24
  );
  static final TextStyle normalStyle = TextStyle(color: highlightColor, fontSize: 16);
  static final TextStyle normalHintStyle = TextStyle(
    color: highlightColor.withValues(alpha: 0.5), fontSize: 16
  );

  static const IconData infoIcon = Icons.info;
  static const IconData errorIcon = Icons.error;
  static const IconData profileIcon = Icons.account_circle;
  static const IconData settingsIcon = Icons.settings;
  static const IconData settingsOutlinedIcon = Icons.settings_outlined;
  static const IconData copyIcon = Icons.copy;
  static const IconData checkIcon = Icons.check;
  static const IconData signInIcon = Icons.login;
  static const IconData signOutIcon = Icons.logout;
  static const IconData refreshIcon = Icons.refresh;
  static const IconData runIcon = Icons.play_arrow_outlined;
}