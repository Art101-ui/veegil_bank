import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:veegil_bank/screens/HomeScreen/homeScreen.dart';
import 'package:veegil_bank/screens/Login/login_controller.dart';
import 'package:veegil_bank/screens/SignUp/sign_up.dart';
import 'package:veegil_bank/utilis/colors.dart';
import 'package:veegil_bank/utilis/dimensions.dart';
import 'package:veegil_bank/widgets/big_text.dart';
import 'package:veegil_bank/widgets/small_text.dart';
import 'package:veegil_bank/widgets/text_input.dart';
import 'package:veegil_bank/widgets/text_input_password.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
              top: Dimensions.height40 * 4,
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
              Align(
                child: BigText(
                  fontWeight: FontWeight.w400,
                  text: 'Login',
                  color: AppColors.mainColor,
                  size: Dimensions.font26,
                ),
              ),
              SizedBox(
                height: Dimensions.height40,
              ),
              TextInputs(
                controller: loginController.phoneController,
                textString: 'Phone Number',
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              TextInputPassword(
                controller: loginController.passwordController,
                textString: 'Password',
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              GestureDetector(
                  onTap: () {
                    loginController.login();
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
                          child: loginController.isLoading.value
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                  radius: 9.0,
                                )
                              : BigText(
                                  text: 'Sign in',
                                  size: Dimensions.font26,
                                  color: Colors.white,
                                ),
                        );
                      }))),
              SizedBox(
                height: Dimensions.height15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: "Don't have an account ? ",
                    size: Dimensions.font16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpPage());
                      loginController.phoneController.clear();
                    },
                    child: BigText(
                      text: "Sign up ",
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
    );
  }
}
