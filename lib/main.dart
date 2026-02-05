import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

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

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('books'));
  }
}

class RSSView extends StatelessWidget {
  const RSSView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('rss'));
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('settings'));
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
    return FloatingActionButton(onPressed: () => {}, child: Icon(Icons.add));
  }
}
