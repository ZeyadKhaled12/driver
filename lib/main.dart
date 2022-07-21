
import 'package:driver/functions/personal_detail_fun.dart';
import 'package:driver/presentation/screens/login_screen.dart';
import 'package:driver/presentation/screens/main_screen.dart';

import 'package:driver/presentation/screens/report_get_screen.dart';
import 'package:driver/providers/provider_trip.dart';
import 'package:driver/providers/provider_user_details.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ProviderUserDetails()
        ),
        ChangeNotifierProvider(
            create: (_) => ProviderTrip()
        ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //PersonalDetailFun _personalFun = PersonalDetailFun();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0XFFFFAB4C),
        textSelectionTheme: const TextSelectionThemeData(selectionColor
            : Colors.black),
      ),
      routes: {
        '/': (context) => StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapShot){
          if(snapShot.hasData) {
          //  _personalFun.getUserDetails(ctx: ctx);
            return const MainScreen();
          }
          else{
            return const LoginScreen();
          }
        }),
        ReportGetScreen.route: (context) => const ReportGetScreen()
      },


    );
  }
}

