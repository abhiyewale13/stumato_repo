


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen1/widgets/custom_signup_option.dart';
import 'package:screen1/widgets/custom_text.dart';
import 'package:screen1/widgets/customize_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool value = false;

  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SvgPicture.asset("assets/images/logo.svg"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                const Row(
                  children: [
                     Text(
                      '''Welcome to HydePay,
Lets get started''',
                      style: TextStyle(
                          fontFamily: "Muli",
                          fontSize: 24,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(234, 234, 255, 1)),
                  child:  TextField(
                    controller: nameController,
                    decoration:const  InputDecoration(
                      
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(fontFamily: "Muli", fontSize: 18)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(234, 234, 255, 1)),
                  child:  TextField(
                    controller: emailController,
                    decoration:const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Enter Your Email ID",
                        hintStyle: TextStyle(fontFamily: "Muli", fontSize: 18)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    // send otp logic
                    
                  },
                  child: const CustomizeButton(
                    text: "Send OTP",
                    height: 50,
                    fontFamily: "Muli",
                    width: 160,
                    fontSize: 17,
                    color: Color.fromRGBO(92, 91, 150, 1),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "OR",
                  fontsize: 16,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.w900,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Sign up with",
                  fontsize: 16,
                  fontFamily: "Muli",
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // google login
                      },
                      child: CustomSignupOption(
                        widget: SvgPicture.asset("assets/images/google.svg"),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    GestureDetector(
                      onTap: (){
                        // apple login
                      },
                      child: CustomSignupOption(widget: AnyLogo.tech.apple.image())),
                    const SizedBox(
                      width: 18,
                    ),
                    GestureDetector(
                      onTap: (){
                        //  email login
                       
                      },
                      child: const CustomSignupOption(
                          widget: Icon(
                        Icons.email,
                        size: 30,
                      )),
                    )
                  ],
                ),
          
               const SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                        tristate: true,
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (value) {
                              value = false;
                            } else {
                              value = true;
                            }
                          });
                        }),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style:const TextStyle(
                            color: Colors.black, fontSize: 17,fontFamily: "Muli"),
                          children: [
                           const TextSpan(text: "I agree with "),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // open terms and condition link
                                },
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy.",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Open Privacy Policy link
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ])),
        ));
  }
}
