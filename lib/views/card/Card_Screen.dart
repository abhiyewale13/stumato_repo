import 'package:assignment_1/widgets/custom_text.dart';
import 'package:assignment_1/widgets/debit_card.dart';
import 'package:assignment_1/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/contact_box.dart';
import '../../widgets/custom_image_box.dart';
import '../../widgets/custom_recentbox.dart';
import '../../widgets/custom_steps_box.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 238, 244, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 238, 244, 1),
        title: SvgPicture.asset("assets/images/logo.svg"),
        actions: [
          GestureDetector(
            onTap: () {
              // notification logic
            },
            child: Container(
              height: 46,
              width: 46,
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Icon(
                Icons.notifications_active,
                color: Color.fromRGBO(150, 103, 224,1),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Row(
                children: [
                  CustomText(
                    text: "Welcome",
                    fontsize: 20,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                      text: "Tommy Jason", fontsize: 20, fontFamily: "Muli")
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                height: MediaQuery.sizeOf(context).width - 10,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: const Color.fromRGBO(150, 103, 224, 1),
                        width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const DebitCard(),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // copy hydepin logic
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Copy HydePIN",
                            fontsize: 12,
                            fontFamily: "Muli",
                            color: const Color.fromRGBO(150, 103, 224, 1),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.copy,
                            size: 10,
                            color: Color.fromRGBO(150, 103, 224, 1),
                          )
                        ],
                      ),
                    ),
                    const CustomText(
                      text: "M  2  3  H  1",
                      fontsize: 30,
                      color: Color.fromRGBO(150, 130, 224, 1),
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w900,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CustomImageBox(
                      boxbordercolor: Color.fromRGBO(150, 103, 224, 1),
                      imagepath: "assets/images/credit-card.png",
                      text: "Add Card",
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CustomImageBox(
                      boxbordercolor: Color.fromRGBO(150, 103, 224, 1),
                      imagepath: "assets/images/credit-card.png",
                      text: "Add Account",
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CustomImageBox(
                      boxbordercolor: Color.fromRGBO(150, 103, 224, 1),
                      imagepath: "assets/images/credit-card.png",
                      text: "Add Zelle ID",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const CustomText(
                    text: "Recents",
                    fontsize: 18,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w800,
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 19,
                      width: 19,
                      child: SvgPicture.asset(
                        "assets/images/filter.svg",
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomRecentbox(
                      imagepath: "assets/images/mastercard.svg",
                      nickname: "Nick Name",
                      cardnumber: "**** **** **** 0001",
                    ),
                    CustomRecentbox(
                      imagepath: "assets/images/mastercard.svg",
                      nickname: "Nick Name",
                      cardnumber: "**** **** **** 0001",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 30,
                child: const CustomText(
                  text: "Secure your Transactions in just a 4 Steps! ",
                  fontsize: 16,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
             const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomStepsBox(
                      title: "Lorem Ipsum",
                      text: "is simply dummy text of the printing "
                     
                       ,
                    ),
                    CustomStepsBox(
                      title: "Lorem Ipsum",
                      text: "is simply dummy text of the printing" 
                    ,
                    ),
                    CustomStepsBox(
                      title: "Lorem Ipsum",
                      text: "is simply dummy text of the printing "
                      
                       
                       ,
                    ),
                    CustomStepsBox(
                      title: "Lorem Ipsum",
                      text: "is simply dummy text of the printing "
                      ,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  CustomText(
                    text: "Why Pay Via HydePay?",
                    fontsize: 20,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomImageSlider(
                autoplay: false,
                aspectRatio: 2.35 / 1,
                animatedSmoothIndicator: false,
                listofimages: [
                  Image.network(
                      "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg"),
                  Image.network(
                      "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg"),
                  Image.network(
                      "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const CustomText(
                    text: "Offers for you",
                    fontsize: 20,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w900,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // view all logic
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: CustomText(
                        text: "View All >>",
                        fontsize: 20,
                        fontFamily: "Muli",
                      ),
                    ),
                  ),
                ],
              ),
              CustomImageSlider(
                autoplay: false,
                aspectRatio: 16 / 9,
                animatedSmoothIndicator: false,
                listofimages: [
                  Image.network(
                      "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg"),
                  Image.network(
                      "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg"),
                  Image.network(
                      "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg"),
                ],
              ),
              const ContactBox(),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  CustomText(
                    text: "About HydePay",
                    fontsize: 22,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text:
                    '''Hyde Pay is the world's first completely ID-less, most secured, interoperable and convenient payment mode - using the existing underlying Payment ecosystem ''',
                fontsize: 18,
                fontFamily: "Muli",
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: Image.asset(
                      "assets/images/visa.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SvgPicture.asset("assets/images/mastercard.svg"),
                  SvgPicture.asset("assets/images/Amex.svg"),
                  SvgPicture.asset("assets/images/Amex.svg"),
                ],
              ),
             const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
