import 'package:fitness_record/screen/diet_screen.dart';
import 'package:fitness_record/screen/fitness_screen.dart';
import 'package:fitness_record/screen/home_screen.dart';
import 'package:fitness_record/screen/profile_screen.dart';
import 'package:fitness_record/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fitness Record',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                brightness: Brightness.light,
                primary: Colors.black,
                secondary: Colors.white)),
        home: Authentication());
  }
}

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providerConfigs: [EmailProviderConfiguration()],
            );
          } else {
            return DefaultTabController(
                length: 4,
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: TabBarView(
                    children: [
                      HomeScreen(),
                      FitnessScreen(),
                      DietScreen(),
                      FitnessProfileScreen()
                    ],
                  ),
                  bottomNavigationBar: BottomBar(),
                ));
          }
        });
  }
}
