part of 'base_cubit.dart';

class BaseState extends Equatable {
  final String namePage;
  final bool menuIsOpen;
  final double heightPage;
  final int currentIndexPage;

  const BaseState({
    this.menuIsOpen = false,
    this.heightPage = 100,
    this.namePage = 'INICIO',
    this.currentIndexPage = 0,
  });

  @override
  List<Object?> get props => [
        namePage,
        menuIsOpen,
        heightPage,
        currentIndexPage,
      ];

  BaseState copyWith({
    final String? namePage,
    final bool? menuIsOpen,
    final double? heightPage,
    final int? currentIndexPage,
  }) {
    return BaseState(
      namePage: namePage ?? this.namePage,
      menuIsOpen: menuIsOpen ?? this.menuIsOpen,
      heightPage: heightPage ?? this.heightPage,
      currentIndexPage: currentIndexPage ?? this.currentIndexPage,
    );
  }
}
