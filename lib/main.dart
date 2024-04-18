import 'package:fitness_nutrition/src/core/app.dart';
import 'package:fitness_nutrition/src/core/utility/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}
