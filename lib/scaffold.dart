import 'package:flutter/material.dart';

import 'strings.dart';
import 'theme.dart';

abstract class CustomScaffold extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool expandChildContainer;

  CustomScaffold({
    required this.icon,
    required this.title,
    this.expandChildContainer = false
  });

  @override
  Widget build(BuildContext context) {
    final Widget titleWidget = Row(
      spacing: CustomTheme.largeSpacing,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 48, color: CustomTheme.screenTitleStyle.color),
        Text(title, style: CustomTheme.screenTitleStyle)
      ]
    );

    final Widget childWidget = Center(
      child: Container(
        width: 800,
        height: expandChildContainer ? null : 480,
        padding: const EdgeInsets.all(32),
        clipBehavior: Clip.hardEdge,
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
        child: buildCustomScaffoldChild(context)
      )
    );

    final Widget madeWithFlutterWidget = Row(
      spacing: CustomTheme.normalSpacing,
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: 32),
        Text(Strings.madeWithFlutter, style: CustomTheme.normalStyle)
      ]
    );

    return Material(
      color: CustomTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          spacing: CustomTheme.xxxLargeSpacing,
          children: [
            titleWidget,
            Expanded(
              child: childWidget
            ),
            madeWithFlutterWidget
          ]
        )
      )
    );
  }

  Widget buildCustomScaffoldChild(BuildContext context);
}