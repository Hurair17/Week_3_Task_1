import 'package:get_it/get_it.dart';
import 'package:week_3_task/core/services/firebase_auth.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthService());
}
