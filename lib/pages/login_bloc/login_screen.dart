import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_structure/common/constants/font_constants.dart';
import 'package:getx_structure/common/constants/string_constants.dart';
import 'package:getx_structure/common/widgets/common_widgets.dart';
import 'package:getx_structure/pages/login_bloc/login_bloc.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/image_constants.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocListener<LoginBloc , LoginState>(
            listener: (context, state) {
              // TODO: implement listener
            },
  child: Column(
        children: [
          _logoContainer(),
          Expanded(
              child: _loginForm(context)
          ),
          Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom==0,
              child: bottomText()),
        ],
      ),
),
    );
  }

  Widget _loginForm(BuildContext context){
    return Padding(
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
                context: context,
                onclick: (){
                  context.read<LoginBloc>().add(
                    const LoginEvent.loginSubmitted(),
                  );
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
    return BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    return CommonWidgets.commonTextFormField(
      labelText: StringConstants.email,
      obscureText: false,
      autofocus: false,
      fontWeight: FontWeightConstants.medium,
      textColor: ColorConstants.blackColor,
      //textEditingController: controller.loginState.emailController,
      onChanged: (value) => context
          .read<LoginBloc>()
          .add(LoginEvent.emailChanged(value)),
      fontFamily: FontFamilyConstants.barlow,
      suffixIcon: SvgPicture.asset(ImageConstants.signIn),


    );
  },
);
  }

  Widget _enterPassword(){
    return BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    return CommonWidgets.commonTextFormField(
      labelText: StringConstants.password,
      obscureText: true,
      autofocus: false,
      fontWeight: FontWeightConstants.medium,
      textColor: ColorConstants.blackColor,
      onChanged: (value) => context
          .read<LoginBloc>()
          .add(LoginEvent.passwordChanged(value)),
      fontFamily: FontFamilyConstants.barlow,
      suffixIcon: SvgPicture.asset(ImageConstants.forgetPassword),

    );
  },
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
