import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget(this.function, {super.key});
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function, icon: const Icon(Icons.arrow_back_ios));
  }
}
