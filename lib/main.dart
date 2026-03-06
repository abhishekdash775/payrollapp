import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payrollapp/app.dart';
import 'package:payrollapp/core/database/product_database.dart';
import 'package:payrollapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); 
  await ProductDatabase.database; 
  runApp(const App());
}
