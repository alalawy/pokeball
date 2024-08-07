import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vein/vein.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  DefaultTextField(
      {super.key,
      this.controller,
      this.inputType,
      this.isPassword = false,
      this.obsecure = false,
      this.onEyeTap,
      this.heading,
      this.placeholder,
      this.autofocus = false});

  TextEditingController? controller;
  TextInputType? inputType;
  bool isPassword;
  bool obsecure;
  VoidCallback? onEyeTap;
  Widget? heading;
  String? placeholder;
  bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obsecure,
      autofocus: autofocus,
      style: TextStyles()
          .regularNoneRegular()
          .copyWith(color: MainColor.inkLighter),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MainColor.skyLight, width: 1),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MainColor.primary, width: 1),
              borderRadius: BorderRadius.circular(8)),
          prefixIcon: heading ?? 0.w,
          hintText: placeholder,
          hintStyle: TextStyle(color: MainColor.inkLighter),
          suffixIcon: isPassword
              ? InkWell(
                  onTap: onEyeTap,
                  child: obsecure
                      ? const HugeIcon(
                          icon: HugeIcons.strokeRoundedViewOffSlash,
                          color: MainColor.inkDarkest)
                      : const HugeIcon(
                          icon: HugeIcons.strokeRoundedView,
                          color: MainColor.inkDarkest))
              : 0.h),
    );
  }
}
