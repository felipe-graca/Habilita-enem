import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/pages/history/history_cubit.dart';
import 'package:habilita_enem/shared/spacing.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final historyCubit = GetIt.I.get<HistoryCubit>();

  @override
  void initState() {
    historyCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widht,
      child: BlocBuilder<HistoryCubit, HistoryState>(
        bloc: historyCubit,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: Spacing.m),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.historyQuestions.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: Spacing.m),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Spacing.m,
                        right: Spacing.m,
                      ),
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 197, 157, 236),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: Spacing.xs,
                            left: Spacing.s,
                            right: Spacing.s,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.historyQuestions[index].subject,
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      letterSpacing: 4,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  Text(
                                    "Questão ${state.historyQuestions[index].questionNumber}",
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      letterSpacing: 4,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: Spacing.m),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: state.historyQuestions[index]
                                                      .question.result ==
                                                  state.historyQuestions[index]
                                                      .userRsult
                                              ? Colors.green.shade800
                                              : Colors.red,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        state.historyQuestions[index].question
                                                    .result ==
                                                state.historyQuestions[index]
                                                    .userRsult
                                            ? Icons.check
                                            : Icons.close,
                                        size: 12,
                                        color: state.historyQuestions[index]
                                                    .question.result ==
                                                state.historyQuestions[index]
                                                    .userRsult
                                            ? Colors.green.shade800
                                            : Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: Spacing.xs),
                                    Text(
                                      state.historyQuestions[index].question
                                                  .result ==
                                              state.historyQuestions[index]
                                                  .userRsult
                                          ? "Acertou"
                                          : "Errou",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        letterSpacing: 4,
                                        color: state.historyQuestions[index]
                                                    .question.result ==
                                                state.historyQuestions[index]
                                                    .userRsult
                                            ? Colors.green.shade800
                                            : Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: Spacing.m,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
