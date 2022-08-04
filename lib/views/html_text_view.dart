import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HTMLTextView extends StatelessWidget {
  final String allText;

  HTMLTextView({Key? key, required this.allText}) : super(key: key);
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 12000, keepScrollOffset: true);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HTML Text View'),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: HtmlWidget(
                  allText,

                  // customWidgetBuilder: (element) {
                  //   element.id = 'search';
                  // },
                )),
          ],
        ),
      ),
    );
  }
}
