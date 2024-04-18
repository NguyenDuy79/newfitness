import 'package:fitness_nutrition/src/core/resource/app_colors.dart';
import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/core/resource/app_fonts.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(this.hint, this.funtion, this.errorText,
      {super.key});
  final String hint;
  final Function(String value) funtion;
  final Function(String value) errorText;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TextFormField(
        style: const TextStyle(
            fontSize: AppDimens.dimens_16,
            fontWeight: AppFont.normal,
            color: AppColor.black),
        onChanged: (value) {
          widget.funtion(value);
        },
        validator: (value) {
          return widget.errorText(value!);
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        cursorColor: AppColor.black,
        cursorHeight: AppDimens.dimens_16,
        maxLines: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          // focusColor: AppColor.grey1,
          // hoverColor: AppColor.grey1,
          isDense: true,
          hintStyle: TextStyle(
              fontSize: AppDimens.dimens_16,
              fontWeight: AppFont.normal,
              color: AppColor.black.withOpacity(0.6)),
          fillColor: AppColor.white,
          filled: true,
          contentPadding: const EdgeInsets.only(
              left: AppDimens.dimens_20,
              top: AppDimens.dimens_5,
              bottom: AppDimens.dimens_5),
          hintText: widget.hint,
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.dimens_8))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.dimens_8))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.dimens_8))),
          focusedBorder: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.dimens_8)),
              borderSide: BorderSide(color: AppColor.grey)),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
