class RecomPlayListEntity {
  late int id;
  late String name;
  late String picUrl;
  late int playCount;

  RecomPlayListEntity({
    required this.id,
    required this.name,
    required this.picUrl,
    required this.playCount,
  });

  RecomPlayListEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    playCount = json['playcount'];
  }
}
