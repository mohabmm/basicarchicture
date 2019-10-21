import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ui/views/home_view.dart';
import 'ui/views/landing_page.dart';
import 'ui/views/profile.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'homeview':
        return MaterialPageRoute(builder: (_) => HomeView());

      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile());

      case 'landing':
        return MaterialPageRoute(builder: (_) => LandingPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
