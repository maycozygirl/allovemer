import 'package:al_lover_mer/screen/flashcard_screen.dart';
import 'package:al_lover_mer/screen/help_screen.dart';
import 'package:al_lover_mer/screen/home_screen.dart';
import 'package:al_lover_mer/screen/register_screen.dart';
import 'package:al_lover_mer/screen/logo_screen.dart';
import 'package:al_lover_mer/screen/medicine_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/register": (BuildContext context) => RegisterScreen(),
  "/flashcard": (BuildContext context) => FlashcardScreen(),
  "/help": (BuildContext context) => HelpScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/medicine": (BuildContext context) => MedicineScreen(),
  "/logoscreen": (BuildContext context) => LogoScreen(),
};
