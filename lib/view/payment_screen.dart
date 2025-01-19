import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/custom_otpbox.dart';
import '../components/custom_text.dart';
import '../components/customize_button.dart';
import 'editcard.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

final TextEditingController controller1 = TextEditingController();
final TextEditingController controller2 = TextEditingController();
final TextEditingController controller3 = TextEditingController();
final TextEditingController controller4 = TextEditingController();

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30,
            top: 80,
          ),
          child: Column(
            children: [
              SvgPicture.asset("assets/images/logo_hydepay.svg",),
              const SizedBox(
                height: 90,
              ),
              Container(
                width: 307,
                height: 26,
                  alignment: Alignment.center,
                  child: const CustomText(
                    text: "Tap to Login with Fingerprint",
                    fontsize: 16,
                    fontFamily: "Helvetica",
                    
                  )),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // fingerprint logic
                },
                child: SizedBox(
                    height: 80,
                    width: 80,
                    
                    child: SvgPicture.asset("assets/images/fingerprint.svg",fit: BoxFit.cover,)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 26,
                width: 307,
                child: const CustomText(
                    text: "or Enter 4-Digit Login PIN",
                    fontsize: 16,
                    fontFamily: "Helvetica",
                    
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomOtpbox(
                    controller: controller1,
                  ),
                  CustomOtpbox(
                    controller: controller2,
                  ),
                  CustomOtpbox(
                    controller: controller3,
                  ),
                  CustomOtpbox(
                    controller: controller4,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const EditCard();
                  }));

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 205,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(233, 39, 105, 1),
                              width: 2))),
                  child: const CustomText(
                    text: "Unable to login?",
                    fontsize: 22,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(233, 39, 105, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const EditCard();
                  }));
                  
                  
                },
                child: const CustomizeButton(
                  text: "Forgot Login PIN?",
                  fontSize: 16,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(233, 39, 105, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
