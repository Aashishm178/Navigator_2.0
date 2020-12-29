import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_router/pages/FirstScreen.dart';
import 'package:flutter_router/pages/SecondScreen.dart';

class RouterProvider with ChangeNotifier {
  void addPage(String page) {
    final element = getPageData(page);
    _allPages.add(
      MyPage(
        name: element.name,
        key: ValueKey(element),
      ),
    );
    notifyListeners();
  }

  PageInfo getPageData(String data) {
    return _allPagesRouteName?.firstWhere((element) => element.name == data);
  }

  void removePage(String page) {
    if (page != null) {
      _allPages?.removeWhere((element) => element.name == page);
    }
  }

  void popPage(String page) {
    if (page != null) {
      _allPages?.removeWhere((element) => element.name == page);
      notifyListeners();
    }
  }

  void popLastPage() {
    if (_allPages.isNotEmpty) {
      _allPages?.removeLast();
      notifyListeners();
    }
  }

  List<MyPage> _allPages = List<MyPage>();
  List<MyPage> get allPages => _allPages;

  List<PageInfo> _allPagesRouteName = [
    PageInfo(
      name: FirstScreen.id,
      home: FirstScreen(),
    ),
    PageInfo(
      name: SecondScreen.id,
      home: SecondScreen(),
    ),
  ];

  List<PageInfo> initialRoute = [
    PageInfo(
      name: FirstScreen.id,
      home: FirstScreen(),
    ),
  ];

  List<PageInfo> get allPageRoute => _allPagesRouteName;

  void initializePages() {
    initialRoute.forEach((element) {
      _allPages.add(
        MyPage(
          name: element.name,
          key: ValueKey(element),
        ),
      );
    });
  }
}

class MyPage<T> extends Page<T> {
  final RouteFactory routeFactory;
  const MyPage({
    this.routeFactory,
    String name,
    LocalKey key,
  }) : super(key: key, name: name);
  @override
  Route<T> createRoute(BuildContext context) => routeFactory(this);
}

class PageInfo {
  final String name;
  final Widget home;
  PageInfo({this.name, this.home});
}
