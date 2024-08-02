import 'date_util.dart';

class StringUtil {
  ///格式化歌曲播放量
  static String formatCount(int count) {
    if (count < 10000) {
      return count.toString();
    } else if (count < 100000000) {
      return '${(count / 10000).toStringAsFixed(1)}万';
    } else {
      return '${(count / 100000000).toStringAsFixed(1)}亿';
    }
  }

  ///格式化歌曲播放时间
  static String subTime(int millisecond) {
    var time = DateTime.fromMillisecondsSinceEpoch(millisecond);
    var result = DateUtil.formatDate(time, format: 'mm:ss');
    return result;
  }

  ///格式化评论数量
  static String formatCommentCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 10000) {
      return '999+';
    } else {
      return '1w+';
    }
  }
}
