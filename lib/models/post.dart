import "dart:convert";

class Post{
  int userId;
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  String toJsonObjectString(){
    return jsonEncode({
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body
    });
  }

  factory Post.fromJson(dynamic jsonObject){
    return Post(
      jsonObject["userId"],
      jsonObject["id"],
      jsonObject["title"],
      jsonObject["body"]
    );
  }
}