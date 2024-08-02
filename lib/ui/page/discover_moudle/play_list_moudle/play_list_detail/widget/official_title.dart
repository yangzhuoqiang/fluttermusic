import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/box.dart';
import '../../../../../../theme/widgets/theme_adapter.dart';

class OfficialTitle extends StatelessWidget {
  const OfficialTitle({
    super.key,
    required this.url,
    required this.name,
  });
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12.0,
          backgroundImage: CachedNetworkImageProvider(url),
        ),
        hBox(5),
        ThemeAdapter(
          builder: (controller) {
            return Text(
              name,
              style: TextStyle(
                color: controller.fontColor.value,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ],
    );
  }
}
