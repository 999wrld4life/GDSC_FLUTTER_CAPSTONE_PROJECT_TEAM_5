import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String images;
  const CardImage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 78),
      child: Container(
        height: 422,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                width: 205,
                height: 205,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFFD4D9E0),
                ),
              ),
            ),
            const SizedBox(width: 5,),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  alignment: Alignment(1, -0.95),
                  width: 305,
                  height: 305,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromRGBO(96, 85, 216, 1),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 369,
                    width: 204,
                    child: Image.asset(
                      images
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
