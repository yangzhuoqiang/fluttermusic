import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/models/creator_entity.dart';
import 'package:music/widgets/box.dart';
import 'package:music/widgets/custom_list/build_list.dart';

import '../../../../../../theme/widgets/theme_adapter.dart';
import '../../../../../../utils/string_util.dart';

class SubsPeople extends StatelessWidget {
  const SubsPeople({
    super.key,
    required this.items,
    this.count = 0,
    this.onTap,
  });
  final List<CreatorEntity>? items;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Visibility(
        visible: items != null && items!.isNotEmpty,
        child: InkWell(
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: buildList<CreatorEntity>(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (item, index) {
                      return CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            CachedNetworkImageProvider(item.avatarUrl),
                      );
                    },
                    items: items!,
                    separatorBuilder: (item, index) => hBox(8),
                    itemCount: items!.length > 5 ? 5 : items!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ThemeAdapter(
                      builder: (controller) {
                        return Text(
                          '${StringUtil.formatCount(count)}人收藏',
                          style: TextStyle(
                            color: controller.fontColor.value.withOpacity(0.5),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(0.5),
                        size: 20.0,
                      ),
                      onPressed: onTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
