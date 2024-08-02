import 'package:flutter/material.dart';

import '../../../../res/r.dart';

class Stylus extends StatelessWidget {
  const Stylus({
    super.key,
    required this.stylusAnimation,
  });
  final Animation<double> stylusAnimation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.25, -1),
      child: RotationTransition(
        turns: stylusAnimation,
        alignment: const Alignment(-1 + 90 / 293, 90 / 504 - 1),
        child: Image.asset(
          R.images.bgm,
          width: 102.5,
          height: 186.4,
        ),
      ),
    );
  }
}
