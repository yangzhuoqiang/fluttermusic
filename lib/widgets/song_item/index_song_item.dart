import 'package:flutter/material.dart';
import 'package:music/theme/widgets/theme_text.dart';
import 'package:music/widgets/custom_list_title.dart';

class IndexSongItem extends StatelessWidget {
  const IndexSongItem({
    super.key,
    this.index,
    required this.name,
    required this.singer,
    this.alia,
    this.desc,
  });
  final int? index;
  final String name;
  final String singer;
  final String? alia;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return CustomListTitle(
      leading: _index(),
      title: name,
      subtitle: desc == null ? singer : '$singer - $desc',
      padding: const EdgeInsets.symmetric(horizontal: 15),
    );
  }

  _index() {
    return Visibility(
      visible: index != null,
      child: ThemeText(
        '${index! + 1}',
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
