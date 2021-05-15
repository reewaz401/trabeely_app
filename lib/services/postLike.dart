import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel/services/usernameGetter.dart';

class PostLike {
  Future<void> postLike(String postId, bool isLike) async {
    print('postLike' + isLike.toString());
    var id = await UserInfo().getId();

    var userToken = await UserInfo().getToken();
    String cookie = await UserInfo().getCookie();
    String server = await UserInfo().getServer();

    var body =
        json.encode({"post_id": postId, "user_id": id, "isLike": isLike});
    final response =
        await http.post('https://api.trabeely.com/api/story/dolike',
            headers: {
              'Authorization': 'Bearer $userToken',
              'content': 'application/json; charset-utf-8',
              'Cookie': cookie,
              'Server': server
            },
            body: body);
    print(response.body);
  }
}
