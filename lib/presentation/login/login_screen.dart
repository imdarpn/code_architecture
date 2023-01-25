import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/constants/color_constants.dart';
import '../common/constants/font_constants.dart';
import '../common/constants/image_constants.dart';
import '../common/constants/string_constants.dart';
import '../common/enums/loading_status.dart';
import '../common/widgets/common_widgets.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';


class LoginView extends StatelessWidget {
  final LoginBloc? loginBloc;
  LoginView({Key? key,this.loginBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
  builder: (context, state) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
        listener: (context, state) {
         /* if (state.status == LoadStatus.success) {
            SnackBar(
              content: Text(state.message),
            );
          }
          if (state.status == LoadStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }*/
        },
        child: Column(
          children: [
            _logoContainer(),
            Expanded(child: _loginForm(context)),
            Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: bottomText()),
          ],
        ),
      );
  },
),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///sign in
            CommonWidgets.commonText(
                text: StringConstants.signIn,
                fontFamily: FontFamilyConstants.barlow,
                fontWeight: FontWeightConstants.semi_bold,
                fontSize: 20),
            const SizedBox(
              height: 30,
            ),

            /// email
            _enterEmail(),
            const SizedBox(
              height: 20,
            ),

            /// password
            _enterPassword(),
            const SizedBox(
              height: 20,
            ),

            ///forgot password
            CommonWidgets.commonText(
                text: StringConstants.forgetPassword,
                fontWeight: FontWeightConstants.medium,
                fontSize: 14),
            const SizedBox(
              height: 20,
            ),

            ///sign in button
            CommonWidgets.commonFilledButton(
                context: context,
                onclick: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(LoginButtonPressedEvent());
                },
                color: ColorConstants.selectedLightGreen,
                fontWeight: FontWeightConstants.semi_bold,
                fontSize: 17,
                title: StringConstants.signIn,
                textColor: ColorConstants.whiteColor),
          ],
        ),
      ),
    );
  }

  Widget _logoContainer() {
    return Container(
      color: ColorConstants.selectedLightGreen,
      alignment: Alignment.center,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: SvgPicture.asset(ImageConstants.signIn),
      ),
    );
  }

  Widget _enterEmail() {
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
              .add(LoginEmailChangedEvent(email: value)),
          fontFamily: FontFamilyConstants.barlow,
          suffixIcon: SvgPicture.asset(ImageConstants.signIn),
        );
      },
    );
  }

  Widget _enterPassword() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CommonWidgets.commonTextFormField(
          labelText: StringConstants.password,
          obscureText: true,
          autofocus: false,
          fontWeight: FontWeightConstants.medium,
          textColor: ColorConstants.blackColor,
          /*onChanged: (value) => context
          .read<LoginBloc>()
          .add(LoginEvent.passwordChanged(value)),*/
          fontFamily: FontFamilyConstants.barlow,
          suffixIcon: SvgPicture.asset(ImageConstants.forgetPassword),
        );
      },
    );
  }

  Widget bottomText() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.commonText(
              onClick: () {},
              fontSize: 14,
              fontWeight: FontWeightConstants.medium,
              color: ColorConstants.blackColor,
              text: StringConstants.donTHaveAccount),
          const SizedBox(
            width: 7,
          ),
          CommonWidgets.commonText(
              onClick: () {},
              fontSize: 16,
              fontWeight: FontWeightConstants.semi_bold,
              color: ColorConstants.selectedLightGreen,
              text: StringConstants.signUp)
        ],
      ),
    );
  }
}
