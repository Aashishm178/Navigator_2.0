import 'package:flutter/material.dart';
import 'package:flutter_router/pages/FirstScreen.dart';
import 'package:flutter_router/pages/SecondScreen.dart';
import 'package:flutter_router/route/RouteDelegate.dart';
import 'package:flutter_router/route/RouteParser.dart';
import 'package:flutter_router/route/RouterProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => RouterProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyRouterDelegate _myRouterDelegate;
  MyRouteParser _routeParser = MyRouteParser();

  @override
  void initState() {
    super.initState();
    _myRouterDelegate = MyRouterDelegate(
      routerProvider: Provider.of<RouterProvider>(context, listen: false),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/')
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => FirstScreen(),
          );
        else
          return MaterialPageRoute(
              settings: settings, builder: (context) => SecondScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeParser,
      routerDelegate: _myRouterDelegate,
    );
  }
}
