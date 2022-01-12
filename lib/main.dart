import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/secondscreen.dart';
import 'package:splashscreen/thirdscreen.dart';

void main() {
  runApp( MaterialApp(
      home: MyApp()));
}

class MyApp extends StatelessWidget {

  // @override
  // void initState() {
  //   getPreferences();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            child:   FlatButton(
              child: const Text('Press here'),
              onPressed:()async{
                bool value =await getVisitingFlag();
                if(value==false){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen()));
                  setVisitingFlag();
                }else{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdScreen()));

                }
              }
            ),
          ),
        ),
      );
  }

  setVisitingFlag()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('alreadyVisited', true);
  }

  getVisitingFlag()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     bool alreadyVisited=prefs.getBool('alreadyVisited')??false;
     return alreadyVisited;
  }

}
