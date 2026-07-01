import 'package:flutter/material.dart';

import 'auth_model.dart';
import 'button.dart';
import 'scaffold.dart';
import 'strings.dart';
import 'theme.dart';

class ScreenSettings extends CustomScaffold {
  final TextEditingController _controller = TextEditingController(
    text: AuthModel.instance.serviceConfig
  );

  ScreenSettings()
    : super(icon: CustomTheme.settingsIcon, title: Strings.screenSettingsTitle);

  @override
  Widget buildCustomScaffoldChild(BuildContext context) {
    return Column(
      spacing: CustomTheme.xLargeSpacing,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            style: CustomTheme.normalStyle,
            cursorColor: CustomTheme.normalStyle.color,
            textInputAction: TextInputAction.newline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: Strings.enterFirebaseServiceConfig,
              hintStyle: CustomTheme.normalHintStyle,
              border: InputBorder.none
            )
          )
        ),
        ProcessingButton(
          icon: CustomTheme.runIcon,
          text: Strings.initialize,
          onPressed: _onPressed
        )
      ]
    );
  }

  Future<void> _onPressed() async {
    if (_controller.text.isNotEmpty)
      await AuthModel.instance.initialize(_controller.text);
  }
}