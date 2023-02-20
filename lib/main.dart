import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/Screens/game_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>{
static var myNewFont=GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black,letterSpacing: 3));
static var myNewFontWhite= GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Container(
                      child: Text(
                        "TIC TAC TOE",
                        style: myNewFontWhite.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: AvatarGlow(
                      endRadius: 140,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 1),
                      startDelay: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.none,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[900],
                          child: Container(
                            child: Image.asset(
                              'assets/images/logo.png',
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          radius: 80.0,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GamePage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 40, bottom: 50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'PLAY GAME',
                            style: myNewFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      child: Text(
                        "@CREATEDBYNYAMAWI",
                        style: myNewFontWhite.copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}