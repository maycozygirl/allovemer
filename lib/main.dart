import 'package:al_lover_mer/routes.dart';
import 'package:al_lover_mer/service/auth_service.dart';
import 'package:al_lover_mer/service/database_service.dart';
import 'package:al_lover_mer/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<DatabaseService>(create: (_) => DatabaseService()),
        Provider<StorageService>(create: (_) => StorageService()),

        ProxyProvider<DatabaseService, AuthService>(
            update: (_, dbService, __) => AuthService(dbService: dbService))
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/logoscreen',
        theme: ThemeData(fontFamily: 'TH-Chara'),
        routes: routes,
      ),
    );
  }
}
