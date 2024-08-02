import 'package:flutter/material.dart';

class DailyContent extends StatelessWidget {
  const DailyContent({
    super.key,
    required this.dd,
    required this.mm,
  });
  final String dd;
  final String mm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: dd, style: const TextStyle(fontSize: 25)),
            TextSpan(text: mm, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
