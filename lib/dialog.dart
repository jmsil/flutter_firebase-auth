import 'package:flutter/material.dart';

import 'button.dart';
import 'strings.dart';
import 'theme.dart';

class CustomDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  CustomDialog._(this.icon, this.title, this.text);

  @override
  Widget build(BuildContext context) {
    final Widget titleWidget = Row(
      spacing: CustomTheme.incrementedSpacing,
      children: [
        Icon(icon, color: CustomTheme.dialogTitleStyle.color, size: 36),
        Text(title, style: CustomTheme.dialogTitleStyle)
      ]
    );

    return Center(
      child: Container(
        margin: const EdgeInsets.all(64),
        padding: const EdgeInsets.all(24),
        constraints: BoxConstraints(maxWidth: 480),
        decoration: BoxDecoration(
          color: CustomTheme.containerBackgroundColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 12),
              blurRadius: 36
            )
          ]
        ),
        child: Column(
          spacing: CustomTheme.xLargeSpacing,
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget,
            Text(text, style: CustomTheme.normalStyle),
            CustomButton(
              icon: CustomTheme.checkIcon,
              text: Strings.ok,
              onPressed: Navigator.of(context).pop
            )
          ]
        )
      )
    );
  }

  static void showError(BuildContext context, String error) {
    show(context, CustomTheme.errorIcon, Strings.error, error);
  }

  static void showInfo(BuildContext context, String title, String info) {
    show(context, CustomTheme.infoIcon, title, info);
  }

  static void show(BuildContext context, IconData icon, String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog._(icon, title, text)
    );
  }
}