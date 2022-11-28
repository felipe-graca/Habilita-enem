part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final List<HistoryModel> historyQuestions;
  const HistoryState({
    this.historyQuestions = const [],
  });

  @override
  List<Object?> get props => [
        historyQuestions,
      ];

  HistoryState copyWith({
    final List<HistoryModel>? historyQuestions,
  }) {
    return HistoryState(
      historyQuestions: historyQuestions ?? this.historyQuestions,
    );
  }
}
