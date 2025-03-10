import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/domestic_usage.dart';



class CardControlScreen extends StatefulWidget {
  const CardControlScreen({super.key});
  @override
  State createState() => _CardControlScreenState();
}

class _CardControlScreenState extends State<CardControlScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Card Control",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Muli",
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Consumer(
        builder: (context, value, child) {
          
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardDetails(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 25),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(227, 239, 255, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    TabBar(
                      
                        indicatorColor:const Color.fromRGBO(41, 115, 208,1),
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: _tabController,
                        unselectedLabelColor:const Color.fromRGBO(127, 127, 127,1),
                        labelColor:const Color.fromRGBO(41, 115, 208,1),
        
                        tabs:  [
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 15
                            ),
                            child: const Text(
                              "Domestic Usage",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Muli",
                                   fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 15
                            ),
                            child: const Text(
                              "International Usage",
                              style: TextStyle(
                                  
                                  fontSize: 13,
                                  fontFamily: "Muli",
                                   fontWeight: FontWeight.w700),
                            ),
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: const [DomesticUsage(), Text("aguhahk")]),
                    )
                  ],
                ),
              ),
            )
          ],
        
        );
        }
      ),
    );
  }

  Widget _buildCardDetails() {
    return const Padding(
      padding: EdgeInsets.only(top: 50, right: 10, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "< HydePay >",
            style: TextStyle(
                fontSize: 24, fontFamily: "Micro", color: Colors.blue),
          ),
          SizedBox(height: 5),
          Text("****  ****  ****  1987",
              style: TextStyle(
                fontFamily: "Muli",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          Text("Manage your card settings and usage",
              style: TextStyle(color: Color.fromRGBO(55, 116, 205,1),
              fontFamily: "Muli",
              fontWeight: FontWeight.bold,
               fontSize: 10)),
        ],
      ),
    );
  }
}
