import 'package:flutter/material.dart';

import 'screen_builder.dart';
import 'strings.dart';
import 'theme.dart';

void main() async {
  runApp(
    MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 48),
            backgroundColor: CustomTheme.highlightColor,
            foregroundColor: CustomTheme.overHighlightColor,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            textStyle: const TextStyle(fontSize: 16)
          )
        )
      ),
      home: ScreenBuilderWidget(),
      debugShowCheckedModeBanner: false
    )
  );
}