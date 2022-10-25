import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/screens/Credit/credit.dart';
import 'package:veegil_bank/screens/Debit/debit.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen_controller.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen_model.dart';
import 'package:veegil_bank/screens/Login/login_controller.dart';
import 'package:veegil_bank/screens/Transactions/transactions.dart';
import 'package:veegil_bank/utilis/colors.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/icon-text.dart';
import 'package:veegil_bank/widgets/row_icontext.dart';
import 'package:veegil_bank/widgets/small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreen = Get.put(HomeScreenController());
  LoginController login = Get.put(LoginController());
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.mainView,
            margin: EdgeInsets.only(
              top: Dimensions.height45,
            ),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Stack(children: [
              Positioned(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  child: BigText(
                    text: 'You have',
                    fontWeight: FontWeight.w500,
                    size: Dimensions.font30,
                  )),
              Positioned(
                  top: Dimensions.height63,
                  left: Dimensions.width40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: '\$',
                        fontWeight: FontWeight.w700,
                        size: Dimensions.width20,
                        color: Color(0xffFC8177),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      FutureBuilder(
                          future: homeScreen.getMoney(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return homeScreen.isLoading.value
                                ? BigText(
                                    text: '-- --',
                                    fontWeight: FontWeight.w700,
                                    size: Dimensions.font60,
                                    color: const Color(0xffFC8177))
                                : BigText(
                                    text: myFormat.format(snapshot.data),
                                    fontWeight: FontWeight.w700,
                                    size: Dimensions.font60,
                                    color: Color(0xffFC8177),
                                  );
                          }),
                    ],
                  )),
              Positioned(
                  top: Dimensions.height125,
                  left: Dimensions.width170,
                  child: BigText(
                    text: 'to spend.',
                    fontWeight: FontWeight.w500,
                    size: Dimensions.font30,
                  )),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(
                right: Dimensions.width20,
                left: Dimensions.width20,
                bottom: Dimensions.height15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => CreditPage());
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          right: Dimensions.width40,
                          left: Dimensions.width40),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child: IconTextWidget(
                          icon: Icons.paid,
                          iconColor: AppColors.mainColor,
                          text: 'Credit')),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => DebitPage());
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          right: Dimensions.width40,
                          left: Dimensions.width40),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child: IconTextWidget(
                          icon: Icons.payment_outlined,
                          iconColor: AppColors.mainColor,
                          text: 'Debit')),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: Dimensions.width40,
                right: Dimensions.width40,
                top: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        Dimensions.radius26,
                      ),
                      topLeft: Radius.circular(Dimensions.radius26))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => GestureDetector(
                            onTap: () => {
                              setState(() {
                                homeScreen.getTransactions();
                              })
                            },
                            child: RowIconTextWidget(
                                icon: homeScreen.isLoading.value
                                    ? Icons.currency_exchange_outlined
                                    : Icons.refresh_rounded,
                                iconColor: AppColors.mainColor,
                                text: 'Recent Transactions'),
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const TransactionsPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor),
                          padding: EdgeInsets.only(
                              top: Dimensions.height5,
                              bottom: Dimensions.height5,
                              right: Dimensions.width10,
                              left: Dimensions.width10),
                          child: BigText(
                            text: 'See all',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            size: Dimensions.font16 * 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.height30,
                      ),
                      child: FutureBuilder<List<HomeModel>?>(
                          future: homeScreen.getTransactions(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return const Center(
                                child: CupertinoActivityIndicator(
                                  radius: 9,
                                  color: Colors.blue,
                                ),
                              );
                            } else {
                              return ListView.builder(
                                  itemCount: ((((snapshot.data.length +
                                                      (snapshot.data.length +
                                                          1)) +
                                                  9) /
                                              2) -
                                          snapshot.data.length)
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
                                              color:
                                                  snapshot.data[index].type ==
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
                                                      text: snapshot.data[index]
                                                          .phoneNumber,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SmallText(
                                                            text: ((snapshot
                                                                        .data[
                                                                            index]
                                                                        .created)
                                                                    .toString()
                                                                    .split(
                                                                        '.')[0])
                                                                .split(' ')[0]),
                                                        SmallText(
                                                            text: ((snapshot
                                                                        .data[
                                                                            index]
                                                                        .created)
                                                                    .toString()
                                                                    .split(
                                                                        '.')[0])
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
                                                  color:
                                                      AppColors.mainBlackColor,
                                                ),
                                                SmallText(
                                                  text: snapshot.data[index]
                                                              .type ==
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
          )
        ],
      ),
    );
  }
}
