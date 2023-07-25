import 'package:flutter/material.dart';

bool mulable = false;
bool divable = false;
bool addable = true;
bool minable = true;

class OpToggle extends StatefulWidget {
  const OpToggle({super.key, required this.inText, required this.tapDown});
  final String inText;
  final Function tapDown;

  @override
  State<OpToggle> createState() => _OpToggleState();
}

class _OpToggleState extends State<OpToggle> {
  var numOps = 0;
  void setCol(){
    if(widget.inText == "+"){
      if(addable){
        col = Colors.green;
      }
      else{
        col = Colors.red;
      }
    }

    if(widget.inText == "-"){
      if(minable){
        col = Colors.green;
      }
      else{
        col = Colors.red;
      }
    }

    if(widget.inText == "÷"){
      if(divable){
        col = Colors.green;
      }
      else{
        col = Colors.red;
      }
    }

    if(widget.inText == "x"){
      if(mulable){
        col = Colors.green;
      }
      else{
        col = Colors.red;
      }
    }
  }

  var col = Colors.red[300];

  @override
  
  Widget build(BuildContext context) {
    setCol();
    return InkWell(
      child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: col
            ),
          child: Container(
              alignment: Alignment.center,
              child: Text(widget.inText,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )))),
      onTap: () {
        numOps = 0;

        if(addable || (!addable && widget.inText == "+")){numOps+=1;}
        if(minable || (!minable && widget.inText == "-")){numOps+=1;}
        if(divable || (!divable && widget.inText == "÷")){numOps+=1;}
        if(mulable || (!mulable && widget.inText == "x")){numOps+=1;}

        if(numOps > 2){
          if(widget.inText == "+"){
            addable = !addable;
          }

          if(widget.inText == "-"){
            minable = !minable;
          }

          if(widget.inText == "x"){
            mulable = !mulable;
          }

          if(widget.inText == "÷"){
            divable = !divable;
          }
          setCol();
          this.widget.tapDown();
        }
      },
    );
  }
}
