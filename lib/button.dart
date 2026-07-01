import 'package:flutter/material.dart';

import 'dialog.dart';
import 'theme.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool processing;
  final VoidCallback onPressed;

  CustomButton({
    required this.icon,
    required this.text,
    this.processing = false,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      spacing: CustomTheme.normalSpacing,
      mainAxisSize: MainAxisSize.min,
      children: [
        processing
          ? CircularProgressIndicator(
              strokeWidth: 3,
              constraints: BoxConstraints.tight(const Size.square(18)),
              color: CustomTheme.overHighlightColor,
              backgroundColor: CustomTheme.overHighlightColor.withValues(alpha: 0.24)
            )
          : Icon(icon),
        Text(text)
      ]
    );

    return ElevatedButton(child: child, onPressed: onPressed);
  }
}

class ProcessingButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final Future<void> Function() onPressed;

  ProcessingButton({
    required this.icon,
    required this.text,
    required this.onPressed
  });

  @override
  _ProcessingButtonState createState() => _ProcessingButtonState();
}

class _ProcessingButtonState extends State<ProcessingButton> {
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      icon: widget.icon,
      text: widget.text,
      processing: processing,
      onPressed: onPressed
    );
  }

  void onPressed() async {
    if (processing)
      return;

    setState(() => processing = true);

    try {
      await widget.onPressed.call();
    }
    catch (e) {
      CustomDialog.showError(context, e.toString());
    }
    finally {
      setState(() => processing = false);
    }
  }
}