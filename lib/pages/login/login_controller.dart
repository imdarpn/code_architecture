import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_structure/common/widgets/common_widgets.dart';
import 'package:getx_structure/pages/login/login_state.dart';

import '../../common/enums/loading_status.dart';
import '../../repository/auth_repository.dart';
import '../../utils/logger_util.dart';

class LoginController extends GetxController {
  final loginState = LoginState();
  final _authRepository = Get.find<AuthRepository>();

  @override
  void onInit() {
    super.onInit();
  }



  void doSignIn() async {
    if (loginState.loginFormKey.currentState!.validate()) {
      loginState.loginStatus.value = LoadStatus.loading;
      EasyLoading.show();
      try {
        var commonResponse = await _authRepository.doLogin(
            emailId: loginState.emailController.text.trim().toLowerCase(),
            password: loginState.passwordController.text.trim());

        EasyLoading.dismiss();
        loginState.loginStatus.value = LoadStatus.success;
        if (commonResponse.message != null && commonResponse.status) {
          /*StorageUtil.setData(StorageUtil.keyLoginData, jsonEncode(result['data'].data!.toJson()));
          StorageUtil.setData(StorageUtil.keyToken, result['data'].token!.token);
          StorageUtil.setData(StorageUtil.keyGuestMode, false);*/
          logger.e("SUCCESS");
        } else {
          CommonWidgets.showSnackBar(commonResponse.message);
          logger.e(commonResponse.message);
        }

      } catch (error) {
        EasyLoading.dismiss();
        CommonWidgets.showSnackBar(error.toString(),bgColor: Colors.white);
        logger.e("Controller>>>>>> error $error");
      }
    }
  }

}
