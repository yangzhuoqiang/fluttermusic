import 'package:flutter/material.dart';
import 'package:music/res/r.dart';
import 'package:music/res/style.dart';
import 'package:music/widgets/gradient_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      onTap: onTap,
      borderRadius: 25.0,
      colors: [Colors.lightBlue.shade300, Colors.blueAccent],
      child: Text(
        '登录',
        style: Style.puhui20white,
      ),
    );
  }
}
