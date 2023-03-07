import "dart:convert";
import "package:flutter/material.dart";
import "package:web_crawler/models/post.dart";

class PostTable extends StatelessWidget{
  List<Post> posts;
  PostTable(this.posts);

  @override
  Widget build(BuildContext context){
    List<String> columnName = (jsonDecode(posts[0].toJsonObjectString()) as Map<String, dynamic>).keys.toList();
    List<DataColumn> dataColumns = columnName.map((key){
      return DataColumn(
        label: Text(key),
      );
    }).toList();

    List<DataRow> dataRows = posts.map((post){
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

    return DataTable(
      columns: dataColumns,
      rows: dataRows,
    );
  }
}