
import 'package:al_lover_mer/screen/add_medicine_screen.dart';
import 'package:al_lover_mer/screen/add_note_screen.dart';
import 'package:al_lover_mer/screen/diary_screen.dart';
import 'package:al_lover_mer/screen/flashcard_screen.dart';
import 'package:al_lover_mer/screen/help_screen.dart';
import 'package:al_lover_mer/screen/home_screen.dart';
import 'package:al_lover_mer/screen/login_screen.dart';
import 'package:al_lover_mer/screen/note_reader.dart';
import 'package:al_lover_mer/screen/profile_screen.dart';
import 'package:al_lover_mer/screen/register_screen.dart';
import 'package:al_lover_mer/screen/logo_screen.dart';
import 'package:al_lover_mer/screen/medicine_screen.dart';
import 'package:al_lover_mer/widget/flashcard_widget.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/register": (BuildContext context) => RegisterScreen(),
  "/flashcard": (BuildContext context) => FlashcardScreen(),
  "/help": (BuildContext context) => HelpScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/medicine": (BuildContext context) => MedicineScreen(),
  "/logoscreen": (BuildContext context) => LogoScreen(),
  "/diary": (BuildContext context) => DiaryScreen(),
  "/NoteReader": (BuildContext context) => NoteReaderScreen(),
  "/Addnote": (BuildContext context) => AddnoteScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/profile": (BuildContext context) => ProfileScreen(),
  "/addmedicine": (BuildContext context) => addMedicineScreen(),

  

};
