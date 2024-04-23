import 'package:flutter/material.dart';

class Edititem extends StatelessWidget {
  final Widget widget;
  const Edititem({
    super.key, required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            "Photo",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: widget,
        )
      ],
    );
  }
}
