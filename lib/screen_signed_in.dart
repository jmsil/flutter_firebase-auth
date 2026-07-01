import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth_model.dart';
import 'button.dart';
import 'scaffold.dart';
import 'strings.dart';
import 'theme.dart';

class ScreenSignedIn extends CustomScaffold {
  ScreenSignedIn()
    : super(
        icon: CustomTheme.profileIcon,
        title: Strings.screenSignedInTitle(AuthModel.userName),
        expandChildContainer: true
      );

  @override
  Widget buildCustomScaffoldChild(BuildContext context) {
    return Column(
      spacing: CustomTheme.xxLargeSpacing,
      children: [
        Row(
          spacing: CustomTheme.xxLargeSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                spacing: CustomTheme.normalSpacing,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.userId, style: CustomTheme.normalHintStyle),
                  Text(AuthModel.userId, style: CustomTheme.normalStyle)
                ]
              )
            ),
            ProcessingButton(
              icon: CustomTheme.signOutIcon,
              text: Strings.signOut,
              onPressed: AuthModel.instance.signOut
            )
          ]
        ),
        Expanded(
          child: _TokenWidget()
        )
      ]
    );
  }
}

class _TokenWidget extends StatefulWidget {
  @override
  _TokenWidgetState createState() => _TokenWidgetState();
}

class _TokenWidgetState extends State<_TokenWidget> {
  String token = '';
  DateTime? expirationDateTime;

  @override
  void initState() {
    super.initState();
    AuthModel.registerListener(onTokenChangesCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: CustomTheme.normalSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.token(expirationDateTime), style: CustomTheme.normalHintStyle),
        Expanded(
          child: SelectableText(token, style: CustomTheme.normalStyle)
        ),
        Row(
          spacing: CustomTheme.largeSpacing,
          children: [
            Expanded(
              child: ProcessingButton(
                icon: CustomTheme.refreshIcon,
                text: Strings.refresh,
                onPressed: AuthModel.refreshToken
              )
            ),
            Expanded(
              child: CustomButton(
                icon: CustomTheme.copyIcon,
                text: Strings.copy,
                onPressed: onCopyPressed
              )
            )
          ]
        )
      ]
    );
  }

  void onCopyPressed() {
    Clipboard.setData(ClipboardData(text: token));
  }

  void onTokenChangesCallback(String token, DateTime? expirationDateTime) {
    setState(() {
      this.token = token;
      this.expirationDateTime = expirationDateTime;
    });
  }
}