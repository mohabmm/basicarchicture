import 'package:basicarchicture/core/services/firebase_service.dart';
import 'package:get_it/get_it.dart';

import 'core/services/scaffold_service.dart';
import 'core/viewmodels/authntication_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerSingleton(ScaffoldService());
  locator.registerSingleton(AuthServiceModel());
}
