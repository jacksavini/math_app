import 'package:flutter/material.dart';
import 'package:math_app/card.dart';
import 'package:math_app/settingsButtons.dart';
import 'package:num_to_words/num_to_words.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'dart:async';

FlutterTts flutterTts = FlutterTts();
var tts = true;
var ttsVolume = 1.0;

void main() {
  runApp(MyApp());
}

Future<int> delayedNumber() async {
  return 2;
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
            builder: (context) => MySettingsPage(title: 'Settings')),
      );
    });
  }

  void _controlsPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyControlsPage(title: 'Controls')),
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
              '',
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: _gamePage,
                child: const Text('Continue'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: _gamePage,
                child: const Text('New Game'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: _controlsPage,
                child: const Text('How to Play'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: _settingsPage,
                child: const Text('Settings'),
              ),
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
  speak(String text) async {
    if(tts){
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }

  var num1 = 0;
  var num2 = 0;
  var mainNum = 0;

  bool mul = false;
  bool div = false;
  bool add = true;
  bool sub = true;

  bool firstEq = true;

  var n1Text = false;
  var n2Text = false;
  var n3Text = false;

  var opCode = {"+": "plus", "-": "minus", "x": "times", "÷": "divided by"};

  Color bgCol = Color.fromARGB(255, 211, 47, 47);

  Widget build(BuildContext context) {
    mul = mulable;
    div = divable;
    add = addable;
    sub = minable;

    bool checkWin() {
      if ((op == "+") && (mainNum == num1 + num2)) {
        return true;
      }

      if ((op == "-") && (mainNum == num1 - num2)) {
        return true;
      }

      if ((op == "x") && (mainNum == num1 * num2)) {
        return true;
      }

      if ((op == "÷") && (num1 == mainNum * num2)) {
        return true;
      }

      return false;
    }

    void reset() {
      int rng = Random().nextInt(4);

      while (rng == 0 && !sub ||
          rng == 1 && !add ||
          rng == 2 && !mul ||
          rng == 3 && !div) {
        rng = Random().nextInt(4);
      }

      if (rng == 0 && sub) {
        num1 = Random().nextInt(9) + 1;
        num2 = Random().nextInt(num1) + 1;
        mainNum = num1 - num2;
      }

      if (rng == 1 && add) {
        num1 = Random().nextInt(10);
        num2 = Random().nextInt(10);
        mainNum = num1 + num2;
      }

      if (rng == 2 && mul) {
        num1 = Random().nextInt(10);
        num2 = Random().nextInt(10);
        mainNum = num1 * num2;
      }

      if (rng == 3 && div) {
        num2 = Random().nextInt(9) + 1;
        mainNum = Random().nextInt(9) + 1;
        num1 = num2 * mainNum;
      }

      op = " ";
    }

    if (firstEq) {
      reset();
      firstEq = false;
    }

    void callBack() {
      print(op);
      setState(() {
        if (checkWin() == true) {
          var temp = opCode[op] ?? 'default';
          speak(num1.toWords() +
              temp +
              num2.toWords() +
              "equals" +
              mainNum.toWords());
          setState(() {
            bgCol = Color.fromARGB(255, 27, 171, 27);
          });

          Future.delayed(const Duration(milliseconds: 1500), () {
            // Here you can write your code
            setState(() {
              bgCol = Color.fromARGB(255, 211, 47, 47);
              reset();
              // Here you can write your code for open new view
            });
          });
        }
      });
    }

    List<Widget> _createRow1Children() {
      List<Widget> r1 = [];

      if (add) {
        r1.add(OpButton(
            inText: "+",
            tapDown: () {
              callBack();
            }));
      }

      if (sub && add) {
        r1.add(SizedBox(height: 20, width: 20));
      }

      if (sub) {
        r1.add(OpButton(
            inText: "-",
            tapDown: () {
              callBack();
            }));
      }

      return r1;
    }

    List<Widget> _createRow2Children() {
      List<Widget> r2 = [];

      if (mul) {
        r2.add(OpButton(
            inText: "x",
            tapDown: () {
              callBack();
            }));
      }

      if (div && mul) {
        r2.add(SizedBox(height: 20, width: 20));
      }

      if (div) {
        r2.add(OpButton(
            inText: "÷",
            tapDown: () {
              callBack();
            }));
      }

      return r2;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
        ),
        backgroundColor: bgCol,
        body: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                MainNumCard(
                  tapDown: () {
                    setState(() {
                      n3Text = !n3Text;
                      speak(mainNum.toWords());
                      });
                  },
                  inText: n3Text ? mainNum.toString() : mainNum.toWords(),
                ),
                Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    NumCard(
                      tapDown: () {
                        setState(() {
                          n1Text = !n1Text;
                          speak(num1.toWords());
                          });
                      },
                      inText: n1Text ? num1.toString() : num1.toWords(),
                    ),
                    Spacer(),
                    OpCard(inText: op),
                    Spacer(),
                    NumCard(
                      tapDown: () {
                        setState(() {
                          n2Text = !n2Text;
                          speak(num2.toWords());
                          });
                      },
                      inText: n2Text ? num2.toString() : num2.toWords(),
                    ),
                    Spacer()
                  ],
                ),
                Spacer(flex: 4),
                Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _createRow1Children(),
                      ),
                      SizedBox(height: 20, width: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _createRow2Children())
                    ]),
                Spacer(flex: 3),
              ]),
        ));
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
  void callBack() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Spacer(flex: 1),
          const Text(
              textAlign: TextAlign.center,
              "Voice Lines",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
                textAlign: TextAlign.center,
                "OFF",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 150, 150, 150),
                )),
            SizedBox(
                width: 130,
                height: 100,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                      value: tts,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        setState(() {
                          tts = value;
                        });
                      }),
                )),
            const Text(
                textAlign: TextAlign.center,
                "ON",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 150, 150, 150),
                ))
          ]),
          Spacer(flex: 1),
          const Text("Operation Select",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OpToggle(
              inText: "+",
              tapDown: () {
                callBack();
              },
            ),
            OpToggle(
              inText: "-",
              tapDown: () {
                callBack();
              },
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OpToggle(
              inText: "x",
              tapDown: () {
                callBack();
              },
            ),
            OpToggle(
              inText: "÷",
              tapDown: () {
                callBack();
              },
            ),
          ]),
          Spacer(flex: 1),
          const Text("Sound Volume",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
          Container(
            width: 300,
            child: Slider(
              value: ttsVolume,
              max: 100,
              divisions: 100,
              label: ttsVolume.round().toString(),
              onChanged: (double value) {
                setState(() {
                  ttsVolume = value;
                  flutterTts.setVolume(ttsVolume/100.0);
                  
                });
              },
            ),
          ),
          Spacer(flex: 1),
        ])));
  }
}
