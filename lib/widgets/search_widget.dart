import 'package:flutter/material.dart';
import 'package:music/widgets/box.dart';
import 'package:music/res/color_style.dart';
import 'package:music/res/style.dart';

///搜索框封装
class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.height = 40,
    this.hintText,
    this.autofocus,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.onTap,
    this.onEditingComplete,
  });
  final double? height;
  final String? hintText;
  final bool? autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorStyle.E0E6FD66,
        borderRadius: BorderRadius.circular(height! / 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          hBox(10.0),

          ///搜索图标
          const Icon(
            Icons.search,
            color: ColorStyle.B8C0D4,
            size: 24.0,
          ),

          hBox(10.0),

          ///搜索框
          _buildSearch(),
        ],
      ),
    );
  }

  _buildSearch() {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        autofocus: autofocus ?? false,
        style: Style.f3f3f316,
        decoration: InputDecoration(
          hintText: hintText ?? '搜索',
          border: InputBorder.none,
          hintStyle: Style.b8c0d414,
        ),
      ),
    );
  }
}
