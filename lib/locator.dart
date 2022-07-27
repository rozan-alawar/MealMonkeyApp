import 'package:get_it/get_it.dart';
import 'package:meal_monkey/models/navigation_service.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
