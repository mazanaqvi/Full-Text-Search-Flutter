import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sqlite_search/views/html_text_view.dart';
import 'package:sqlite_search/views/text_view.dart';

class SearchResult extends StatelessWidget {
  final List<Map> searchResults;
  final String searchedText;
  const SearchResult(
      {Key? key, required this.searchResults, required this.searchedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Results'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100,
                  child: ListTile(
                    title: Html(
                      data: searchResults[index]['displayStr'],
                      //shrinkWrap: true,
                    ),
                    onTap: () {
                      String allText =
                          searchResults[index]['fullText'].toString();
                      String result = allText.replaceAll(searchedText,
                          "<mark><div id=\"search\">$searchedText</div></mark> ");
                      String str =
                          "<p>Go to the<a href=\"#search\">top</a> </p>";
                      String lorem = "<p id=\"Lorem_Ipsum\">Lorem Ipsum</p>";

                      Get.to(HTMLTextView(
                        allText: lorem + result + str,
                      ));
                    },
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
