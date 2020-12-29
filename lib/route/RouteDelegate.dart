import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_router/route/RouterProvider.dart';

class MyRouterDelegate extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  MyRouterDelegate({@required this.routerProvider, this.onGenerateRoute})
      : assert(routerProvider != null),
        navigatorKey = GlobalObjectKey<NavigatorState>(routerProvider) {
    this.routerProvider.addListener(() {
      notifyListeners();
    });
  }
  final RouterProvider routerProvider;
  final RouteFactory onGenerateRoute;

  @override
  void dispose() {
    routerProvider.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  String get currentConfiguration => routerProvider.allPages.isNotEmpty
      ? routerProvider.allPages.last.name
      : null;

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    print('Popping');
    if (routerProvider.allPages.isNotEmpty) {
      if (routerProvider.allPages.last.name == route.settings.name) {
        routerProvider.popPage(route.settings.name);
        notifyListeners();
      }
    }
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    print('Stack ${routerProvider.allPages}');
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        for (final name in routerProvider.allPages)
          MyPage(
            routeFactory: onGenerateRoute,
            name: name.name,
            key: name.key,
          ),
      ],
    );
  }

  @override
  Future<void> setInitialRoutePath(String configuration) {
    routerProvider.allPages?.clear();
    routerProvider.initializePages();
    return SynchronousFuture<void>(null);
  }

  @override
  GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<void> setNewRoutePath(String configuration) {
    assert(configuration != null);
    routerProvider.addPage(configuration);
    return SynchronousFuture<void>(null);
  }
}
