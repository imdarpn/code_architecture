import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/common/constants/color_constants.dart';
import 'package:getx_structure/pages/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        body: Container());
  }
}
