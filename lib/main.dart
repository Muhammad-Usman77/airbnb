import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reci/Provider/theme_provider.dart';


import 'package:reci/auth/str_builder.dart';
import 'package:reci/firebase_options.dart';
import 'package:reci/screenBnb/providerforbnb/favorite_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          
          ChangeNotifierProvider(create: (_) =>  FavoritePro()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChnager>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              darkTheme: ThemeData.dark(),
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: AuthServices());
        }));
  }
}
