import 'package:flutter/material.dart';
import 'package:payment_app/app.dart';
import 'package:payment_app/core/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();

  runApp(const MyApp());
}
