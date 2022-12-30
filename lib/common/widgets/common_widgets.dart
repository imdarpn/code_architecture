import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/common/constants/color_constants.dart';
import 'package:getx_structure/common/constants/string_constants.dart';
import 'package:getx_structure/common/widgets/custom_button.dart';

import '../constants/font_constants.dart';

class CommonWidgets{

  handleErrorDialog(String msg, BuildContext context) {
    return Get.defaultDialog(
      title: "",
      contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      middleText: msg,
      // textConfirm: StringAssets.okay,
      onConfirm: () {
        if (Get.overlayContext != null) {
          Navigator.of(Get.overlayContext!).pop();
        }
      },
      confirm: CustomButton.fillButton(
          width: 60,
          height: 36,
          context: context,
          function: () {
            Navigator.of(Get.overlayContext!).pop();
          },
          text: StringConstants.okay,
          fontSize: FontConstants.font_18,
          backGroundColor: ColorConstants.selectedLightGreen),
      radius: 10,
      middleTextStyle: const TextStyle(
          color: ColorConstants.blackColor,
          fontSize: FontConstants.font_14,
          fontWeight: FontWeightConstants.regular),
      // confirmTextColor: ColorConstant.submit_button
    );
  }

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(StringConstants.msgCheckConnection);
      return false;
    } else {
      return true;
    }
  }

  static showSnackBar(String message, {Color? bgColor}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(message),
      titleText: Container(),
      backgroundColor: bgColor ?? Colors.white,
      colorText: Theme.of(Get.context!).colorScheme.surface,
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      margin:  EdgeInsets.all(10.0),
      /*mainButton: TextButton(
      child: Text('Undo'),
      onPressed: () {},
    ),*/
    );
  }

  static Widget commonText(
      {
        Color? color,
        double? fontSize,
        double? height,
        String? text,
        FontWeight? fontWeight,
        int? maxLine =3,
        String fontFamily = FontFamilyConstants.barlow,
        Function? onClick,
      }
      ){
    return  GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Text(

        text ?? "",
        maxLines: maxLine,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            fontFamily: fontFamily
        ),
      ),
    );
  }

  static Widget commonFilledButton({
    required BuildContext? context,
    String? title,
    Color? color,
    Color? textColor,
    double? fontSize=18,
    String? text,
    double? topPadding ,
    FontWeight? fontWeight,
    // VoidCallback? onSubmit,
    void Function()? onclick,
    String fontFamily = FontFamilyConstants.barlow,
  }){
    return Padding(
      padding:  EdgeInsets.only(top: topPadding ?? 0),
      child: GestureDetector(
        onTap: (){
          onclick?.call();
          CommonWidgets().hideKeyboard(context!);
        },
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title?? "",
              style:TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  height: 1.0,
                  fontWeight: fontWeight,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: fontFamily
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget commonTextFormField(

      {
        String? hint,
        bool autofocus = false,
        double fontSize = 17,
        bool readOnly = false,
        Function? onChanged,
        Function? onTap,
        TextEditingController? textEditingController,
        Color textColor = Colors.black,
        Widget? suffixIcon,
        Widget? prefixIcon,
        bool obscureText = false,
        EdgeInsets? contentPadding = const EdgeInsets.all(15),
        Function? onEditingComplete,
        String? labelText,
        FontWeight? fontWeight,
        String fontFamily = FontFamilyConstants.barlow,
        String? counterText,
        ///validation
        bool allowValidation = true,
        String? errorMessage,
        String? validationMessage,
        String? validationRegex,
        int? value,
        int? length,
        String? lengthMessage,

      }) {
    return/* Padding(
      padding: EdgeInsets.only(top: isTopPadding ? 8.0 : 0.0),
      child:*/ TextFormField(
      validator: (text){
        if(textEditingController!.text.trim().isEmpty && allowValidation){
          return errorMessage ?? "Invalid errorMessage";
        }
        else if(value != null && (int.parse(textEditingController.text.trim().trim())>value)){
          return validationMessage??"Invalid value";
        }
        else if(length != null && lengthMessage != null) {
          if (textEditingController.text
              .trim()
              .length < length ||
              textEditingController.text
                  .trim()
                  .length > length) {
            return lengthMessage;
          }
        }
        else if(validationRegex != null){
          if(!RegExp(validationRegex).hasMatch(text!.trim())){
            return validationMessage ?? "Invalid Validation Message";
          }
        }
        return null;
      },

      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle: const TextStyle(
            fontSize: 17,
            color:  ColorConstants.greyFont
        ),
        counterStyle: const TextStyle(color: ColorConstants.selectedLightGreen),
        counterText: counterText,
        suffixIcon: SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: suffixIcon,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(

          minHeight: 33,
          minWidth: 33,
          maxHeight: 90,
          maxWidth: 90,


        ),
        prefixIcon: prefixIcon,
        // suffixText: suffixText,
        suffixStyle: TextStyle(fontSize: fontSize, color: textColor),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            const BorderSide(color: ColorConstants.greyGradient1)),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorConstants.greyFont)
        ),
        hintStyle: TextStyle(
          inherit: true,
          fontSize: fontSize,
          color: ColorConstants.greyFont,
        ),
        hintText: hint,
      ),
      cursorHeight: 16,
      obscuringCharacter: "*",
      readOnly: readOnly,
      controller: textEditingController,
      onChanged: (value) {
        onChanged?.call(value);
      },
      onTap: () {
        onTap?.call();
      },
      onEditingComplete: () {
        onEditingComplete?.call();
      },
      cursorColor: ColorConstants.greyFont,
      obscureText: obscureText,
      autofocus: autofocus,
      style: TextStyle(fontSize: fontSize, color: textColor,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          height: 1.0
      ),


    );
  }
}