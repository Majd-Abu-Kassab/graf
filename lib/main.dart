import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_animation/screens/mapscreen.dart';
import 'screens/accountscreen.dart';
import 'package:provider/provider.dart';
import 'package:lottie_animation/screens/accountscreen.dart';
import 'package:lottie_animation/screens/homescreen.dart';
import 'package:lottie_animation/screens/login.dart';
import 'package:lottie_animation/services/authentication_service.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseApp app = await Firebase.initializeApp(
      name: 'db2',
      options: Platform.isIOS || Platform.isMacOS
          ? FirebaseOptions(
        appId: '1:792415077234:android:45e448b71826aa789293eb',
        apiKey: 'AIzaSyBB34ETGgqbdUe4LRRcNF7lmY8XWdFE7NM',
        messagingSenderId: '297855924061',
        projectId: 'flutter-firebase-plugins',
        databaseURL: 'https://hopon-6bb14-default-rtdb.firebaseio.com',
      ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          ChangeNotifier(
            create: (context) => AppData(),
          ),
          StreamProvider(
            create: (context) =>
            context.read<AuthenticationService>().authStateChanges,
          ),
        ],
        child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         home: SplashScreen(),
    ),
      );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/car_animated.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ));
        },
      ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//
//     if (firebaseUser != null) {
//       return Homescreen();
//     } else {
//       return Login();
//     }
//   }
// }

