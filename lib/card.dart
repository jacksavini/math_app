import 'package:flutter/material.dart';

var op = "-";

class NumCard extends StatelessWidget {
  const NumCard({super.key, required this.inText});
  final String inText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromARGB(255, 122, 170, 243),
          width:5
        ),
      ),
      height: 100, 
      width: 100,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          inText,
          style: const TextStyle(
            fontSize: 60, 
            fontWeight: FontWeight.w800
          )
        )
      ),
    );
  }
}

class MainNumCard extends StatelessWidget {
  const MainNumCard({super.key, required this.inText});
  final String inText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(255, 255, 237, 77),
          width:10
        ),
      ),
      height: 130, 
      width: 130,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          inText,
          style: const TextStyle(
            fontSize: 100, 
            fontWeight: FontWeight.w800
          )
        )
      ),
    );
  }
}

class OpCard extends StatefulWidget {
  const OpCard({super.key});

  State<OpCard> createState() => _OpCardState();
}

class _OpCardState extends State<OpCard> {
  var inText = "-";

  void _chageOp(){
    setState(() {
      inText = op;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.black,
          width:5,
        ),
      ),
      height: 70, 
      width: 70,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          inText,
          style: const TextStyle(
            fontSize: 40, 
            fontWeight: FontWeight.w800
          )
        )
      )
    );
  }
}

class OpButton extends StatelessWidget {
  const OpButton({super.key, required this.inText});
  final String inText;

  @override
  Widget build(BuildContext context) {
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
          color: Colors.red[300]
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            inText,
            style: const TextStyle(
              fontSize: 50, 
              fontWeight: FontWeight.w800,
              color:Color.fromARGB(255, 255, 255, 255),
            )
          )
        )
      ),
      onTap: () {
        op = inText;
        print(inText);
      },
    );
  }
}
