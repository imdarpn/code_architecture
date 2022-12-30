import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/common/enums/loading_status.dart';

class LoginState{
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginStatus = LoadStatus.initial.obs;

  LoginState(){

    emailController = TextEditingController(text: kDebugMode ? "kishan@yopmail.com" : "");
    passwordController = TextEditingController(text: kDebugMode ? "12345678":"");

  }

}