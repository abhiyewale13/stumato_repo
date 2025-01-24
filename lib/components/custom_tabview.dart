import 'package:assignment_1/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../view/derscription_screen.dart';


class CustomTabview extends StatefulWidget {
  const CustomTabview({super.key});

  @override
  State<CustomTabview> createState() => _CustomTabviewState();
}

class _CustomTabviewState extends State<CustomTabview>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 5, vsync: this);
  }

  List<Map<String, dynamic>> itemlist = [
    {
      "image":
          "https://cdn.shopify.com/s/files/1/1729/9719/files/Social_Logo_Profile-ED01.png?height=628&pad_color=fff&v=1714502454&width=1200",
      "name": "Chitale Bandhu",
      "description": "Sweets and snacks",
      "discount": 15
    },
    {
      "image":
          "https://tse3.mm.bing.net/th?id=OIP.qRV8zLO17Vg5t4i6hSyjtAHaG6&pid=Api&P=0&h=220",
      "name": "Haldiram's",
      "description": "Sweets and snacks",
      "discount": 5
    },
    {
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.P26E0ZFBIqOdjxBwofO0nQHaEI&pid=Api&P=0&h=220",
      "name": "Kaka Halwai",
      "description": "Sweets and snacks",
      "discount": 5
    },
    {
      "image":
          "https://tse3.mm.bing.net/th?id=OIP.gvAPC0PmdJP3ukliOlSCvgAAAA&pid=Api&P=0&h=220",
      "name": "Agraj Foods",
      "description": "Groceries and Spices",
      "discount": 5
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
         
         
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding:const EdgeInsets.symmetric(horizontal: 1.0),
          controller: tabController,
          dividerColor: Colors.white,
          labelColor: const Color.fromRGBO(233, 39, 105, 1),
          indicator: BoxDecoration(
            
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromRGBO(233, 39, 105, 1), width: 3),
            // Selected border
          ),
          indicatorPadding: const EdgeInsets.only(
            bottom: 23),
         
          tabs: [
            Tab(
                icon:
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromARGB(33, 158, 158, 158),width: 3),
                        shape: BoxShape.circle
                      ),
                      height: 50,
                      width: 50,
                      padding:const EdgeInsets.all(5),
                      child: Image.asset("assets/images/saree.png",fit: BoxFit.cover,)),
                text: "Wedding"),
             Tab(
                icon:
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromARGB(33, 158, 158, 158),width: 3),
                        shape: BoxShape.circle
                      ),
                      height: 50,
                      width: 50,
                      padding:const EdgeInsets.all(5),
                      child: Image.asset("assets/images/ladoo.png",fit: BoxFit.cover,)),
                text: "Food"),
             Tab(
                icon:
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromARGB(33, 158, 158, 158),width: 3),
                        shape: BoxShape.circle
                      ),
                      height: 50,
                      width: 50,
                      padding:const EdgeInsets.all(5),
                      child: Image.asset("assets/images/temple.png",fit: BoxFit.cover,)),
                text: "Donation"),
            Tab(
                icon:
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromARGB(33, 158, 158, 158),width: 3),
                        shape: BoxShape.circle
                      ),
                      height: 50,
                      width: 50,
                      padding:const EdgeInsets.all(5),
                      child: Image.asset("assets/images/jackets.png",fit: BoxFit.cover,)),
                text: "Fashion"),
             Tab(
                icon:
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromARGB(33, 158, 158, 158),width: 3),
                        shape: BoxShape.circle
                      ),
                      height: 50,
                      width: 50,
                      padding:const EdgeInsets.all(5),
                      child: Image.asset("assets/images/ganesha.png",fit: BoxFit.cover,)),
                text: "Antiques"),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          flex: 0,
          child: SizedBox(
            
            height:250,
            width: MediaQuery.sizeOf(context).width,
            child: TabBarView(
              controller: tabController,
              children: [
                const Center(child: Text('Wedding Content')),
                CustomListView(
                  itemlist: itemlist,
                ),
                const Center(child: Text('Donation Content')),
                const Center(child: Text('Fashion Content')),
                const Center(child: Text('Antiques Content')),
              ],
            ),
          ),
        ),
      ],
    );
  }

  
}

class CustomListView extends StatefulWidget {
  final List itemlist;
  const CustomListView({super.key, required this.itemlist});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
           shrinkWrap: true,
      physics:const AlwaysScrollableScrollPhysics(),
      itemCount: widget.itemlist.length,
      itemBuilder: (context, index) {
        return GestureDetector(
           onTap: (){
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return const DerscriptionScreen();
                  })
                 );
                },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.only(top: 1, bottom: 2),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color.fromARGB(62, 158, 158, 158)),
                    top: BorderSide(color: Color.fromARGB(62, 158, 158, 158)))),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  height: 53,
                  width: 93,
          
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(114, 158, 158, 158),
                        offset: Offset(0, 0),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Image.network(
                    widget.itemlist[index]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.itemlist[index]["name"],
                      fontsize: 14,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: widget.itemlist[index]["description"],
                      fontsize: 11,
                      fontFamily: "Associate",
                      fontWeight: FontWeight.normal,
                      color: const Color.fromRGBO(127, 127, 127,1),
                      
                    )
                   
                  ],
                ),
                const Spacer(),
                CustomText(
                    text: "${widget.itemlist[index]["discount"]}%", 
                    fontsize: 18,
                    fontFamily: "Cerebri",
                    ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(child: SvgPicture.asset("assets/images/arrow.svg"))
              ],
            ),
          ),
        );
      },
    );
  }
}
