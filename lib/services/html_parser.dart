import 'package:http/http.dart';
import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

class HTMLParser {
  parseHTML() {
    var document =
        parse('<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!');
    print(document.children.length);
  }

  parseTheHTML(String htmlStr) {
    var document = parse(htmlStr);
    print(document.children.length);
  }
}
