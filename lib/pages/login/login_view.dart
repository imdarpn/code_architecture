import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_structure/common/constants/font_constants.dart';
import 'package:getx_structure/common/constants/string_constants.dart';
import 'package:getx_structure/common/widgets/common_widgets.dart';
import 'package:getx_structure/pages/login/login_state.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/image_constants.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          _logoContainer(),
          Expanded(
              child: _loginForm()
          ),
          Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom==0,
              child: bottomText()),
        ],
      ),
    );
  }

  Widget _loginForm(){
    return Form(
      key: controller.loginState.loginFormKey!,
      child: Padding(
        padding: const EdgeInsets.only(top:35,left: 35,right: 35),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              ///sign in
              CommonWidgets.commonText(
                  text: StringConstants.signIn,
                  fontFamily: FontFamilyConstants.barlow,
                  fontWeight: FontWeightConstants.semi_bold,
                  fontSize: 20
              ),
              const SizedBox(height: 30,),
              /// email
              _enterEmail(),
              const SizedBox(height: 20,),
              /// password
              _enterPassword(),
              const SizedBox(height: 20,),
              ///forgot password
              CommonWidgets.commonText(

                  text: StringConstants.forgetPassword,
                  fontWeight: FontWeightConstants.medium,
                  fontSize: 14
              ),
              const SizedBox(height: 20,),
              ///sign in button
              CommonWidgets.commonFilledButton(
                  context: Get.context,
                  onclick: (){
                   controller.doSignIn();
                  },
                  color: ColorConstants.selectedLightGreen,
                  fontWeight: FontWeightConstants.semi_bold,
                  fontSize: 17,
                  title: StringConstants.signIn,
                  textColor: ColorConstants.whiteColor
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoContainer(){
    return   Container(
      color: ColorConstants.selectedLightGreen,
      alignment: Alignment.center,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: SvgPicture.asset(ImageConstants.signIn),
      ),
    );
  }

  Widget _enterEmail(){
    return CommonWidgets.commonTextFormField(
      labelText: StringConstants.email,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstants.medium,
      textColor: ColorConstants.blackColor,
      textEditingController: controller.loginState.emailController,
      fontFamily: FontFamilyConstants.barlow,
      suffixIcon: SvgPicture.asset(ImageConstants.signIn),

    );
  }

  Widget _enterPassword(){
    return CommonWidgets.commonTextFormField(
      labelText: StringConstants.password,
      obscureText: true,
      autofocus: false,
      fontWeight: FontWeightConstants.medium,
      textColor: ColorConstants.blackColor,
      textEditingController: controller.loginState.passwordController,
      fontFamily: FontFamilyConstants.barlow,
      suffixIcon: SvgPicture.asset(ImageConstants.forgetPassword),

    );
  }

  Widget bottomText(){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.commonText(
              onClick: (){},
              fontSize: 14,
              fontWeight: FontWeightConstants.medium,
              color: ColorConstants.blackColor,
              text: StringConstants.donTHaveAccount
          ),
          const SizedBox(width: 7,),
          CommonWidgets.commonText(
              onClick: (){

              },
              fontSize: 16,
              fontWeight: FontWeightConstants.semi_bold,
              color: ColorConstants.selectedLightGreen,
              text: StringConstants.signUp
          )

        ],
      ),
    );
  }

}
