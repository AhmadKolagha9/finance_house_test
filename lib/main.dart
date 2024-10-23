import 'package:finance_house_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utlis/injection.dart';

void main() async{
  await iniGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
   runApp(const App());
}


