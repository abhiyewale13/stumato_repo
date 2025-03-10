import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stumatoxpay_march/widgets/customize_button.dart';

import '../../widgets/custom_text.dart';

class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({super.key});
  @override
  State createState() => _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  String selectedPayment = "Current Outstanding";
  String selectedMode = "Saving Bank Account";
  String selectedAccount = "SBA - 123456789012";
  String selectedPaymentMode = "One Time";
  TextEditingController dateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 116, 205, 1),
        title: CustomText(
          text: "Credit Card Payment",
          fontsize: 20,
          fontFamily: "MuliBold",
          color: Colors.white,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "You have chosen to make the following CC payment.",
                fontsize: 18,
                fontFamily: "MuliSemiBold",
              ),
              SizedBox(height: 10),
              CustomText(
                text: "123456789012345",
                fontsize: 18,
                fontFamily: "MuliSemiBold",
              ),

              SizedBox(height: 20),

              // Payment Options
              CustomText(
                text: "How much do you want to pay?",
                fontsize: 14,
                fontFamily: "MuliSemiBold",
              ),

              Column(
                children: [
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CustomText(
                      text: "Current Outstanding  ₹ 0.00",
                      fontsize: 18,
                      fontFamily: "MuliSemiBold",
                    ),
                    value: "Current Outstanding",
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() => selectedPayment = value.toString());
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CustomText(
                      text: "Last Bill Due  ₹ 0.00",
                      fontsize: 18,
                      fontFamily: "MuliSemiBold",
                    ),
                    value: "Last Bill Due",
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() => selectedPayment = value.toString());
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CustomText(
                      text: "Minimum Due  ₹ 0.00",
                      fontsize: 18,
                      fontFamily: "MuliSemiBold",
                    ),
                    value: "Minimum Due",
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() => selectedPayment = value.toString());
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CustomText(
                      text: "Other Amount",
                      fontsize: 18,
                      fontFamily: "MuliSemiBold",
                    ),
                    value: "Other Amount",
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() => selectedPayment = value.toString());
                    },
                  ),
                ],
              ),

              // Mode of Payment Dropdown
              SizedBox(height: 15),
              //  Text("Mode of Payment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              CustomText(
                text: "Mode of Payment",
                fontsize: 14,
                fontFamily: "MuliRegular",
              ),
              DropdownButtonFormField(
                value: selectedMode,
                items:
                    ["Saving Bank Account", "Current Account"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (value) {
                  setState(() => selectedMode = value.toString());
                },
              ),

              SizedBox(height: 30),
              CustomText(
                text: "From which account do you want to make payment",
                fontsize: 14,
                fontFamily: "MuliRegular",
              ),

              DropdownButtonFormField(
                value: selectedAccount,
                items:
                    ["SBA - 123456789012", "SBA - 987654321098"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (value) {
                  setState(() => selectedAccount = value.toString());
                },
              ),

              // Date Picker
              SizedBox(height: 30),
              CustomText(
                text: "When would you like this to happen?",
                fontsize: 14,
                fontFamily: "MuliRegular",
              ),

              TextFormField(
                controller: dateController,
                readOnly: true,

                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month),
                ),
                onTap: () => _selectDate(context),
              ),

              // Payment Mode Dropdown
              SizedBox(height: 30),
              CustomText(
                text: "Payment Mode",
                fontsize: 14,
                fontFamily: "MuliRegular",
              ),

              DropdownButtonFormField(
                value: selectedPaymentMode,
                items:
                    ["One Time", "Recurring"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (value) {
                  setState(() => selectedPaymentMode = value.toString());
                },
              ),

              // Remarks
              SizedBox(height: 30),
              CustomText(
                text: "Remarks (Optional)",
                fontsize: 14,
                fontFamily: "MuliRegular",
              ),

              TextField(
                controller: remarksController,
                decoration: InputDecoration(),
              ),

              // Pay Button
              SizedBox(height: 20),
              CustomizeButton(
                text: "Pay",
                fontFamily: "MuliBold",
                fontSize: 20,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
