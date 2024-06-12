import 'package:bezora/Screens/home.dart';
import 'package:bezora/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyBt_LNeNoWdRk1NzmjO4_OsrCB0HzZB6O4",
  //     appId: "1:733386255143:android:498f7f19479093e9f05702",
  //     projectId: "tedo-efcb9",
  //     messagingSenderId: '733386255143',
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),

      // Home(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String displayedText = ''; // Initially, the displayed text is empty.
  int currentIndex = 0; // Keeps track of the current letter being added.
  List<String> fullText = [
    'Z',
    ' ',
    'O',
    ' ',
    'R',
    ' ',
    'A',
    '',
    '',
    '',
  ]; // The full text to display.
  bool isLoading = false;
  List<double> opacities = []; // List to control the opacity of each letter.

  @override
  void initState() {
    super.initState();
    // Initialize opacities list with 0.0 (fully transparent) for each letter.
    opacities = List.filled(fullText.length, 0.0);

    // Use a Timer to add one letter at a time with a delay.
    Timer.periodic(Duration(milliseconds: 80), (timer) {
      if (currentIndex < fullText.length) {
        setState(() {
          displayedText += fullText[currentIndex];
          opacities[currentIndex] = 1.0; // Set opacity to 1.0 (fully opaque).
          currentIndex++;
        });
      } else {
        setState(() {
          isLoading = true;
        });
        loaderfunc();

        // After all letters are displayed, navigate to the main screen.
        timer.cancel();
      }
    });
  }

  void loaderfunc() async {
    await loadAll();
  }

  Future loadAll() async {
    Future.delayed(Duration(seconds: 2), () {});
    SharedPreferences prefs;

    try {
      prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString('authtoken1');
      print('success $authToken');
      isLoading = false;
      authToken != null
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    Home(), // Replace with your main screen widget.
              ),
            )
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    LoginPage(), // Replace with your main screen widget.
              ),
            );
    } catch (e) {
      print('fail $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(displayedText.length, (index) {
                  return AnimatedOpacity(
                    opacity: opacities[index],
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      displayedText[index],
                      style: GoogleFonts.lobster(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
  }
}
