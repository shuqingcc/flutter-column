import 'package:two_you_friend/util/struct/api_ret_info.dart';
import 'package:two_you_friend/util/struct/user_info.dart';
import 'package:two_you_friend/util/tools/call_server.dart';

/// 获取用户接口信息
class ApiUserInfoIndex {
  /// 根据用户id拉取用户信息
  static Future<StructUserInfo> getOneById(String id) async {
    Map<String, dynamic> retJson = await CallServer.get('userInfo', {'id': id});

    StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return null;
    }
    StructUserInfo userInfo =
        StructUserInfo.fromJson(retInfo.data as Map<String, dynamic>);
    return userInfo;
  }

  /// 获取自己的个人信息
  static Future<StructUserInfo> getSelfUserInfo() async {
    Map<String, dynamic> retJson =
        await CallServer.get('userInfo', {'id': '1002'});

    StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    if (retInfo.ret != 0 || retInfo.data == null) {
      return null;
    }
    StructUserInfo userInfo =
        StructUserInfo.fromJson(retInfo.data as Map<String, dynamic>);
    return userInfo;
  }
}
