
import 'package:get_it/get_it.dart';
import 'package:memstuff/helpers/phone_services.dart';

final GetIt locator = GetIt.I;

void setupLocator(){
  locator.registerSingleton<PhoneServices>(PhoneServices());
}
