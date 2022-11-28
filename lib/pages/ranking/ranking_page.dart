import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/components/custom_ranking.dart';
import 'package:habilita_enem/pages/ranking/ranking_cubit.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final rankingCubit = GetIt.I.get<RankingCubit>();

  @override
  void initState() {
    rankingCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    return BlocBuilder<RankingCubit, RankingState>(
      bloc: rankingCubit,
      builder: (context, state) {
        return SizedBox(
          width: wight,
          height: 200,
          child: CustomRanking(
            first: state.first,
            second: state.second,
            third: state.third,
          ),
        );
      },
    );
  }
}
