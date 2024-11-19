import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  TabItemWidget({ this.text,super.key});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
          decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.blue[300],
          ),
          width: 120,
          height: 50,
          child: Text("$text"),
        );
  }
}
