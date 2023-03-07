import "dart:convert";
import "package:flutter/material.dart";
import "package:web_crawler/daos/post_dao.dart";
import "package:web_crawler/models/post.dart";

class PostText extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: PostDao.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> asyncSnapshot){
        List<Widget> widgets = [];
        print(asyncSnapshot.connectionState);
        print(asyncSnapshot.hasData);
        if (asyncSnapshot.connectionState == ConnectionState.done){
          widgets = asyncSnapshot.requireData.map((post){
            return Text(post.toJsonObjectString());
          }).toList();
        }

        return SingleChildScrollView(
          child: Column(
            children: widgets
          ),
        );
      }
    );
  }
}