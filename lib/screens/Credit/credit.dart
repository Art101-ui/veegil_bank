import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/screens/Credit/credit_controller.dart';
import 'package:veegil_bank/utilis/colors.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/text_input.dart';

class CreditPage extends StatelessWidget {
  CreditPage({Key? key}) : super(key: key);
  CreditController creditController = Get.put(CreditController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.width15,
              right: Dimensions.width15,
              top: Dimensions.height63 * 2,
              bottom: Dimensions.height30),
          padding: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
              top: Dimensions.height20,
              bottom: Dimensions.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: Dimensions.height5),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5)),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: BigText(
                    fontWeight: FontWeight.w400,
                    text: 'Credit',
                    color: AppColors.mainColor,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextInputs(
                textString: 'Phone Number',
                controller: creditController.phoneController,
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              TextField(
                controller: creditController.amountController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(color: Color(0xFF000000)),
                cursorColor: Color.fromARGB(255, 49, 27, 146),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                  hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              GestureDetector(
                  onTap: () {
                    creditController.transfer();
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius26)),
                        color: AppColors.mainColor,
                      ),
                      child: Obx(() {
                        return Align(
                          child: creditController.isLoading.value
                              ? CupertinoActivityIndicator(
                                  color: Colors.white,
                                  radius: 9.0,
                                )
                              : BigText(
                                  text: 'Get Paid',
                                  size: Dimensions.font26,
                                  color: Colors.white,
                                ),
                        );
                      }))),
            ],
          ),
        ),
      ),
    );
  }
}
