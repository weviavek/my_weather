import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/firebase_options.dart';
import 'my_app.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
}

