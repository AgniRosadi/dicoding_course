import 'package:flutter/material.dart';
import 'package:restaurant_app/detail.dart';
import 'package:restaurant_app/main.dart';


///Routing with defined name
class AppRoute {
  static const rMain = '/';
  static const rDetail = '/home';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case rMain:
        return _buildRoute(settings, const MainPage());
      case rDetail:
        return _buildRoute(settings, const DetailPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}