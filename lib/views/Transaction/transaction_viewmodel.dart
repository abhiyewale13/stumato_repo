import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Transaction {
  final String date;
  final String title;
  final String time;
  final String ref;
  final String amount;
  final bool isSuccess;

  Transaction({
    required this.date,
    required this.title,
    required this.time,
    required this.ref,
    required this.amount,
    required this.isSuccess,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['date'],
      title: json['title'],
      time: json['time'],
      ref: json['ref'],
      amount: json['amount'],
      isSuccess: json['isSuccess'],
    );
  }
}

// Month-wise Transaction Model
class TransactionMonth {
  final String month;
  final List<Transaction> items;

  TransactionMonth({required this.month, required this.items});

  factory TransactionMonth.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Transaction> transactionsList = list.map((i) => Transaction.fromJson(i)).toList();

    return TransactionMonth(
      month: json['month'],
      items: transactionsList,
    );
  }
}



class TransactionViewModel extends ChangeNotifier{
  bool isLoading = true;
   bool hasError = false;
   List<TransactionMonth> transactionHistory = [];

  TransactionViewModel() {
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    const String apiUrl =
        "https://api.jsonsilo.com/demo/2c76afac-b61f-4c83-aa71-aff269bd8233";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        transactionHistory = (jsonData['transactions'] as List)
            .map((item) => TransactionMonth.fromJson(item))
            .toList();
        hasError = false;
      } else {
        hasError = true;
      }
    } catch (e) {
      hasError = true;
    }
    isLoading = false;
    notifyListeners();
}
}