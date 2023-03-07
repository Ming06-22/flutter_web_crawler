import "dart:convert";
import "package:flutter/material.dart";
import "package:web_crawler/models/post.dart";

class PostTableWithSearch extends StatefulWidget{
  List<Post> posts;
  PostTableWithSearch(this.posts);

  @override
  State createState(){
    return _PostTableWithSearch();
  }
}

class _PostTableWithSearch extends State<PostTableWithSearch>{
  List<Post> filteredPosts = [];
  void changeFilteredPosts(String userInput){
    filteredPosts = this.widget.posts.where((element){
      if (userInput == ""){
        return true;
      } else{
        return false;
      }
    }).toList();

    if (filteredPosts.length == 0){
      filteredPosts.add(Post(999, 999, "查無資料", "查無資訊"));
    }
  }

  @override
  Widget build(BuildContext context){
    if (filteredPosts.length == 0){
      changeFilteredPosts("");
    }

    var searchTextEditingController = TextEditingController();

    Widget searchBar = TextField(
      controller: searchTextEditingController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter a search term"
      ),
      onSubmitted: (inputStr){
        setState((){
          changeFilteredPosts(inputStr);
        });
      },
    );

    List<String> columnName = (jsonDecode(filteredPosts[0].toJsonObjectString()) as Map<String, dynamic>).keys.toList();
    List<DataColumn> dataColumns = columnName.map((key){
      return DataColumn(
        label: Text(key),
      );
    }).toList();

    List<DataRow> dataRows = filteredPosts.map((post){
      Map<String, dynamic> postJson = jsonDecode(post.toJsonObjectString()) as Map<String, dynamic>;
      List<DataCell> dataCells = columnName.map((key){
        return DataCell(
          Text(postJson[key].toString())
        );
      }).toList();

      return DataRow(
        cells: dataCells
      );
    }).toList();

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 800,
              child: searchBar,
            ),
            Container(
              width: 800,
              child: DataTable(
                columns: dataColumns,
                rows: dataRows,
              )
            ),
          ],
        ),
      )
    );
  }
}