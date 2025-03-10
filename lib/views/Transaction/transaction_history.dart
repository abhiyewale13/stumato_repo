// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'transaction_viewmodel.dart';

// class TransactionHistory extends StatelessWidget {
//   const TransactionHistory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Transaction History",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w700),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: const Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),
//       ),
//       body: Consumer<TransactionViewModel>(
//         builder: (context, viewModel, child) {
//           if (viewModel.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (viewModel.hasError) {
//             return const Center(
//                 child: Text("Failed to load transactions. Please try again."));
//           }
//           return transactionList(viewModel.transactionHistory);
//         },
//       ),
//     );
//   }

//   Widget transactionList(List<TransactionMonth> transactionHistory, {int? limit}) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: transactionHistory.map((month) {
//             return Container(
//               width: double.infinity,
//               padding: const EdgeInsets.only(
//                 left: 8,
//                 right: 8,
//                 top: 8),
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//                 boxShadow: const [
//                   BoxShadow(
//                       color: Colors.grey, blurRadius: 2, offset: Offset(0.3, 1))
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Container(
//                       margin: const EdgeInsets.only(left: 8),
//                       child: Text(
//                         month.month,
//                         style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Muli"),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: month.items.map((transaction) {
//                       return Container(
//                         height: 80,
//                         padding: const EdgeInsets.only(
//                           left: 10,
//                           right: 10,
//                           top: 10
//                         ),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           border: Border(
//                             bottom: BorderSide(color: Colors.grey),
//                           ),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               alignment: Alignment.center,
//                               width: 40,
//                               height: 50,
//                               padding: const EdgeInsets.all(9),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue[100],
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Text(
//                                 transaction.date,
//                                 style: const TextStyle(
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: "Muli"),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: 150,
//                                   child: Text(
//                                     transaction.title,
//                                     style: const TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700,
//                                         fontFamily: "Muli",
//                                         overflow: TextOverflow.clip),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "${transaction.time}    Ref #${transaction.ref}",
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: "Muli",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(width: 5),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "₹ ${transaction.amount}",
//                                   style: const TextStyle(
//                                       color: Colors.blue,
//                                       fontWeight: FontWeight.w700,
//                                       fontFamily: "Muli",
//                                       fontSize: 11),
//                                 ),
//                                 Text(
//                                   transaction.isSuccess
//                                       ? "Status: SUCCESS"
//                                       : "Status: FAILED",
//                                   style: TextStyle(
//                                     color: transaction.isSuccess
//                                         ? Colors.green
//                                         : Colors.red,
//                                     fontSize: 9,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: "Muli",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/transaction_list.dart';
import 'transaction_viewmodel.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaction History",
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
      body: Consumer<TransactionViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.hasError) {
            return const Center(
                child: Text("Failed to load transactions. Please try again."));
          }
          return transactionList(viewModel.transactionHistory);
        },
      ),
    );
  }

  // Widget transactionList(List<TransactionMonth> transactionHistory, {int limit = -1}) {
  //   return SingleChildScrollView(
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Column(
  //         children: transactionHistory.map((month) {
  //           List<Transaction> limitedTransactions = (limit > 0)
  //               ? month.items.take(limit).toList()
  //               : month.items;

  //           return Container(
  //             width: double.infinity,
  //             padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
  //             margin: const EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(15),
  //               color: Colors.white,
  //               boxShadow: const [
  //                 BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0.3, 1))
  //               ],
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                   child: Container(
  //                     margin: const EdgeInsets.only(left: 8),
  //                     child: Text(
  //                       month.month,
  //                       style: const TextStyle(
  //                           fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "Muli"),
  //                     ),
  //                   ),
  //                 ),
  //                 Column(
  //                   children: limitedTransactions.map((transaction) {
  //                     return transactionItem(transaction);
  //                   }).toList(),
  //                 ),
  //               ],
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }

  // Widget transactionItem(Transaction transaction) {
  //   return Container(
  //     height: 80,
  //     padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
  //     decoration: const BoxDecoration(
  //       color: Colors.white,
  //       border: Border(bottom: BorderSide(color: Colors.grey)),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           alignment: Alignment.center,
  //           width: 40,
  //           height: 50,
  //           padding: const EdgeInsets.all(9),
  //           decoration: BoxDecoration(
  //             color: Colors.blue[100],
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Text(
  //             transaction.date,
  //             style: const TextStyle(
  //                 fontSize: 11, fontWeight: FontWeight.w700, fontFamily: "Muli"),
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(
  //               width: 150,
  //               child: Text(
  //                 transaction.title,
  //                 style: const TextStyle(
  //                     fontSize: 13, fontWeight: FontWeight.w700, fontFamily: "Muli"),
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ),
  //             const SizedBox(height: 5),
  //             Text(
  //               "${transaction.time}    Ref #${transaction.ref}",
  //               style: const TextStyle(
  //                 color: Colors.grey,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.w700,
  //                 fontFamily: "Muli",
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(width: 5),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             Text(
  //               "₹ ${transaction.amount}",
  //               style: const TextStyle(
  //                   color: Colors.blue, fontWeight: FontWeight.w700, fontFamily: "Muli"),
  //             ),
  //             Text(
  //               transaction.isSuccess ? "Status: SUCCESS" : "Status: FAILED",
  //               style: TextStyle(
  //                 color: transaction.isSuccess ? Colors.green : Colors.red,
  //                 fontSize: 9,
  //                 fontWeight: FontWeight.w700,
  //                 fontFamily: "Muli",
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

