import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:readerhub/books/books_view.dart';
import 'package:readerhub/rss/rss_view.dart';
import 'package:readerhub/settings/settings_view.dart';

void main() {
  runApp(const App());
}

final ThemeData defaultDarkTheme = ThemeData(
  colorScheme: .fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.blueAccent,
  ),
);

class App extends StatelessWidget {
  @Preview(textScaleFactor: 1, size: Size(350, 700))
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reader Hub',
      theme: defaultDarkTheme,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 22, 50, 98),
            title: Text('Reader Hub'),
          ),
          body: TabBarView(children: [BooksView(), RSSView(), SettingsView()]),
          bottomNavigationBar: MainTabBar(),
          floatingActionButton: MainFAB(),
        ),
      ),
    );
  }
}

class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(text: 'Books', icon: Icon(Icons.book)),
        Tab(text: 'RSS', icon: Icon(Icons.rss_feed)),
        Tab(text: 'Settings', icon: Icon(Icons.settings)),
      ],
    );
  }
}

class MainFAB extends StatelessWidget {
  const MainFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {pickBooksFolder()},
      child: Icon(Icons.add),
    );
  }
}

Future<void> pickBooksFolder() async {
  print('press button');
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['epub'],
  );
  if (result == null) return;

  final appDir = await getApplicationDocumentsDirectory();
  final saveDir = Directory(p.join(appDir.path, 'epubs'));
  if (!await saveDir.exists()) await saveDir.create(recursive: true);

  for (final path in result.paths) {
    if (path == null) continue;
    final src = File(path);
    final fileName = p.basename(path);
    final dest = File(p.join(saveDir.path, fileName));

    try {
      await src.copy(dest.path);
      print('Saved: ${dest.path}');
    } catch (e) {
      print('Error copying $path: $e');
    }
  }
}
