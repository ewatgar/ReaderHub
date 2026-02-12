import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BooksList();
  }
}

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> epubList = [];

    for (var i = 0; i < 20; i++) {
      String text = '$i.epub';
      epubList.add(BookItem(text: text));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(children: epubList),
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          minimumSize: Size(3, 23),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Text(style: TextStyle(fontSize: 30), text),
      ),
    );
  }
}

class EpubReader extends StatelessWidget {
  const EpubReader({super.key});

  @override
  Widget build(BuildContext context) {
    final epubController = EpubController();

    return EpubViewer(
      epubSource: EpubSource.fromUrl(
        'https://github.com/IDPF/epub3-samples/releases/download/20230704/accessible_epub_3.epub',
      ),
      epubController: epubController,
      displaySettings: EpubDisplaySettings(
        flow: EpubFlow.paginated,
        snap: true,
        theme: EpubTheme.light(),
      ),
      onChaptersLoaded: (chapters) {
        // Handle chapters loaded
      },
      onEpubLoaded: () async {
        // Handle epub loaded
      },
      onRelocated: (value) {
        // Handle page change
      },
      onTextSelected: (epubTextSelection) {
        print(epubTextSelection.selectedText);
        // Handle text selection
      },
    );
  }
}
