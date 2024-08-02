class PlayListDetailSongEntity {
  late int id;
  late String name;
  late String singer;
  late String picUrl;
  late String des;

  PlayListDetailSongEntity({
    required this.id,
    required this.name,
    required this.singer,
    required this.des,
  });

  PlayListDetailSongEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    var sins = <String>[];
    json['ar'].forEach((v) {
      sins.add(v['name']);
    });
    singer = sins.join('/');
    picUrl = json['al']['picUrl'];
    des = json['al']['name'];
  }
}
