import 'package:flutter/material.dart';
import 'package:music/res/style.dart';
import 'package:music/widgets/verifacation_box/verification_box.dart';
import 'package:music/widgets/verifacation_box/verification_type.dart';

class CodeInput extends StatelessWidget {
  const CodeInput({
    super.key,
    required this.onCodeComplete,
  });
  final Function(int code) onCodeComplete;

  @override
  Widget build(BuildContext context) {
    return VerificationBox(
      count: 4,
      type: VerificationBoxItemType.underline,
      borderColor: Colors.grey,
      focusBorderColor: Colors.white,
      textStyle: Style.puhui30whitebold,
      autoFocus: true,
      cursorEndIndent: 5,
      borderWidth: 2.5,
      onSubmitted: (value) => onCodeComplete(int.parse(value)),
    );
  }
}
