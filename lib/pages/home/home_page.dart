import 'package:flutter/material.dart';
import 'package:habilita_enem/core/components/custom_ranking.dart';
import 'package:habilita_enem/shared/componentes/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      titlePage: 'INICIO',
      body: ListView(
        shrinkWrap: true,
        children: const [
          CustomRanking(),
        ],
      ),
    );
  }
}
