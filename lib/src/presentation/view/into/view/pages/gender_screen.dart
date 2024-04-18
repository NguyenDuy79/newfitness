import 'package:fitness_nutrition/src/presentation/view/into/widget/gender/gender_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.dimens_12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
                child: IconButton(
                    onPressed: () {
                      context.read<InfomationBodyDartCubit>().changeIndex(0);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
                child: Center(
                  child: Text(
                    'Giới tính sinh học của bạn là gì ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimens.dimens_24,
                        fontWeight: AppFont.semiBold),
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimens.dimens_16,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
                child: BlocBuilder<InfomationBodyDartCubit,
                    InfomationBodyDartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        GenderWidget('Male', state.gender, sizeScreen,
                            state.heightWidget),
                        const SizedBox(
                          width: AppDimens.dimens_16,
                        ),
                        GenderWidget('Female', state.gender, sizeScreen,
                            state.heightWidget),
                      ],
                    );
                  },
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                builder: (context, state) {
          return state.gender == ''
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(
                      right: AppDimens.dimens_24,
                      left: AppDimens.dimens_24,
                      bottom: AppDimens.dimens_12),
                  child: GestureDetector(
                    onTap: () {
                      context.read<InfomationBodyDartCubit>().changeIndex(2);
                    },
                    child: Container(
                      height: AppDimens.dimens_45,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.pink.withOpacity(0.8),
                          borderRadius:
                              BorderRadius.circular(AppDimens.dimens_16)),
                      child: const Text(
                        'Tiếp theo',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_28,
                            fontWeight: AppFont.semiBold,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                );
        }));
  }
}
