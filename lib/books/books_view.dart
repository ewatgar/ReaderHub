import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return EpubViewerWidget();
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

class EpubViewerWidget extends StatelessWidget {
  const EpubViewerWidget({super.key});

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
