import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final String header;
  final String description;

  const CardText({Key? key, required this.header, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 38),
      child: Container(
        height: 188,
        width: 305,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              header,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.33,
                letterSpacing: -0.8,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.71,
                letterSpacing: -0.4,
                color: Color(0xFF171717),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}