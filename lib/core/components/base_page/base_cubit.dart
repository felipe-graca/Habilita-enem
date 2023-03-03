import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';

import '../../helpers/app_ui.dart';
import '../../routes/app_router.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  final AuthCubit _authCubit;
  BaseCubit(this._authCubit) : super(const BaseState());

  late PageController pageController;
  late StreamSubscription authSubscription;

  void init(BuildContext context) {
    emit(const BaseState());

    pageController = PageController(initialPage: 0);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppUI.checkSnackbarToDisplay(context: context, page: AppRouter.base);

      authSubscription = _authCubit.isLogged.listen((event) async {
        if (!event) {
          Navigator.of(context).pushReplacementNamed(
            AppRouter.login,
          );
        }
      });
      pageController.addListener(
        () {
          final indexPage = pageController.page!.round();
          if (state.currentIndexPage != indexPage) {
            changeCurrentIndexPage(indexPage);
          }
          switch (indexPage) {
            case 0:
              changeName('HOME');
              break;
            case 1:
              changeName('GAME - QUIZ');
              break;
            case 2:
              changeName('RANKING');
              break;
            case 3:
              changeName('HISTORICO');
              break;
            default:
          }
        },
      );
    });
  }

  Future<bool> initializeController() async {
    final completer = Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return await completer.future;
  } // /initializeController()

  void getWidgetInfo(GlobalKey widgetKey) {
    final RenderBox renderBox =
        widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size;

    emitHeightPage(size.height);
  }

  void dispose() {
    pageController.dispose();
  }

  void emitMenuIsOpen() {
    emit(state.copyWith(menuIsOpen: !state.menuIsOpen, heightPage: 100));
  }

  Future<void> menuController(GlobalKey widgetKey) async {
    emit(state.copyWith(
      menuIsOpen: !state.menuIsOpen,
    ));
    Future.delayed(const Duration(milliseconds: 50), () {
      getWidgetInfo(widgetKey);
    });
  }

  void changeName(String value) {
    emit(state.copyWith(namePage: value));
  }

  void emitHeightPage(double value) {
    emit(state.copyWith(heightPage: value));
  }

  void changeCurrentIndexPage(int value) {
    emit(state.copyWith(currentIndexPage: value));
  }
}
