import 'package:flutter/material.dart';

class CustomImgCont extends StatelessWidget {
  String assetPath;
  CustomImgCont({
    Key? key,
    this.assetPath = 'assets/img/task.jpg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(assetPath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
