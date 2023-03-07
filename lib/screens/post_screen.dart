import "package:flutter/material.dart";
import "package:web_crawler/components/post_table_with_search.dart";
import "package:web_crawler/components/post_table_with_search_and_edit.dart";
import "package:web_crawler/daos/post_dao.dart";
import "package:web_crawler/models/post.dart";

class PostScreen extends StatefulWidget {
  @override
  State createState() {
    return _PostScreen();
  }
}

class _PostScreen extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PostDao.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> asyncOfPosts){
        return Scaffold(
          body: PostTableWithSearchEdit(asyncOfPosts.requireData),
        );
      }
    );
  }
}