import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/presentation/screens/director/screens/dir_mainpage.dart';
import 'package:castingcallapp/presentation/screens/model/modelmainpage.dart';
import 'package:castingcallapp/presentation/screens/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String savedRole;

  @override
  void initState() {
    super.initState();
    getSavedRole();
  }

  void getSavedRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('selectedRole');
    if (role != null) {
      setState(() {
        savedRole = role;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            iconTheme: IconThemeData(color: black),
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  if (savedRole == 'director') {
                    return const DirMainPage();
                  } else if (savedRole == 'model') {
                    return ModelMainPage();
                  }
                } else {
                  return const SplashScreen();
                }
              }
              return const Text("");
            },
          ),
        );
      },
    );
  }
}
