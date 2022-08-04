import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../services/db_helper.dart';
import 'html_text_view.dart';

class Search extends StatelessWidget {
  DbHelper dbHelper = DbHelper();
  List<Map> searchResults = [];
  RxInt listLength = 0.obs;

  String searchedText = '';

  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                onSubmitted: (value) async => {
                  print(value),
                  searchResults = await dbHelper.getFromExistingDB(value),
                  searchedText = value,
                  listLength.value = searchResults.length,
                  print(
                      "searched list length is " + listLength.value.toString())
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.pink),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.pink, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.pink, width: 0),
                  ),
                  labelText: 'search',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: listLength.value > 0
                    ? ListView.builder(
                        itemCount: listLength.value,
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
                                    "<mark id=\"search\">$searchedText</mark>");
                                String str =
                                    "<p>Go to the<a href=\"#search\">top</a> </p>";

                                Get.to(HTMLTextView(
                                  allText: result + str,
                                ));
                              },
                            ),
                          );
                        },
                      )
                    : const Text(
                        'No results found at all',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ),
          ],
        ));
  }
}
