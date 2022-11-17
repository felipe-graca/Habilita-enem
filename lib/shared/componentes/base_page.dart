import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/shared/spacing.dart';

class BasePage extends StatefulWidget {
  final String titlePage;
  final Widget body;
  final Color backGroundColor;

  const BasePage({
    Key? key,
    required this.body,
    required this.titlePage,
    this.backGroundColor = const Color(0xFFD9C1F0),
  }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _widgetKey = GlobalKey();
  double height = 120;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
  }

  void _getWidgetInfo() {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    setState(() {
      height = size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SafeArea(
            right: false,
            left: false,
            child: Stack(
              children: [
                HeaderMenu(
                  key: _widgetKey,
                  isMenuOpen: isMenuOpen,
                  titlePage: widget.titlePage,
                  onTap: () {
                    setState(() {
                      isMenuOpen = !isMenuOpen;
                    });
                    Future.delayed(const Duration(milliseconds: 50), () {
                      _getWidgetInfo();
                    });
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: double.infinity,
                    child: RoundCurve(
                      backGroundColor: widget.backGroundColor,
                      isMenuOpen: isMenuOpen,
                      body: widget.body,
                      height: height,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundCurve extends StatefulWidget {
  final Widget body;
  final double height;
  final bool isMenuOpen;
  final Color backGroundColor;

  const RoundCurve({
    Key? key,
    required this.body,
    required this.height,
    required this.isMenuOpen,
    this.backGroundColor = const Color(0xFFD9C1F0),
  }) : super(key: key);

  @override
  State<RoundCurve> createState() => RoundCurveState();
}

class RoundCurveState extends State<RoundCurve> {
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      height: mediaHeight - widget.height,
      padding:
          !widget.isMenuOpen ? const EdgeInsets.only(top: Spacing.xl) : null,
      decoration: BoxDecoration(
        color: widget.backGroundColor,
        boxShadow: const [
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(41),
          topRight: Radius.circular(41),
        ),
      ),
      child: Column(
        children: [
          if (widget.isMenuOpen)
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: widget.height == 120 ? 0 : 1,
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
                              'Mirella',
                              style: GoogleFonts.roboto(
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                letterSpacing: 7.48,
                              ),
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
                                  '1000',
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
                            padding: const EdgeInsets.only(right: Spacing.l),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
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
            )
          else
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: !(widget.height == 120) ? 0 : 1,
                child: widget.body,
              ),
            ),
        ],
      ),
    );
  }
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

class HeaderMenu extends StatefulWidget {
  final String titlePage;
  final Function()? onTap;
  final bool isMenuOpen;

  const HeaderMenu({
    Key? key,
    required this.onTap,
    this.isMenuOpen = false,
    required this.titlePage,
  }) : super(key: key);

  @override
  State<HeaderMenu> createState() => HeaderMenuState();
}

class HeaderMenuState extends State<HeaderMenu> {
  final menuItems = [
    {
      'title': 'INICIO',
      'iconAsset': 'assets/icons/home_icon.png',
    },
    {
      'title': 'PONTOS',
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
    return SizedBox(
      height: widget.isMenuOpen ? (mediaHeight - (mediaHeight * 0.14)) : 120,
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
                  onTap: widget.onTap,
                  child: Icon(
                    widget.isMenuOpen
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
                  widget.titlePage,
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
              visible: widget.isMenuOpen,
              child: Column(
                children: [
                  const SizedBox(height: Spacing.m),
                  Container(
                    height: 0.5,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  const SizedBox(height: Spacing.xs),
                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
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
                                          menuItems[index]['iconAsset']!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    menuItems[index]['title']!,
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
