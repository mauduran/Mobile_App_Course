import 'package:flutter/material.dart';

class ActionBtn extends StatelessWidget {
  final IconData _icon;
  final String _title;

  ActionBtn(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _icon,
          color: Colors.grey[400],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          _title,
          style: TextStyle(color: Colors.grey[400]),
        ),
      ],
    );
  }
}
