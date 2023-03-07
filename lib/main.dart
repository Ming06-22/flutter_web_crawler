import "package:flutter/material.dart";
import "package:web_crawler/screens/future_builder_demo_screen.dart";
import "package:web_crawler/screens/post_screen.dart";
import "package:shared_preferences/shared_preferences.dart";

void main(){
  SharedPreferences.setMockInitialValues({});
  runApp(AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes:{
        "/remote-data": (context) => FutureBuilderDemoScreen(),
        "/post-screen": (context) => PostScreen()
      },
      initialRoute: "/post-screen",
    );
  }
}