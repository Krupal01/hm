import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
