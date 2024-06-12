import 'dart:convert';
import 'dart:io';
import 'package:bezora/Screens/createUserScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_btn/loading_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'dart:ui';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _auth.authStateChanges().listen((event) {
    //   setState(() {
    //     user = event;
    //   });
    // });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    return Container(
      color: Color.fromRGBO(250, 247, 247, 1),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: hi * 0.1),
              Container(
                child: Text(
                  'ദɛ Z O R A',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: hi * 0.1),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(29),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: "Email id",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(29),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    hintText: "Passcode",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              LoadingBtn(
                height: 50,
                borderRadius: 5,
                animate: true,
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.85,
                loader: Container(
                  padding: const EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                onTap: ((startLoading, stopLoading, btnState) async {
                  startLoading();
                  await Future.delayed(Duration(seconds: 3), () {
                    print('3 seconds have passed!');
                  });
                  // call the function here
                  await handleEmailSignUp(
                    context,
                    emailController.text.toString().trim(),
                    emailPasswordController.text.toString().trim(),
                  );

                  stopLoading();
                  return;
                }),
                child: const Text(
                  'Sign up with google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ), //add some styles
              ),
              const SizedBox(height: 10.0),
              LoadingBtn(
                height: 50,
                borderRadius: 5,
                animate: true,
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.85,
                loader: Container(
                  padding: const EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                onTap: ((startLoading, stopLoading, btnState) async {
                  startLoading();

                  // call the function here
                  handleGoogleSignin();

                  stopLoading();
                  return;
                }),
                child: const Text(
                  'Sign up with google account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ), //add some styles
              ),
              SizedBox(height: hi * 0.05),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  endIndent: 10,
                )),
                Text("OR"),
                Expanded(
                    child: Divider(
                  indent: 10,
                )),
              ]),
              SizedBox(height: hi * 0.05),
              LoadingBtn(
                height: 50,
                borderRadius: 5,
                animate: true,
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.85,
                loader: Container(
                  padding: const EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                onTap: ((startLoading, stopLoading, btnState) async {
                  startLoading();

                  // call the function here
                  //createUserScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => createUserScreen()),
                  );

                  stopLoading();
                  return;
                }),
                child: const Text(
                  'Login / Create  >>',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ), //add some styles
              ),
              //
            ],
          ),
        ),
      ),
    );
  }

  void handleGoogleSignin() async {
    try {
      //   GoogleSignIn googleSignIn = GoogleSignIn();
      //   final GoogleSignInAccount? googleSignInAccount =
      //       await googleSignIn.signIn();
      //   if (googleSignInAccount != null) {
      //     GoogleSignInAuthentication googleSignInAuthentication =
      //         await googleSignInAccount.authentication;

      //     // Create a credential with the access token
      //     AuthCredential credential = GoogleAuthProvider.credential(
      //       accessToken: googleSignInAuthentication.accessToken,
      //       idToken: googleSignInAuthentication.idToken,
      //     );

      //     // Sign in to Firebase with the credential
      //     UserCredential userCredential =
      //         await FirebaseAuth.instance.signInWithCredential(credential);

      //     // Access the user and token
      //     User? user = userCredential.user;
      //     String? accessToken = await user?.getIdToken();

      //     print('Firebase Auth Token: $accessToken');
      //     print('Google Auth Token: ${googleSignInAuthentication.accessToken}');

      //     if (user != null) {
      //       print('User Email: ${user.email}');
      //       String email = user.email.toString();

      //       await fetchUsersStrapi(email, user);
      //     }
      //   }
    } catch (e) {
      print('Google Sign-In Error: $e');
    }
  }

  Future<void> createNewUser(String email, user) async {
    // late int id;
    // try {
    //   print(user.displayName);
    //   print(user.email);
    //   print(user.uid);

    //   // Generate a random password or use a library to generate a strong password

    //   // Construct the request body as a JSON object
    //   Map<String, dynamic> requestBody = {
    //     "username": user.displayName ?? user.email,
    //     "email": user.email,
    //     "password": user.uid,
    //     "confirmed": true,
    //     "blocked": false,
    //     "contactNumber": user.phoneNumber ?? "1234567890",
    //     "role": ""
    //   };

    //   final response = await http.post(
    //     Uri.parse('https://strapi.saralgroups.com/api/users/'),
    //     headers: {
    //       'Authorization': 'Bearer $token', // Specify the content type
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //     },
    //     body: json.encode(requestBody),
    //   );

    //   print("the response status code of create a new user ");
    //   print(response.statusCode);
    //   print(response.body);

    //   if (response.statusCode == 201) {
    //     try {
    //       final response = await http.get(
    //         Uri.parse(
    //           'https://strapi.saralgroups.com/api/users?filters[email][\$eq]=$email',
    //         ),
    //         headers: {
    //           'Authorization': 'Bearer $token',
    //           'Content-Type': 'application/json', // Specify the content type
    //           'Accept': 'application/json',
    //         },
    //       );
    //       print(response.statusCode);
    //       print("I am here ");
    //       if (response.statusCode == 200) {
    //         print('Response received: ${response.statusCode}');
    //         print(response.body);
    //         final List responseData = json.decode(response.body);
    //         if (responseData.isEmpty) {
    //           print("all empty ");

    //           return;
    //         } else if (responseData.isNotEmpty) {
    //           print("data found ");
    //           // Extracting the id from the first element
    //           id = responseData[0]['id'];
    //         }
    //       } else {
    //         throw HttpException(
    //             'Failed to fetch users from strai function : ${response.statusCode} ${response.body}');
    //       }
    //     } catch (e) {
    //       print("fetchUsersStrapi function ");
    //       print("Error loading users from fetchUsersStrapi: $e");
    //       rethrow;
    //     }
    //     final sharedPreferences = await SharedPreferences.getInstance();

    //     sharedPreferences.setString('authtoken', "AUTHTOKEN");
    //     sharedPreferences.setString('email', user.email.toString());

    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => PassAndContactScreen(
    //                 email: user.email,
    //                 id: id,
    //               )),
    //     );
    //   } else {
    //     throw HttpException(
    //         'Failed to create user: createNewUser ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print("Error creating user: $e");
    //   rethrow; // Rethrow for further handling
    // }
  }

  Future<void> handleEmailSignUp(
    BuildContext context,
    String email,
    String password,
  ) async {
    Future.delayed(Duration(seconds: 3), () {
      print('3 seconds have passed!');
    });
    // try {
    //   UserCredential userCredential =
    //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );

    //   User? user = userCredential.user;
    //   String? accessToken = await user?.getIdToken();

    //   print('Firebase Auth Token: $accessToken');
    //   print("this worked");

    //   await fetchUsersStrapi(email, user);
    //   return;
    // } catch (e) {
    //   print('Email Sign-Up Error (recent function): $e');
    //   return;
    // }
  }

  Future<void> fetchUsersStrapi(String email, user) async {
    // try {
    //   final response = await http.get(
    //     Uri.parse(
    //       'https://strapi.saralgroups.com/api/users?filters[email][\$eq]=$email',
    //     ),
    //     headers: {'Authorization': 'Bearer $token'},
    //   );
    //   print(response.statusCode);
    //   print("I am here ");
    //   if (response.statusCode == 200) {
    //     print('Response received: ${response.statusCode}');
    //     print(response.body);
    //     final List responseData = json.decode(response.body);
    //     if (responseData.isEmpty) {
    //       await createNewUser(email, user);
    //       return;
    //     } else if (responseData.isNotEmpty) {
    //       final sharedPreferences = await SharedPreferences.getInstance();
    //       sharedPreferences.setString('authtoken', "AUTHTOKEN");
    //       sharedPreferences.setString('email', user.email.toString());

    //       print("Hurray");
    //       print(user.email);
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => Home(email: user.email)),
    //       );
    //     }
    //     print(response.body);
    //   } else {
    //     throw HttpException(
    //         'Failed to fetch users from strai function : ${response.statusCode} ${response.body}');
    //   }
    // } catch (e) {
    //   print("fetchUsersStrapi function ");
    //   print("Error loading users from fetchUsersStrapi: $e");
    //   rethrow;
    // }
  }

  // void login(BuildContext context, VoidCallback onSuccess) async {
  //   const url = '$backend/api/core/auth/annon/';
  //   final response = await http.post(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final sharedPreferences = await SharedPreferences.getInstance();
  //     final responseBody = jsonDecode(response.body);
  //     final key = responseBody['key'];
  //     final user = responseBody['user'];
  //     sharedPreferences.setString('authtoken', key);
  //     sharedPreferences.setInt('userid', user);

  //     print('auth token: ${sharedPreferences.getString('authtoken')}');
  //     print('user id: ${sharedPreferences.getInt('userid')}');

  //     onSuccess.call();
  //   }
  // }
}
