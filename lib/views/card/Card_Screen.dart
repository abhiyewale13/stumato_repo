import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stumatoxpay_march/widgets/image_slider.dart';

import '../../widgets/balance_box.dart';
import '../../widgets/contact_box.dart';

import '../../widgets/custom_shop_redeem.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/debit_card.dart';
import '../../widgets/generate_pin.dart';
import '../../widgets/invite_box.dart';
import '../../widgets/quick_link_box.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 238, 244, 1),
        title: SvgPicture.asset("assets/images/logo.svg"),
        actions: [
          GestureDetector(
            onTap: () {
              // notification logic
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(241, 239, 255, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.notifications_active,
                  color: Color.fromRGBO(150, 103, 224, 1),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CustomText(
                    text: "Welcome",
                    fontsize: 20,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(width: 5),
                  CustomText(
                    text: "Tommy Jason",
                    fontsize: 20,
                    fontFamily: "Muli",
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const DebitCard(),
              const SizedBox(height: 10),
              Row(
                children: [
                  CustomAvailableBalance(),
                  SizedBox(width: 10,),
                  GenerateHydePayPin(),
                ],
              ),
              const CustomQuickLinksBox(),
            const  CustomShopRedeem(),
            SizedBox(height: 10,),
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
                    "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg",
                  ),
                  Image.network(
                    "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg",
                  ),
                  Image.network(
                    "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg",
                  ),
                ],
              ),
             const CustomInviteBox(),
              const ContactBox(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15
                ),
                child: CustomText(
                       text: "Why Pay via HydePay",
                      fontsize: 20,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w900,
                
                ),
              ),
              CustomImageSlider(
                autoplay: false,
                aspectRatio: 22 / 9,
                animatedSmoothIndicator: false,
                listofimages: [
                  Image.network(
                    "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg",
                  ),
                  Image.network(
                    "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg",
                  ),
                  Image.network(
                    "https://i.pinimg.com/originals/a3/cc/33/a3cc3358214bb16d0406831ebf08aa67.jpg",
                  ),
                ],
              ),
             
              const SizedBox(height: 15),
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
              const SizedBox(height: 10),
              const CustomText(
                text:
                    '''Hyde Pay is the world's first completely ID-less, most secured, interoperable and convenient payment mode - using the existing underlying Payment ecosystem ''',
                fontsize: 18,
                fontFamily: "Muli",
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 65,
                    child: Image.asset(
                      "assets/images/visa.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 65,
                    child: Image.asset(
                      "assets/images/visa.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 65,
                    child: Image.asset(
                      "assets/images/visa.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                 Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 65,
                    child: Image.asset(
                      "assets/images/visa.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
