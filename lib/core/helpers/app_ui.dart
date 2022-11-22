import 'package:flutter/material.dart';
import 'package:habilita_enem/core/components/custom_snackbar.dart';

class AppUI {
  AppUI._();

  static final snackbarsToDisplayWhenStart = <SnackbarToDisplayModel>[];

  static void checkSnackbarToDisplay({
    required BuildContext context,
    required String page,
  }) {
    final index = AppUI.snackbarsToDisplayWhenStart
        .indexWhere((element) => element.page == page);

    if (index != -1) {
      CustomSnackBar.show(
        text: snackbarsToDisplayWhenStart[index].text,
        status: snackbarsToDisplayWhenStart[index].status,
        context: context,
      );

      AppUI.snackbarsToDisplayWhenStart.removeAt(index);
    }
  }
}
