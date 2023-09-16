import 'package:castingcallapp/core/colors.dart';
import 'package:castingcallapp/core/constants.dart';
import 'package:castingcallapp/presentation/screens/login/profile_setup_director.dart';
import 'package:castingcallapp/presentation/screens/login/profile_setup_model.dart';
import 'package:castingcallapp/presentation/screens/login/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String userId;

  @override
  void initState() {
    super.initState();
    getUserIdFromSharedPreferences();
  }

  void getUserIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserId = prefs.getString('userId');
    if (storedUserId != null) {
      setState(() {
        userId = storedUserId;
      });
    }
  }

  void saveRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedRole', role);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: iconcolor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/logo.png"),
                kheight,
                SizedBox(
                    width: 80,
                    child: TextField(
                      controller: otpController,
                      autofocus: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 25,
                        letterSpacing: 13,
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    )),
                kheight,
                Row(
                  children: [
                    const Spacer(),
                    Container(
                        width: 150,
                        height: 35,
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
                        child: TextButton(
                            onPressed: () async {
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: SignInScreen.verify,
                                        smsCode: otpController.text);

                                // Sign the user in (or link) with the credential
                                await auth.signInWithCredential(credential);
                                saveRole('director');
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          ProfileSetupDirector()),
                                      fullscreenDialog: true),
                                );
                              } catch (e) {
                                // ignore: avoid_print
                                print("Wrong OTP");
                              }
                            },
                            child: Text(
                              'Director',
                              style: TextStyle(color: black, fontSize: 20),
                            ))),
                    const Spacer(),
                    Container(
                        width: 150,
                        height: 35,
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
                        child: TextButton(
                            onPressed: () async {
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: SignInScreen.verify,
                                        smsCode: otpController.text);

                                // Sign the user in (or link) with the credential
                                await auth.signInWithCredential(credential);
                                saveRole('model');
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          ProfileSetupModel()),
                                      fullscreenDialog: true),
                                );
                              } catch (e) {
                                // ignore: avoid_print
                                print("Wrong OTP");
                              }
                            },
                            child: Text(
                              'Model',
                              style: TextStyle(color: black, fontSize: 20),
                            ))),
                    const Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: ((context) => SignInScreen()),
                                  fullscreenDialog: true),
                              (route) => false);
                        },
                        child: Text(
                          "Edit Phone Number?",
                          style: TextStyle(
                              color: black, fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
