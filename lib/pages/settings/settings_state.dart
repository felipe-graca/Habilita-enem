part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final List<HistoryModel> historyQuestions;
  const SettingsState({
    this.historyQuestions = const [],
  });

  @override
  List<Object?> get props => [
        historyQuestions,
      ];

  SettingsState copyWith({
    final List<HistoryModel>? historyQuestions,
  }) {
    return SettingsState(
      historyQuestions: historyQuestions ?? this.historyQuestions,
    );
  }
}
