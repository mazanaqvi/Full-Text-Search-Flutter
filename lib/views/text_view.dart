import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:substring_highlight/substring_highlight.dart';

class TextView extends StatelessWidget {
  final String allText;
  const TextView({Key? key, required this.allText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextView'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SubstringHighlight(
              text: allText, // search result string from database or something
              term: "عقل",
              textAlign: TextAlign.right,
              textStyleHighlight: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.pink,
                decoration: TextDecoration.underline,
              ), // user typed "et"
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.vertical, //.horizontal
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       allText,
          //       style: TextStyle(
          //         fontSize: 16.0,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
