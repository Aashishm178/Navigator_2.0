import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_router/pages/FirstScreen.dart';
import 'package:flutter_router/pages/SecondScreen.dart';

class MyRouteParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location);
    if (uri.path == FirstScreen.id) {
      return SynchronousFuture(FirstScreen.id);
    } else if (uri.path == SecondScreen.id) {
      return SynchronousFuture(SecondScreen.id);
    } else
      return SynchronousFuture(routeInformation.location);
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    if (configuration == FirstScreen.id) {
      return RouteInformation(location: FirstScreen.id);
    } else if (configuration == SecondScreen.id) {
      return RouteInformation(location: SecondScreen.id);
    }
    return RouteInformation(location: configuration);
  }
}
