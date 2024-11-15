import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_app.dart';
import 'package:todo_app/providers/language_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();

  runApp(MultiProvider(  providers: [
      ChangeNotifierProvider(
      create: (context) => ThemeProvider()..getTheme(),
  ),
  ChangeNotifierProvider(
  create: (context) => LanguageProvider()..getLang(),
  )
  ],
  child: const MyApp()));
}




