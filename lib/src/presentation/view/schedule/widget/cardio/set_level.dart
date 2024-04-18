import 'package:fitness_nutrition/src/core/resource/app_dimens.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/exercsie_cubit/exericse_cubit.dart';
import 'package:fitness_nutrition/src/presentation/view/schedule/cubit/schedule_screen_cubit/schedule_screen_cubit.dart';
import 'package:fitness_nutrition/src/presentation/widget/global/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resource/app_fonts.dart';

class SetLevel extends StatelessWidget {
  const SetLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        const Text(
          'Chọn các mức độ',
          style: TextStyle(
              fontSize: AppDimens.dimens_24, fontWeight: AppFont.semiBold),
        ),
        const SizedBox(
          height: AppDimens.dimens_16,
        ),
        SizedBox(
          height: AppDimens.dimens_150,
          width: AppDimens.dimens_120,
          child: BlocBuilder<ExericseCubit, ExericseState>(
            builder: (context, state) {
              return CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: state.hiitLevel - 1,
                  ),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    context.read<ExericseCubit>().setHiitLeve(index + 1);
                  },
                  children: listItem());
            },
          ),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.bottomCenter,
          child: BottomNavigationBarWidget(() {
            context.read<ExericseCubit>().increaseLevel();
            context.read<ScheduleScreenMainCubit>().changeChooseExercise(true);
          }, true, 'Tiếp tục'),
        )),
      ],
    );
  }
}

List<Widget> listItem() {
  List<Widget> list = [];
  for (int i = 1; i <= 10; i++) {
    list.add(Text(i.toString()));
  }

  return list;
}
