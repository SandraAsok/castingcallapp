import 'dart:developer';

import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/login/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final countrycode = TextEditingController();
  final phoneNumberController = TextEditingController();
  static String verify = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/logo.png"),
                Container(
                  height: 65,
                  // decoration: BoxDecoration(
                  //     border: Border.all(width: 1, color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(10)),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          // color: Color.fromARGB(255, 209, 121, 226),
                          color: Colors.black,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]),
                  child: Row(
                    children: [
                      kwidth,
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countrycode,
                          keyboardType: TextInputType.phone,
                          cursorColor: black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '+91',
                          ),
                        ),
                      ),
                      const Text(
                        "|",
                        style: TextStyle(fontSize: 40, color: Colors.grey),
                      ),
                      kwidth,
                      Expanded(
                          child: TextField(
                        // onChanged: ((value) {
                        //   phone = value;
                        // }),
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        cursorColor: black,

                        style: const TextStyle(),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(),
                        ),
                      ))
                    ],
                  ),
                ),
                kheight80,
                Container(
                    width: 150,
                    height: 40,
                    decoration: signinout,
                    child: TextButton(
                        onPressed: () {
                          authFunction(context);
                        },
                        child: Text(
                          'Send OTP',
                          style: TextStyle(color: white, fontSize: 25),
                        ))),
                kheight,
              ],
            ),
          ),
        ),
      ),
    );
  }

  authFunction(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countrycode.text + phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Store the authentication status in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
      },
      verificationFailed: (FirebaseAuthException e) {
        log("verification Failed");
      },
      codeSent: (String verificationId, int? resendToken) async {
        SignInScreen.verify = verificationId;

        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: ((context) => const OTPScreen()),
              fullscreenDialog: true,
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        log("Timeout");
      },
    );
  }
}
