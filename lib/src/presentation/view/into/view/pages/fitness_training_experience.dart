// import 'package:flutter/material.dart';


// import '../../../../../config/route/route_generator_route.dart';
// import '../../../../../core/resource/app_colors.dart';
// import '../../../../../core/resource/app_dimens.dart';
// import '../../../../../core/resource/app_fonts.dart';

// class FitnessTrainingExperience extends StatelessWidget {
//   const FitnessTrainingExperience(this.controller, {super.key});
//   final PageController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: AppDimens.dimens_12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: AppDimens.dimens_8, vertical: AppDimens.dimens_8),
//               child: GestureDetector(
//                   onTap: () {
//                     controller.animateToPage(7,
//                         duration: const Duration(milliseconds: 200),
//                         curve: Curves.linear);
//                   },
//                   child: const Icon(Icons.arrow_back_ios)),
//             ),
//             const SizedBox(
//               height: AppDimens.dimens_16,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
//                     child: Center(
//                       child: Text(
//                         'Bạn đã tập luyện được bao lâu ?',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: AppDimens.dimens_24,
//                             fontWeight: AppFont.semiBold),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: AppDimens.dimens_16),
//                       child: Container(
//                         height: AppDimens.dimens_105,
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: AppDimens.dimens_8),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(AppDimens.dimens_24),
//                             border: Border.all(
//                                 width: AppDimens.dimens_1,
//                                 color: AppColor.pink.withOpacity(0.5))),
//                         child: const Text(
//                           'Mới bắt đầu',
//                           style: TextStyle(
//                             fontSize: AppDimens.dimens_28,
//                             fontWeight: AppFont.semiBold,
//                           ),
//                         ),
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: AppDimens.dimens_16),
//                       child: Container(
//                         height: AppDimens.dimens_105,
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: AppDimens.dimens_8),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(AppDimens.dimens_24),
//                             border: Border.all(
//                                 width: AppDimens.dimens_1,
//                                 color: AppColor.pink.withOpacity(0.5))),
//                         child: const Text(
//                           'Kinh nghiệm dưới 1 năm',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: AppDimens.dimens_28,
//                               fontWeight: AppFont.semiBold,
//                               color: AppColor.black),
//                         ),
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: AppDimens.dimens_16),
//                       child: Container(
//                         height: AppDimens.dimens_105,
//                         width: double.infinity,
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: AppDimens.dimens_8),
//                         decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(AppDimens.dimens_24),
//                             border: Border.all(
//                                 width: AppDimens.dimens_1,
//                                 color: AppColor.pink.withOpacity(0.5))),
//                         child: const Text(
//                           'Kinh nghiệm trên 1 năm',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: AppDimens.dimens_28,
//                               fontWeight: AppFont.semiBold,
//                               color: AppColor.black),
//                         ),
//                       )),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(
//             right: AppDimens.dimens_24,
//             left: AppDimens.dimens_24,
//             bottom: AppDimens.dimens_12),
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context)
//                 .pushReplacementNamed(RouteGenerator.mainScreen);
//           },
//           child: Container(
//             height: AppDimens.dimens_45,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: AppColor.pink.withOpacity(0.8),
//                 borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
//             child: const Text(
//               'Bắt đầu tập',
//               style: TextStyle(
//                   fontSize: AppDimens.dimens_28,
//                   fontWeight: AppFont.semiBold,
//                   color: AppColor.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
