import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_structure/routes/app_pages.dart';
import 'package:getx_structure/utils/storage_utils.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    redirectToNextScreen();
  }

  Future<void> callInitApi() async {

  }

  void redirectToNextScreen() {
    Get.offAllNamed(Routes.login);

  }

}
