import 'package:flutter/material.dart';
import 'package:music/theme/widgets/theme_text.dart';

import 'box.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.width,
    this.height,
    this.padding,
    this.onTap,
    this.onTrailTap,
  });
  final double? width;
  final double? height;
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final VoidCallback? onTrailTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null) leading!,
            if (leading != null) hBox(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    ThemeText(
                      title!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  if (title != null) vBox(4),
                  if (subtitle != null && subtitle!.isNotEmpty)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                ],
              ),
            ),
            if (trailing != null) hBox(10),
            if (trailing != null)
              GestureDetector(
                onTap: onTrailTap,
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }
}
