import 'package:flutter/material.dart';

import 'package:music/widgets/border_image.dart';
import 'package:music/widgets/custom_list_title.dart';

class ImageSongItem extends StatelessWidget {
  const ImageSongItem({
    super.key,
    required this.cover,
    required this.name,
    required this.artist,
    this.trailing = false,
    this.onTrailTap,
  });
  final String cover;
  final String name;
  final String artist;
  final bool trailing;
  final VoidCallback? onTrailTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTitle(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      leading: _cover(),
      title: name,
      subtitle: artist,
      trailing: Visibility(
        visible: trailing,
        child: GestureDetector(
          onTap: onTrailTap,
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _cover() {
    return BorderImage(
      url: cover,
      border: 10,
      width: 50,
      fit: BoxFit.cover,
    );
  }
}
