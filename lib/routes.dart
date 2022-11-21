import 'package:al_lover_mer/screen/flashcard_screen.dart';
import 'package:al_lover_mer/screen/help_screen.dart';
import 'package:al_lover_mer/screen/home_screen.dart';
import 'package:al_lover_mer/screen/login_screen.dart';
import 'package:al_lover_mer/screen/medicine_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/flashcard": (BuildContext context) => FlashcardScreen(),
  "/help": (BuildContext context) => HelpScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/medicine": (BuildContext context) => MedicineScreen(),
};
