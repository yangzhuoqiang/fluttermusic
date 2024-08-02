import 'package:flutter/cupertino.dart';
import 'package:music/http/request.dart';
import 'package:music/http/request_api.dart';
import 'package:music/models/creator_entity.dart';
import 'package:music/models/play_list_detail_song_entity.dart';
import 'package:music/models/new_song_entity.dart';
import 'package:music/models/play_list_entity.dart';
import 'package:music/models/recom_play_entity.dart';
import 'package:music/typedef/function.dart';

import '../models/comment_entity.dart';
import '../models/play_list_detail_entity.dart';
import '../models/rank_entity.dart';

///请求仓库
class RequestRepository {
  ///发送验证码
  ///[phone]手机号
  sendCode({
    required String phone,
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.sendCode,
      parames: {
        'phone': phone,
      },
      success: (data) {
        ///去看一下返回的数据类型
        if (data['code'] == 200) {
          if (success != null) {
            success(true);
          }
        } else {
          if (success != null) {
            success(false);
          }
        }
      },
      fail: fail,
    );
  }

  ///验证验证码
  ///[phone]手机号
  ///[captcha]验证码
  ///[success]成功回调
  ///[fail]失败回调
  verifyCode({
    required String phone,
    required String captcha,
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.verifyCode,
      parames: {
        'phone': phone,
        'captcha': captcha,
      },
      success: (data) {
        ///去看一下返回的数据类型
        if (data['code'] == 200) {
          if (success != null) {
            success(true);
          }
        } else {
          if (success != null) {
            success(false);
          }
        }
      },
      fail: fail,
    );
  }

