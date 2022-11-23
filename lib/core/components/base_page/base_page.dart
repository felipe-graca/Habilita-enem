import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/components/base_page/base_cubit.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'package:habilita_enem/pages/quiz/quiz_page.dart';
import 'package:habilita_enem/shared/spacing.dart';

class BasePage extends StatelessWidget {
  BasePage({
    Key? key,
  }) : super(key: key);

  final baseCubit = GetIt.I.get<BaseCubit>();

  final _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          right: false,
          left: false,
          child: Stack(
            children: [
              HeaderMenu(
                key: _widgetKey,
                onTap: () async {
                  baseCubit.menuController(_widgetKey);
                },
              ),
              const _Body()
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> with AutomaticKeepAliveClientMixin {
  final baseCubit = GetIt.I.get<BaseCubit>();

  @override
  void initState() {
    baseCubit.init(context);
    super.initState();
  }

  @override
  void dispose() {
    baseCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final navigator = Navigator.of(context);
    final mediaHeight = MediaQuery.of(context).size.height;

    final pages = <Widget>[
      const QuizPage(),
      const QuizPage(),
      const QuizPage(),
      const QuizPage(),
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<BaseCubit, BaseState>(
        bloc: baseCubit,
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            height: mediaHeight - state.heightPage,
            padding: state.menuIsOpen
                ? EdgeInsets.zero
                : const EdgeInsets.only(top: Spacing.xl),
            decoration: const BoxDecoration(
              color: Color(0xFFD9C1F0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 15.0,
                  offset: Offset(4, 1),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0xFF394368),
                  blurRadius: 24,
                  offset: Offset(5, -5),
                  spreadRadius: -3,
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(41),
                topRight: Radius.circular(41),
              ),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ExpandablePageView.builder(
                    itemCount: pages.length,
                    controller: baseCubit.pageController,
                    itemBuilder: (context, index) {
                      return pages[index];
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Visibility(
                    visible: state.menuIsOpen,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 800),
                      opacity: state.heightPage == 120 ? 0 : 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFFDBC7EE),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(41),
                            topRight: Radius.circular(41),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: Spacing.m),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: LinearGradientMask(
                                  child: Image.asset(
                                    'assets/icons/profile_icon.png',
                                  ),
                                ),
                              ),
                              const SizedBox(width: Spacing.s),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    GetIt.I
                                        .get<AuthCubit>()
                                        .currentUser
                                        .name
                                        .toUpperCase()
                                        .substring(0, 6),
                                    style: GoogleFonts.roboto(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      letterSpacing: 2.48,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: Spacing.xxs),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: LinearGradientMask(
                                          child: Image.asset(
                                            'assets/icons/points_icon.png',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: Spacing.xxs),
                                      Text(
                                        GetIt.I
                                            .get<AuthCubit>()
                                            .currentUser
                                            .points
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          letterSpacing: 3.48,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: Spacing.l),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await GetIt.I<AuthCubit>().logout();

                                          navigator.pushNamedAndRemoveUntil(
                                            AppRouter.login,
                                            ModalRoute.withName(
                                                AppRouter.login),
                                          );
                                        },
                                        child: LinearGradientMask(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: LinearGradientMask(
                                              child: Image.asset(
                                                'assets/icons/logout_icon.png',
                                                scale: 0.8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class LinearGradientMask extends StatelessWidget {
  const LinearGradientMask({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF17A6D7),
            Color(0xFF9D31FE),
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}

class HeaderMenu extends StatelessWidget {
  final Function()? onTap;

  HeaderMenu({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final baseCubit = GetIt.I.get<BaseCubit>();

  final menuItems = [
    {
      'title': 'INICIO',
      'iconAsset': 'assets/icons/home_icon.png',
    },
    {
      'title': 'RANKING',
      'iconAsset': 'assets/icons/points_icon.png',
    },
    {
      'title': 'QUIZ',
      'iconAsset': 'assets/icons/quiz_icon.png',
    },
    {
      'title': 'HISTORICO',
      'iconAsset': 'assets/icons/history_icon.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<BaseCubit, BaseState>(
      bloc: baseCubit,
      builder: (context, state) {
        return SizedBox(
          height: state.menuIsOpen ? (mediaHeight - (mediaHeight * 0.14)) : 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: Spacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
                    child: InkWell(
                      onTap: onTap,
                      child: Icon(
                        state.menuIsOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
                    child: Text(
                      state.namePage,
                      style: GoogleFonts.lato(
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 3.48,
                        shadows: [
                          const Shadow(
                            color: Colors.white,
                            blurRadius: 30,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Visibility(
                  visible: state.menuIsOpen,
                  child: Column(
                    children: [
                      const SizedBox(height: Spacing.m),
                      Container(
                        height: 0.5,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      const SizedBox(height: Spacing.xs),
                      Column(
                        children: [
                          ...menuItems.map((e) {
                            return InkWell(
                              onTap: () {
                                baseCubit.pageController
                                    .jumpToPage(menuItems.indexOf(e));
                                baseCubit.emitMenuIsOpen();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Spacing.l,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: Spacing.s,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.17),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Spacing.m,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                e['iconAsset'].toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          e['title'].toString(),
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.lato(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            letterSpacing: 2.48,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
