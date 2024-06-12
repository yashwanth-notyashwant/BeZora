import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:bezora/Screens/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class createUserScreen extends StatefulWidget {
  const createUserScreen({super.key});

  @override
  State<createUserScreen> createState() => _createUserScreenState();
}

class _createUserScreenState extends State<createUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailPasswordController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            color: Color.fromRGBO(250, 247, 247, 1),
            width: MediaQuery.of(context).size.width,
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
                    SizedBox(height: hi * 0.3),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Email id",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email address';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      child: TextFormField(
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter passcode';
                          }
                          if (value.length <= 6) {
                            return 'Min charachter count 6';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      child: TextFormField(
                        controller: contactController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Contact number",
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter contact info';
                          }
                          if (value.length != 10) {
                            return 'Please enter only 10 digit contact';
                          }
                          return null;
                        },
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      onTap: ((startLoading, stopLoading, btnState) async {
                        startLoading();
                        // if (_formKey.currentState!.validate()) {
                        //   await fetchUsers(
                        //       emailController.text.toString().trim(),
                        //       emailPasswordController.text.toString().trim(),
                        //       contactController.text.toString().trim());
                        // }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                        stopLoading();
                        return;
                      }),
                      child: const Text(
                        'Login / Create',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ), //add some styles
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchUsers(String email, String passcode, String contact) async {
    // try {
    //   final response = await http.get(
    //     Uri.parse(
    //       'https://strapi.saralgroups.com/api/users?filters[email][\$eq]=$email',
    //     ),
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //       'Content-Type': 'application/json', // Specify the content type
    //       'Accept': 'application/json',
    //     },
    //   );
    //   print(response.statusCode);
    //   print("I am here ");
    //   if (response.statusCode == 200) {
    //     print('Response received: ${response.statusCode}');
    //     print(response.body);
    //     final List responseData = json.decode(response.body);
    //     if (responseData.isEmpty) {
    //       print("all empty ");
    //       await createNewUser(email, passcode, contact);
    //       return;
    //     } else if (responseData.isNotEmpty) {
    //       Map<String, dynamic> requestBody = {
    //         "identifier": email,
    //         "password": passcode,
    //       };
    //       final response = await http.post(
    //         Uri.parse(
    //           'https://strapi.saralgroups.com/api/auth/local',
    //         ),
    //         headers: {
    //           'Authorization': 'Bearer $token',
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //         },
    //         body: json.encode(requestBody),
    //       );
    //       print(response.body);
    //       print(response.statusCode);
    //       if (response.statusCode == 200) {
    //         print("check");
    //         Map<String, dynamic> responseData = json.decode(response.body);
    //         String jwtToken = responseData['jwt'];
    //         final sharedPreferences = await SharedPreferences.getInstance();

    //         sharedPreferences.setString('authtoken', jwtToken);
    //         sharedPreferences.setString('email', email.toString());

    //         Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) => Home()),
    //         );
    //       } else if (response.statusCode == 400) {
    //         print("400 brotha");
    //         print('Wrong passcode ');
    //       }
    //     }
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

  Future<void> createNewUser(
      String email, String passcode, String contact) async {
    // try {
    //   // Generate a random password or use a library to generate a strong password

    //   // Construct the request body as a JSON object
    //   Map<String, dynamic> requestBody = {
    //     "username": email,
    //     "email": email,
    //     "password": passcode,
    //     "confirmed": false,
    //     "blocked": false,
    //     "contactNumber": contact,
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
    //     final sharedPreferences = await SharedPreferences.getInstance();

    //     sharedPreferences.setString('authtoken', "AUTHTOKEN");
    //     sharedPreferences.setString('email', email.toString());

    //     // show him screen to set some passcode

    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => Home(email: email)),
    //     );
    //   } else {
    //     throw HttpException(
    //         'Failed to create user: createNewUser ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print("Error creating user: $e");
    //   rethrow;
    // }
  }
}
