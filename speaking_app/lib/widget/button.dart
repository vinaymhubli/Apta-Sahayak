import 'package:flutter/material.dart';

class FlagButton extends StatelessWidget {
  final String text;
  final String flag;
  final Function onTap;

  const FlagButton(
      {required this.text, required this.flag, required this.onTap})
      : super();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        color: Color.fromARGB(255, 135, 6, 81),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Image.asset(
              'assets/$flag',
              width: 80,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
