import 'package:flutter/material.dart';

import '../views/Transaction/transaction_viewmodel.dart';

Widget transactionList(List<TransactionMonth> transactionHistory, {int limit = -1}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: transactionHistory.map((month) {
            List<Transaction> limitedTransactions = (limit > 0)
                ? month.items.take(limit).toList()
                : month.items;

            return limit<=0? Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0.3, 1))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Text(
                        month.month,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "Muli"),
                      ),
                    ),
                  ),
                  Column(
                    children: limitedTransactions.map((transaction) {
                      return transactionItem(transaction);
                    }).toList(),
                  ),
                ],
              ),
            ): Column(
                    children: limitedTransactions.map((transaction) {
                      return transactionItem(transaction);
                    }).toList(),
                  );
          }).toList(),
        ),
      ),
    );
  }
  Widget lastthreetransactionList(List<TransactionMonth> transactionHistory, {int limit = -1}) {
    return SingleChildScrollView(
      child: Column(
        children: transactionHistory.map((month) {
          List<Transaction> limitedTransactions = (limit > 0)
              ? month.items.take(limit).toList()
              : month.items;
      
      
          return  Column(
            children: limitedTransactions.map((transaction) {
              return transactionthreeItem(transaction);
            }).toList(),
          );
          }).toList(),
      ),
    );
  }


Widget lastThreeTransactions(List<TransactionMonth> transactionHistory) {
  List<Transaction> allTransactions = transactionHistory
      .expand((month) => month.items)
      .toList();

  allTransactions.sort((a, b) => b.date.compareTo(a.date));
  List<Transaction> lastThree = allTransactions.reversed.take(3).toList();

  return Column(
    children: lastThree.map((transaction) {
      return transactionthreeItem(transaction);
    }).toList(),
  );
}

Widget transactionItem(Transaction transaction) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 50,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              transaction.date,
              style: const TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w700, fontFamily: "Muli"),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  transaction.title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700, fontFamily: "Muli"),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${transaction.time}    Ref #${transaction.ref}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Muli",
                ),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹ ${transaction.amount}",
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w700, fontFamily: "Muli"),
              ),
              Text(
                transaction.isSuccess ? "Status: SUCCESS" : "Status: FAILED",
                style: TextStyle(
                  color: transaction.isSuccess ? Colors.green : Colors.red,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Muli",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionthreeItem(Transaction transaction) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only( top: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
      
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 50,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              transaction.date,
              style: const TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w700, fontFamily: "MuliRegular"),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  transaction.title,
                  textAlign:TextAlign.left,
                  style: const TextStyle(
                    
                      fontSize: 13, fontWeight: FontWeight.w700, fontFamily: "MuliRegular",),
                  
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${transaction.time}    Ref #${transaction.ref}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: "MuliBold",
                ),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹ ${transaction.amount}",
                style: const TextStyle(
                  fontSize: 16,
                    color: Colors.blue, fontWeight: FontWeight.w700, fontFamily: "MuliBold"),
              ),
              Text(
                transaction.isSuccess ? "Status: SUCCESS" : "Status: FAILED",
                style: TextStyle(
                  color: transaction.isSuccess ? Colors.green : Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: "MuliBold",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }