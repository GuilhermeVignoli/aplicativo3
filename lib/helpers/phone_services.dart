import 'package:url_launcher/url_launcher.dart';

class PhoneServices{

  void call(String number) => launch('tel:$number');
}