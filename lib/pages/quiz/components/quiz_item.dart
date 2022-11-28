// import 'package:flutter/material.dart';
// import 'package:habilita_enem/shared/spacing.dart';

// class QuizItem extends StatelessWidget {
//   final int index;
//   const QuizItem({
//     required this.index,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final questionsOptions = ['a', 'b', 'c', 'd', 'e'];

//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${(index + 1)})',
//                   style: GoogleFonts.lato(
//                     fontSize: 20,
//                     letterSpacing: 1,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: Spacing.xs,
//                 ),
//                 Flexible(
//                   child: Text(
//                     state.questions[index].text,
//                     style: GoogleFonts.lato(
//                       fontSize: 15,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: Spacing.l),
//             InkWell(
//               onTap: () => {
//                 quizCubit.checkCurrectQuestion(
//                     resultQuestion: state.questions[index].result,
//                     subjectQuestion: state.title!,
//                     userResult: 'aResult')
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'A )',
//                     style: GoogleFonts.lato(
//                       fontSize: 16,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                   const SizedBox(width: Spacing.xs),
//                   Flexible(
//                     child: Text(
//                       state.questions[index].aResult,
//                       style: GoogleFonts.lato(
//                         fontSize: 16,
//                         letterSpacing: 1.1,
//                         height: 1.3,
//                         color: state.userResult != null
//                             ? (state.currentQuestion?.result == state.userResult
//                                 ? Colors.green
//                                 : Colors.red)
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: Spacing.m),
//             InkWell(
//               onTap: () => {
//                 quizCubit.checkCurrectQuestion(
//                     resultQuestion: state.questions[index].result,
//                     subjectQuestion: state.title!,
//                     userResult: 'bResult')
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'B )',
//                     style: GoogleFonts.lato(
//                       fontSize: 16,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                   const SizedBox(width: Spacing.xs),
//                   Flexible(
//                     child: Text(
//                       state.questions[index].bResult,
//                       style: GoogleFonts.lato(
//                         fontSize: 16,
//                         letterSpacing: 1.1,
//                         height: 1.3,
//                         color: state.userResult != null
//                             ? (state.currentQuestion?.result == state.userResult
//                                 ? Colors.green
//                                 : Colors.red)
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: Spacing.m),
//             InkWell(
//               onTap: () => {
//                 quizCubit.checkCurrectQuestion(
//                     resultQuestion: state.questions[index].result,
//                     subjectQuestion: state.title!,
//                     userResult: 'cResult')
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'C )',
//                     style: GoogleFonts.lato(
//                       fontSize: 16,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                   const SizedBox(width: Spacing.xs),
//                   Flexible(
//                     child: Text(
//                       state.questions[index].cResult,
//                       style: GoogleFonts.lato(
//                         fontSize: 16,
//                         letterSpacing: 1.1,
//                         height: 1.3,
//                         color: state.userResult != null
//                             ? (state.currentQuestion?.result == state.userResult
//                                 ? Colors.green
//                                 : Colors.red)
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: Spacing.m),
//             InkWell(
//               onTap: () => {
//                 quizCubit.checkCurrectQuestion(
//                     resultQuestion: state.questions[index].result,
//                     subjectQuestion: state.title!,
//                     userResult: 'dResult')
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'D )',
//                     style: GoogleFonts.lato(
//                       fontSize: 16,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                   const SizedBox(width: Spacing.xs),
//                   Flexible(
//                     child: Text(
//                       state.questions[index].dResult,
//                       style: GoogleFonts.lato(
//                         fontSize: 16,
//                         letterSpacing: 1.1,
//                         height: 1.3,
//                         color: state.userResult != null
//                             ? (state.currentQuestion?.result == state.userResult
//                                 ? Colors.green
//                                 : Colors.red)
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: Spacing.m),
//             InkWell(
//               onTap: () => {
//                 quizCubit.checkCurrectQuestion(
//                     resultQuestion: state.questions[index].result,
//                     subjectQuestion: state.title!,
//                     userResult: 'eResult')
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'E )',
//                     style: GoogleFonts.lato(
//                       fontSize: 16,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                   const SizedBox(width: Spacing.xs),
//                   Flexible(
//                     child: Text(
//                       state.questions[index].eResult,
//                       style: GoogleFonts.lato(
//                         fontSize: 16,
//                         letterSpacing: 1.1,
//                         height: 1.3,
//                         color: state.userResult != null
//                             ? (state.currentQuestion?.result == state.userResult
//                                 ? Colors.green
//                                 : Colors.red)
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: Spacing.m),
//           ],
//         ),
//       ),
//     );
//   }
// }
