import 'package:flutter/material.dart';
import 'package:math_app/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Game Sloppy Copy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Math: The Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _gamePage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyGamePage(title: 'Game')),
      );
    });
  }

  void _settingsPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MySettingsPage(title: 'Settings')
        ),
      );
    });
  }

  void _controlsPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyControlsPage(title: 'Controls')
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Game Logo Here',
            ),
            ElevatedButton(
              onPressed: _gamePage,
              child: const Text('Continue'),
            ),
            ElevatedButton(
              onPressed: _gamePage,
              child: const Text('New Game'),
            ),
            ElevatedButton(
              onPressed: _controlsPage,
              child: const Text('How to Play'),
            ),
            ElevatedButton(
              onPressed: _settingsPage,
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyGamePage extends StatefulWidget {
  MyGamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyGamePageState createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {
  @override
  var num1 = Random().nextInt(10);
  var num2 = Random().nextInt(10);
  var mainNum = 0;

  Widget build(BuildContext context) {
    mainNum = num1 + num2;

    String n1 = num1.toString();
    String n2 = num2.toString();
    String mn = mainNum.toString();

    bool checkWin() {
      if((op == "+") && (mainNum==num1+num2)){
        return true;
      }

      if((op == "-") && (mainNum==num1-num2)){
        return true;
      }
      return false;
    }

    void reset() {  

      int rng = Random().nextInt(2);

      if(rng == 0){
        num1 = Random().nextInt(10);
        num2 = Random().nextInt(num1);
        mainNum = num1 - num2;
      }

      else {
        num1 = Random().nextInt(10);
        num2 = Random().nextInt(10);
        mainNum = num1 + num2;
      }

      n1 = num1.toString();
      n2 = num2.toString();
      mn = mainNum.toString();
      op = "";
    }

    void callBack() {
      setState(() {
        if(checkWin() == true){
          reset();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      backgroundColor: Colors.red[700],
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex:3),
            MainNumCard(inText: mn,),
            Spacer(flex:2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                NumCard(inText: n1,),
                Spacer(),
                OpCard(inText: op),
                Spacer(),
                NumCard(inText: n2,),
                Spacer()
              ],
            ),
            Spacer(flex:4),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: <Widget>[
                    OpButton(
                      inText: "-",
                      tapDown: (){ callBack(); }
                    ),
                    SizedBox(
                      height:20,
                      width:20
                    ),
                    OpButton(
                      inText: "+",
                      tapDown: (){ callBack(); }
                    ),
                  ],
                ),
                SizedBox(
                  height:20,
                  width:20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    OpButton(
                      inText: "x",
                      tapDown: (){ callBack(); }
                    ),
                    SizedBox(
                      height:20,
                      width:20
                    ),
                    OpButton(
                      inText: "/",
                      tapDown: (){ callBack(); }
                    ),
                  ],
                )
              ]
            ),
            Spacer(flex:3),
          ]
        ),
      
      )
    );
  }
}

class MyControlsPage extends StatefulWidget {
  MyControlsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyControlsPageState createState() => _MyControlsPageState();
}

class _MyControlsPageState extends State<MyControlsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls'),
      ),
    );
  }
}

class MySettingsPage extends StatefulWidget {
  MySettingsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
    );
  }
}