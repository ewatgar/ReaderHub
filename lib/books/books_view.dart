import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: _buildEpubWidgetList());
  }
}

List<Widget> _buildEpubWidgetList() {
  List<Widget> epubList = [];

  for (var i = 0; i < 20; i++) {
    String text = '$i.epub';
    epubList.add(Center(child: Text(text)));
  }
  return epubList;
}
