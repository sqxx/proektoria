import 'package:flutter/material.dart';

/// Кнопка с иконкой
class PButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  const PButton({
    Key key,
    @required this.text,
    this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (icon != null) Icon(icon),
          if (icon != null) SizedBox(width: 8),
          Text(
            text.toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      highlightedBorderColor: Colors.black,
      onPressed: onPressed,
    );
  }
}
