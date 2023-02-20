import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var ohScore=0;
  var exScore=0;
  var filledBoxes=0;

  static var myNewFont=GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black,letterSpacing: 3));
  static var myNewFontWhite= GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));

  bool OhTurn=true; // First Player to play is O
  List<String> displayExOh=["","","","","","","","",""];
  @override
  Widget build(BuildContext context) {
    var myTextStyle= TextStyle(color: Colors.white,fontSize: 30);
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(child: Container(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Player O",style: myNewFontWhite),
                      SizedBox(height: 10,),
                      Text(ohScore.toString(),style: myNewFontWhite),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Player X",style: myNewFontWhite),
                      SizedBox(height: 10,),
                      Text(exScore.toString(),style: myNewFontWhite),
                    ],
                  ),
                )
              ],
            )
          ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: (){
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)
                    ),
                  child: Center(
                  child: Text(displayExOh[index],style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white
                  ),),
                  ),
                  ),
                );
    },
            ),
          ),
          Expanded(child: Container(
            child: Center(
              child: Column(
                children: [
                  Text("TIC TAC TOE",style: myNewFontWhite,),
                  SizedBox(height: 40),
                  Text("@CREATEDBYNYAMAWI",style: myNewFontWhite,)
                ],
              ),
            ),
          )),
        ],
      )
    );
  }
  void _tapped(int index){
   setState(() {
     if(OhTurn && displayExOh[index]==""){
       displayExOh[index]="O";
       filledBoxes+=1;
     }else if (!OhTurn && displayExOh[index]==""){
       displayExOh[index]="X";
       filledBoxes+=1;
     }
     OhTurn=!OhTurn;
     _checkWinner();
   });
  }

  void _checkWinner(){
      if(displayExOh[0]==displayExOh[1] &&
          displayExOh[0]==displayExOh[2] &&
          displayExOh[0]!=""
      )
     {
       _showInDialog(displayExOh[0]);
     }

      if(displayExOh[3]==displayExOh[4] &&
          displayExOh[3]==displayExOh[5] &&
          displayExOh[3]!=""
      )
      {
        _showInDialog(displayExOh[3]);
      }

      if(displayExOh[6]==displayExOh[7] &&
          displayExOh[6]==displayExOh[8] &&
          displayExOh[6]!=""
      )
      {
        _showInDialog(displayExOh[6]);
      }

      if(displayExOh[0]==displayExOh[3] &&
          displayExOh[0]==displayExOh[6] &&
          displayExOh[0]!=""
      )
      {
        _showInDialog(displayExOh[0]);
      }

      if(displayExOh[1]==displayExOh[4] &&
          displayExOh[1]==displayExOh[7] &&
          displayExOh[1]!=""
      )
      {
        _showInDialog(displayExOh[1]);
      }

      if(displayExOh[2]==displayExOh[5] &&
          displayExOh[2]==displayExOh[8] &&
          displayExOh[2]!=""
      )
      {
        _showInDialog(displayExOh[2]);
      }

      if(displayExOh[0]==displayExOh[1] &&
          displayExOh[0]==displayExOh[2] &&
          displayExOh[0]!=""
      )
      {
        _showInDialog(displayExOh[0]);
      }

      if(displayExOh[0]==displayExOh[4] &&
          displayExOh[0]==displayExOh[8] &&
          displayExOh[0]!=""
      )
      {
        _showInDialog(displayExOh[0]);
      }

      if(displayExOh[2]==displayExOh[4] &&
          displayExOh[2]==displayExOh[6] &&
          displayExOh[2]!=""
      )
      {
        _showInDialog(displayExOh[2]);
      }
      else if(filledBoxes==9){
        _showDrawDialog();
      }

  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("DRAW"),
            actions: [
              TextButton(
                  child: Text("Play Again"),
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  }
              )
            ],
          );
        });
  }
  void _showInDialog( String winner){
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Winner is :  "+ winner),
              actions: [
             TextButton(
               child: Text("Play Again"),
               onPressed: (){
                 _clearBoard();
                 Navigator.of(context).pop();
               }
             )
              ],
            );
          });
      if (winner=="O"){
        ohScore+=1;
      }else if(winner=="X"){
        exScore+=1;
      }
  }
  void _clearBoard(){
setState(() {
  for(int i=0;i<9; i++){
    displayExOh[i]="";
  }
});
filledBoxes=0;
}
}
