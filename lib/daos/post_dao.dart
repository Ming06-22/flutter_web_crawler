import "package:web_crawler/models/post.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import "package:shared_preferences/shared_preferences.dart";

class PostDao{
  static Future<List<Post>> getPosts() async{
    // var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    // var response = await http.get(url);
    //
    // List<Post> posts = (jsonDecode(response.body) as List<dynamic>).map((jsonObject){
    //   return Post.fromJson(jsonObject);
    // }).toList();
    //
    // return posts;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String cacheKey = "posts";
    List<String>? postDataStringInCache = await _prefs.getStringList(cacheKey);

    if (postDataStringInCache != null){
      print("從Cache載入資料");
      List<Post> posts = postDataStringInCache.map((postJsonString) => Post.fromJson(jsonDecode(postJsonString))).toList();

      return posts;
    } else{
      print("爬資料");
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(url);

      List<Post> posts = (jsonDecode(response.body) as List<dynamic>).map((jsonObject){
        return Post.fromJson(jsonObject);
      }).toList();

      List<String> postsStringList = posts.map((e) => e.toJsonObjectString()).toList();
      _prefs.setStringList(cacheKey, postsStringList);

      return posts;
    }
  }
}