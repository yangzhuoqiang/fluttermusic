import 'package:flutter/material.dart';
import 'package:music/widgets/border_image.dart';

import '../../../../res/r.dart';

class Record extends StatelessWidget {
  const Record({
    super.key,
    required this.animation,
    required this.url,
  });
  final Animation<double> animation;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
        child: RotationTransition(
          turns: animation,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                R.images.bet,
                width: 300,
              ),
              BorderImage(
                url: '$url?param=200y200',
                border: 213 / 1,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
