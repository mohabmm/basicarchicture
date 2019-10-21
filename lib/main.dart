import 'package:flutter/material.dart';

import 'core/services/scaffold_service.dart';
import 'router.dart';
import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(new MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      navigatorKey: locator<ScaffoldService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan[600],
        accentColor: Colors.lightBlue[800],
      ),
      initialRoute: 'landing',
      onGenerateRoute: Router.generateRoute,
    );

//    return StreamProvider<FirebaseUser>.value(
//      value: AuthServiceModel().currentUser,
//      child: MaterialApp(
//        title: 'ChatApp',
//        navigatorKey: locator<ScaffoldService>().navigatorKey,
//        debugShowCheckedModeBanner: false,
//        theme: ThemeData(
//          primaryColor: Colors.cyan[600],
//          accentColor: Colors.lightBlue[800],
//        ),
//        initialRoute: 'landing',
//        onGenerateRoute: Router.generateRoute,
//      ),
//    );
  }
}
