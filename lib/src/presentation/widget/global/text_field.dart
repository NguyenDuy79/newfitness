import 'package:flutter/cupertino.dart';

import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      this.funtion, this.hint, this.textInputType, this.prefix, this.autoFocus,
      {super.key});

  final String hint;
  final Function(String value) funtion;
  final TextInputType textInputType;
  final Widget prefix;
  final bool autoFocus;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: widget.funtion,
      autofocus: widget.autoFocus,
      placeholder: widget.hint,
      cursorColor: AppColor.black.withOpacity(0.2),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      prefix: widget.prefix,
      keyboardType: widget.textInputType,
      decoration: BoxDecoration(
          color: AppColor.grey1,
          borderRadius: BorderRadius.circular(AppDimens.dimens_8),
          border: Border.all(
              width: AppDimens.dimens_1,
              color: AppColor.black.withOpacity(0.2))),
    );
  }
}
