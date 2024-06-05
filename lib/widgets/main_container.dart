import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.size,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.image,
    required this.text,
  });

  final Size size;
  final Color color1;
  final Color color2;
  final Color color3;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.height * 0.12,
      height: size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 2,
          ),
          Image.asset(
            image,
            height: 45,
          ),
          Container(
            alignment: Alignment.center,
            width: size.height * 0.12,
            height: 25,
            decoration: BoxDecoration(
                color: color3,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
