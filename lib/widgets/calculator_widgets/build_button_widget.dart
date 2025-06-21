import 'package:flutter/material.dart';

class BuildButtonWidget extends StatelessWidget {
  String texto;
  Color bgColor;
  VoidCallback function;

  BuildButtonWidget({
    required this.texto,
    required this.bgColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          // shape: CircleBorder(),
          // backgroundColor: Color(0xff272B27)),
          backgroundColor: bgColor,
          side: BorderSide.none,
          // padding: EdgeInsets.all(20),
        ),
        onPressed: function,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 8,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
