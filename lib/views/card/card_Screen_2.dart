import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stumatoxpay_march/views/Transaction/transaction_history.dart';
import 'package:stumatoxpay_march/widgets/debit_card_2.dart';
import 'package:stumatoxpay_march/widgets/image_slider.dart';
import 'package:stumatoxpay_march/widgets/quicklink2.dart';
import 'package:stumatoxpay_march/widgets/shop_redeem2.dart';

import '../../widgets/contact_box.dart';


import '../../widgets/custom_text.dart';

import '../../widgets/invite_box.dart';

import '../../widgets/transaction_list.dart';
import '../Transaction/transaction_viewmodel.dart';

class CardScreen2 extends StatefulWidget {
  const CardScreen2({super.key});

  @override
  State<CardScreen2> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 40,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(227, 239, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/logo.svg"),
                      Spacer(),
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

                  const Row(
                    children: [
                      CustomText(
                        text: "Welcome",
                        fontsize: 20,
                        fontFamily: "MuliBold",
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(width: 5),
                      CustomText(
                        text: "Tommy Jason",
                        fontsize: 20,
                        fontFamily: "MuliRegular",
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const DebitCard2(),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Copy HydePIN",
                        color: Color.fromRGBO(55, 116, 205, 1),
                        fontsize: 15,
                        fontFamily: "MuliRegular",
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.copy,
                        size: 13,
                        color: Color.fromRGBO(55, 116, 205, 1),
                      ),
                    ],
                  ),
                  const CustomText(
                    text: "M 1 2 3 H",
                    color: Color.fromRGBO(55, 116, 205, 1),
                    fontsize: 58,
                    fontFamily: "MuliBold",
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomText(
                        text: "TRANSACTIONS",
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontsize: 18,
                        fontFamily: "MuliSemiBold",
                        fontWeight: FontWeight.w900,
                      ),
                      Spacer(),
                       GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return TransactionHistory();
                            })
                          );
                        },
                         child: const CustomText(
                          text: "VIEW ALL",
                          color: Color.fromRGBO(55, 116, 205, 1),
                          fontsize: 14,
                          fontFamily: "MuliRegular",
                          fontWeight: FontWeight.w900,
                                               ),
                       ),
                    ],
                  ),
                  Consumer<TransactionViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (viewModel.hasError) {
                        return const Center(
                          child: Text(
                            "Failed to load transactions. Please try again.",
                          ),
                        );
                      }
                      List<Transaction> lastThreeTransactions =
                          viewModel.transactionHistory
                              .expand((month) => month.items)
                              .toList()
                              .reversed
                              .take(3)
                              .toList();

                      return lastThreeTransactions.isEmpty
                          ? const Center(
                            child: Text("No transactions available"),
                          )
                          : lastthreetransactionList([
                            TransactionMonth(
                              month: "",
                              items: lastThreeTransactions,
                            ),
                          ]);
                    },
                  ),
                  const CustomQuickLinksBox2(),
                  const CustomShopRedeem2(),
                 SizedBox(height: 10,),
                  Row(
                    children: [
                      const CustomText(
                        text: "Offers for you",
                        fontsize: 16,
                        fontFamily: "MuliBold",
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
                            text: "VIEW ALL >>",
                            fontsize: 14,
                            fontFamily: "MuliRegular",
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
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      children: [
                        CustomText(
                          text: "WHY PAY VIA HYDEPAY",
                          fontsize: 20,
                          fontFamily: "MuliSemiBold",
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                        ),
                      ],
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
                        fontFamily: "MuliSemiBold",
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text:
                        '''Hyde Pay is the world's first completely ID-less, most secured, interoperable and convenient payment mode - using the existing underlying Payment ecosystem ''',
                    fontsize: 18,
                    fontFamily: "MuliRegular",
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
          ],
        ),
      ),
    );
  }
}
