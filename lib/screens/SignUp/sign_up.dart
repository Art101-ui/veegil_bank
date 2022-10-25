import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/screens/Login/login.dart';
import 'package:veegil_bank/screens/SignUp/sign_up_controller.dart';
import 'package:veegil_bank/screens/homescreen/homescreen.dart';
import 'package:veegil_bank/utilis/colors.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/small_text.dart';
import 'package:veegil_bank/widgets/text_input.dart';
import 'package:veegil_bank/widgets/text_input_password.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final signupController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
              top: Dimensions.height10 * 12,
              bottom: Dimensions.height30),
          padding: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
              top: Dimensions.height20,
              bottom: Dimensions.height20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height45),
                Align(
                    child: BigText(
                  text: 'Veegil Bank',
                  color: AppColors.mainColor,
                  size: Dimensions.font30 - 2,
                  fontWeight: FontWeight.w400,
                )),
                SizedBox(
                  height: Dimensions.height5 * 11,
                ),
                TextInputs(
                  controller: signupController.phoneController,
                  textString: 'Phone Number',
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                TextInputPassword(
                  controller: signupController.passwordController,
                  textString: 'Password',
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                GestureDetector(
                    onTap: () {
                      signupController.register();
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
                        child: Obx(() => Align(
                              child: signupController.isLoading.value
                                  ? const CupertinoActivityIndicator(
                                      color: Colors.white,
                                      radius: 9.0,
                                    )
                                  : BigText(
                                      text: 'Sign up',
                                      size: Dimensions.font26,
                                      color: Colors.white,
                                    ),
                            )))),
                SizedBox(height: Dimensions.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Already have an account ? ",
                      size: Dimensions.font16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginPage());
                        signupController.phoneController.clear();
                        signupController.passwordController.clear();
                      },
                      child: BigText(
                        text: "Sign in",
                        size: Dimensions.font16,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
