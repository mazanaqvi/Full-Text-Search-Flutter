class StringParser {
  StringParser();
  parseOnWord(
    String text,
    String term,
  ) {
    if (text == null || term == null) return null;
    text = text.toLowerCase();
    term = term.toLowerCase();
    int idx = text.indexOf(term);
    if (idx < 0) return null;
    int start = idx;
    int end = idx + term.length;
    return [start, end];
  }
}
