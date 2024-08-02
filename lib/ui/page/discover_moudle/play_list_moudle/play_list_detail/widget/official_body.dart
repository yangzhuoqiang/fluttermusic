import 'package:flutter/material.dart';
import 'package:music/models/play_list_detail_entity.dart';
import 'package:music/widgets/box.dart';
import 'package:music/res/r.dart';

class OfficialBody extends StatelessWidget {
  const OfficialBody({super.key, required this.entity});
  final PlayListDetailEntity entity;

  @override
  Widget build(BuildContext context) {
    var start = entity.name.indexOf('[');
    var end = entity.name.indexOf(']');
    print('name: ${entity.name}');
    var title = entity.name.substring(start + 1, end);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(),
          ),

          ///标题
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: R.fonts.PuHuiTi),
          ),

          vBox(12),

          ///更新时间
          Text(
            '更新时间：${entity.updateTime}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white54,
            ),
          ),

          vBox(12),

          ///描述
          Text(
            entity.description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white54,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