  ///邮箱登录
  ///[email]邮箱
  ///[password]密码
  ///[success]成功回调
  ///[fail]失败回调
  emailLogin({
    required String email,
    required String password,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      parames: {
        'email': email,
        'password': password,
      },
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          if (success != null) {
            success(data['cookie']);
          }
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  ///手机登录
  ///[phone]手机号
  ///[password]密码
  ///[success]成功回调
  ///[fail]失败回调
  phoneLogin({
    required String phone,
    required String password,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      parames: {
        'phone': phone,
        'password': password,
      },
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  ///这三个接口返回的数据是一样的
  ///验证码登录
  ///[phone]手机号
  ///[captcha]验证码
  ///[success]成功回调
  ///[fail]失败回调
  captchaLogin({
    required String phone,
    required String captcha,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      parames: {
        'phone': phone,
        'captcha': captcha,
      },
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail(data['msg']);
          }
        }
      },
      fail: fail,
    );
  }

  ///刷新登录
  refreshLogin({
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.refreshLogin,
      dialog: false,
      success: (data) {
        debugPrint('data=====>$data');

        ///如果正确会返回cookie
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail('');
          }
        }
      },
      fail: fail,
    );
  }

  ///轮播图
  ///[success]成功回调
  ///[fail]失败回调
  banner({
    Success<List<String>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.banner,
      dialog: false,
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          var result = <String>[];
          data['banners'].forEach((element) {
            result.add(element['pic']);
          });
          if (success != null) {
            success(result);
          }
        } else {
          if (fail != null) {
            fail(data['获取轮播图失败']);
          }
        }
      },
      fail: fail,
    );
  }

  ///推荐歌单
  ///[success]成功回调
  ///[fail]失败回调
  getRecomPlays({
    Success<List<RecomPlayListEntity>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.recomPlays,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <RecomPlayListEntity>[];
          data['recommend'].forEach((element) {
            result.add(
              RecomPlayListEntity.fromJson(element),
            );
          });
          if (success != null) {
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取推荐歌单失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///推荐新音乐
  ///[success]成功回调
  ///[fail]失败回调
  getNewSongs({
    required Success<List<NewSongEntity>> success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.newSong,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <NewSongEntity>[];
          data['result'].forEach((element) {
            result.add(
              NewSongEntity.fromJson(element),
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取推荐新音乐失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单分类列表
  ///[success]成功回调
  ///[fail]失败回调
  getPlayListCatList({
    required Success<List<String>> success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlistCatlist,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <String>[];
          data['tags'].forEach((element) {
            result.add(
              element['name'],
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取歌单分类列表失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单列表
  ///[cat]歌单分类
  ///[success]成功回调
  ///[fail]失败回调
  ///[limit]每页数量
  ///[offset]偏移量
  ///[order]排序方式order: 可选值为 'new' 和 'hot', 分别对应最新和最热 , 默认为 'hot'
  getPlayList({
    required String cat,
    required int offset,
    int limit = 21,
    required Success<List<PlayListEntity>> success,
    String order = 'hot',
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlist,
      dialog: false,
      parames: {
        'cat': cat,
        'limit': limit,
        'offset': '${offset * limit}',
        'order': order,
      },
      success: (data) {
        if (data['code'] == 200) {
          var result = <PlayListEntity>[];
          data['playlists'].forEach((element) {
            result.add(
              PlayListEntity.fromJson(element),
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取歌单列表失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单详情
  ///[id]
  ///[s]歌单最近的 s 个收藏者,默认为 8
  ///[success]成功
  ///[fail]失败
  getPlayListDetail({
    required int id,
    int? s,
    Success<PlayListDetailEntity>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
      's': s,
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.playListDetail,
      dialog: false,
      parames: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            success(
              PlayListDetailEntity.fromJson(data['playlist']),
            );
          }
        } else {
          if (fail != null) {
            fail('获取歌单详情失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单详情所有歌曲
  ///[id]
  ///[limit]
  ///[offset]
  ///[success]成功
  ///[fail]失败
  getPlayListDetailSongs({
    required int id,
    required int offset,
    int limit = 21,
    Success<List<PlayListDetailSongEntity>>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
      'limit': limit.toString(),
      'offset': '${offset * limit}',
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.playListTrackAll,
      dialog: false,
      parames: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <PlayListDetailSongEntity>[];
            data['songs'].forEach((element) {
              result.add(
                PlayListDetailSongEntity.fromJson(element),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取歌单详情失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取相关歌单推荐
  ///[id]
  ///[success]成功
  ///[fail]失败
  getRelatedPlayList({
    required int id,
    Success<List<PlayListEntity>>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.relatedPlaylist,
      dialog: false,
      parames: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <PlayListEntity>[];
            data['playlists'].forEach((element) {
              result.add(
                PlayListEntity.fromJson(element),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取相关歌单推荐失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单收藏者
  ///[id]
  ///[limit]单次获取数量
  ///[offset]偏移量
  ///[success]成功
  ///[fail]失败
  getPlayListSubscribers({
    required int id,
    required int offset,
    int limit = 21,
    Success<List<CreatorEntity>>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
      'limit': limit.toString(),
      'offset': '${offset * limit}',
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.playlistSubscribers,
      dialog: false,
      parames: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <CreatorEntity>[];
            data['subscribers'].forEach((element) {
              result.add(
                CreatorEntity.fromJson(element),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取歌单收藏者失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取每日推荐歌曲
  ///[success]成功
  ///[fail]失败
  getDailySongs({
    Success<List<PlayListDetailSongEntity>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.dailySongs,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <PlayListDetailSongEntity>[];
            data['data']['dailySongs'].forEach((element) {
              result.add(
                PlayListDetailSongEntity.fromJson(element),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取每日推荐歌曲失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取排行榜
  getRank({
    Success<List<RankEntity>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.rank,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          var topList = <RankEntity>[];
          data['list'].forEach((v) {
            topList.add(RankEntity.fromJson(v));
          });
          if (success != null) {
            success(topList);
          }
        } else {
          if (fail != null) {
            fail('获取榜单失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌曲播放链接
  ///[id]歌曲id
  ///[br]码率
  ///[success]成功
  ///[fail]失败
  getSongUrl({
    required int id,
    Success<String>? success,
  }) {
    var params = {
      'id': id.toString(),
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.songUrl,
      parames: params,
      dialog: false,
      success: (data) {
        if (success != null) {
          success(data['data'][0]['url']);
        }
      },
    );
  }

  ///获取歌曲评论
  ///[id]歌曲id
  ///[limit]单次获取数量
  ///[offset]偏移量
  ///[before]分页参数,取上一页最后一项的time获取下一页数据
  ///[success]成功
  ///[fail]失败
  getSongComment({
    required int id,
    required int offset,
    int limit = 20,
    int? before,
    Success<CommentEntity>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
      'limit': limit.toString(),
      'offset': '${offset * limit}',
      'before': before?.toString(),
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.songComment,
      parames: params,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var entity = CommentEntity.fromJson(data);
            success(entity);
          }
        } else {
          if (fail != null) {
            fail('获取歌曲评论失败');
          }
        }
      },
      fail: fail,
    );
  }
}
