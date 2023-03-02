import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/pages/quiz/quiz_cubit.dart';
import 'package:habilita_enem/shared/spacing.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizCubit = GetIt.I.get<QuizCubit>();

  final scrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    quizCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;

    final subjects = [
      {
        'value': 'todos',
        'title': 'Todas disciplinas',
        'icon': 'assets/icons/science_subject.png'
      },
      {
        'value': 'historia',
        'title': 'Historia',
        'icon': 'assets/icons/history_subject.png'
      },
      {
        'value': 'biologia',
        'title': 'Biologia',
        'icon': 'assets/icons/biology_subject.png'
      },
      {
        'value': 'geografia',
        'title': 'Geografia',
        'icon': 'assets/icons/geography_subject.png'
      },
      {
        'value': 'matematica',
        'title': 'Matematica',
        'icon': 'assets/icons/math_subject.png'
      },
      {
        'value': 'portugues',
        'title': 'Portugues',
        'icon': 'assets/icons/grammar_subject.png'
      },
      {
        'value': 'ciencias',
        'title': 'Ciencias',
        'icon': 'assets/icons/science_subject.png'
      },
      {
        'value': 'sociologia',
        'title': 'Sociologia',
        'icon': 'assets/icons/sociology_subject.png'
      },
    ];

    return SizedBox(
      height: double.infinity,
      width: widht,
      child: BlocBuilder<QuizCubit, QuizState>(
        bloc: quizCubit,
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: Spacing.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: state.currentQuestion != null,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Spacing.l, right: Spacing.l),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              if (state.questions
                                      .indexOf(state.currentQuestion!) >=
                                  1) {
                                quizCubit.returnQuestion(state.questions
                                        .indexOf(state.currentQuestion!) -
                                    1);
                                return;
                              }
                              quizCubit.clearSubjectQuestion();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_sharp,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                quizCubit.nextQuestion(state.questions
                                        .indexOf(state.currentQuestion!) +
                                    1);
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Spacing.xxs),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.title.toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: state.currentQuestion != null ? Spacing.xl : null,
                  ),
                  Column(
                    children: [
                      if (state.currentQuestion == null)
                        ...subjects
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(
                                  left: Spacing.l,
                                  right: Spacing.l,
                                  bottom: Spacing.m,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    quizCubit.updateSubjectQuestion(
                                        value: e['value']!, title: e['title']!);
                                  },
                                  child: Container(
                                    height: 68,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 197, 157, 236),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 155, 155, 155),
                                          width: 0.8,
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 10,
                                            offset: Offset(4, 4),
                                            color: Color.fromARGB(
                                                255, 109, 109, 109),
                                          ),
                                          BoxShadow(
                                              blurRadius: 20,
                                              offset: Offset(0, 0),
                                              color: Color.fromARGB(
                                                  85, 255, 255, 255))
                                        ]),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: Spacing.l),
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Image.asset(e['icon']!),
                                        ),
                                        const SizedBox(width: Spacing.l),
                                        Text(
                                          e['title']!,
                                          style: GoogleFonts.lato(
                                              fontSize: 20,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              letterSpacing: 2.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList()
                      else
                        SizedBox(
                          width: double.maxFinite,
                          child: ExpandablePageView.builder(
                            itemCount: state.questions.length,
                            physics: const NeverScrollableScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            controller: quizCubit.pageController,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Spacing.m),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${(index + 1)})',
                                            style: GoogleFonts.lato(
                                              fontSize: 20,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: Spacing.xs,
                                          ),
                                          Flexible(
                                            child: Text(
                                              state.questions[index].text,
                                              style: GoogleFonts.lato(
                                                fontSize: 15,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: Spacing.l),
                                      InkWell(
                                        onTap: () => {
                                          if (state.result == null)
                                            {
                                              quizCubit.checkCurrectQuestion(
                                                  resultQuestion: state
                                                      .questions[index].result,
                                                  subjectQuestion: state.title!,
                                                  userResult: 'aResult')
                                            }
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'A )',
                                              style: GoogleFonts.lato(
                                                fontSize: 16,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                            const SizedBox(width: Spacing.xs),
                                            Flexible(
                                              child: Text(
                                                state.questions[index].aResult,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  letterSpacing: 1.1,
                                                  height: 1.3,
                                                  color: state.userResult !=
                                                          null
                                                      ? (state.currentQuestion
                                                                  ?.result ==
                                                              'aResult'
                                                          ? Colors.green
                                                          : Colors.red)
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Spacing.m),
                                      InkWell(
                                        onTap: () => {
                                          if (state.result == null)
                                            {
                                              quizCubit.checkCurrectQuestion(
                                                  resultQuestion: state
                                                      .questions[index].result,
                                                  subjectQuestion: state.title!,
                                                  userResult: 'bResult')
                                            }
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'B )',
                                              style: GoogleFonts.lato(
                                                fontSize: 16,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                            const SizedBox(width: Spacing.xs),
                                            Flexible(
                                              child: Text(
                                                state.questions[index].bResult,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  letterSpacing: 1.1,
                                                  height: 1.3,
                                                  color: state.userResult !=
                                                          null
                                                      ? (state.currentQuestion
                                                                  ?.result ==
                                                              'bResult'
                                                          ? Colors.green
                                                          : Colors.red)
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Spacing.m),
                                      InkWell(
                                        onTap: () => {
                                          if (state.result == null)
                                            {
                                              quizCubit.checkCurrectQuestion(
                                                  resultQuestion: state
                                                      .questions[index].result,
                                                  subjectQuestion: state.title!,
                                                  userResult: 'cResult')
                                            }
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'C )',
                                              style: GoogleFonts.lato(
                                                fontSize: 16,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                            const SizedBox(width: Spacing.xs),
                                            Flexible(
                                              child: Text(
                                                state.questions[index].cResult,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  letterSpacing: 1.1,
                                                  height: 1.3,
                                                  color: state.userResult !=
                                                          null
                                                      ? (state.currentQuestion
                                                                  ?.result ==
                                                              'cResult'
                                                          ? Colors.green
                                                          : Colors.red)
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Spacing.m),
                                      InkWell(
                                        onTap: () => {
                                          if (state.result == null)
                                            {
                                              quizCubit.checkCurrectQuestion(
                                                  resultQuestion: state
                                                      .questions[index].result,
                                                  subjectQuestion: state.title!,
                                                  userResult: 'dResult')
                                            }
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'D )',
                                              style: GoogleFonts.lato(
                                                fontSize: 16,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                            const SizedBox(width: Spacing.xs),
                                            Flexible(
                                              child: Text(
                                                state.questions[index].dResult,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  letterSpacing: 1.1,
                                                  height: 1.3,
                                                  color: state.userResult !=
                                                          null
                                                      ? (state.currentQuestion
                                                                  ?.result ==
                                                              'dResult'
                                                          ? Colors.green
                                                          : Colors.red)
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Spacing.m),
                                      InkWell(
                                        onTap: () => {
                                          if (state.result == null)
                                            {
                                              quizCubit.checkCurrectQuestion(
                                                  resultQuestion: state
                                                      .questions[index].result,
                                                  subjectQuestion: state.title!,
                                                  userResult: 'eResult')
                                            }
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'E )',
                                              style: GoogleFonts.lato(
                                                fontSize: 16,
                                                letterSpacing: 1.1,
                                              ),
                                            ),
                                            const SizedBox(width: Spacing.xs),
                                            Flexible(
                                              child: Text(
                                                state.questions[index].eResult,
                                                style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  letterSpacing: 1.1,
                                                  height: 1.3,
                                                  color: state.userResult !=
                                                          null
                                                      ? (state.currentQuestion
                                                                  ?.result ==
                                                              'eResult'
                                                          ? Colors.green
                                                          : Colors.red)
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Spacing.m),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
