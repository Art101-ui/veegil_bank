import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:veegil_bank/screens/Transactions/transactions_controller.dart';
import 'package:veegil_bank/screens/Transactions/transactions_model.dart';
import 'package:veegil_bank/utilis/colors.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/small_text.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  TransactionsController transactions = Get.put(TransactionsController());

  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: Dimensions.width15,
            right: Dimensions.width15,
            top: Dimensions.height45,
            bottom: Dimensions.height10),
        padding: EdgeInsets.only(
          left: Dimensions.width15,
          right: Dimensions.width15,
          top: Dimensions.height20 * 1.5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: Dimensions.height5),
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: BigText(
                  fontWeight: FontWeight.w400,
                  text: 'All Transactions',
                  color: AppColors.mainColor,
                  size: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: Dimensions.height30,
                ),
                child: FutureBuilder<List<TransactionsModel>?> (
                    future: transactions.getTransactions(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(
                          child: CupertinoActivityIndicator(
                            radius: 9,
                            color: Colors.blue,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount:
                             (((((snapshot.data.length +
                                                    (snapshot.data.length +
                                                        1)) +
                                                9) /
                                            2) -
                                        snapshot.data.length) *
                                    5)
                                .toInt(),
                               
                            

                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.paid_outlined,
                                        color: snapshot.data[index].type ==
                                                'credit'
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width15,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: Dimensions.height5),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                            width: 0.2,
                                          ))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BigText(
                                                text: snapshot
                                                    .data[index].phoneNumber,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              SizedBox(
                                                height: Dimensions.height5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SmallText(
                                                      text: ((snapshot
                                                                  .data[index]
                                                                  .created)
                                                              .toString()
                                                              .split('.')[0])
                                                          .split(' ')[0]),
                                                  SmallText(
                                                      text: ((snapshot
                                                                  .data[index]
                                                                  .created)
                                                              .toString()
                                                              .split('.')[0])
                                                          .split(' ')[1]),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width45,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SmallText(
                                            text:
                                                '\$${myFormat.format(snapshot.data[index].amount)}',
                                            size: Dimensions.font18,
                                            color: AppColors.mainBlackColor,
                                          ),
                                          SmallText(
                                            text: snapshot.data[index].type ==
                                                    'credit'
                                                ? 'Received'
                                                : 'Sent',
                                            size: Dimensions.font15,
                                            color: Color(0xff555555),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  )
                                ],
                              );
                            }));
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
