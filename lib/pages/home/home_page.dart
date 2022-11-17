import 'package:flutter/material.dart';
import 'package:habilita_enem/shared/componentes/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF17A6D7),
        Color(0xFF9D31FE),
      ],
    );
    return BasePage(
      titlePage: 'INICIO',
      body: Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'assets/images/logo_splash.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      right: 75,
                      top: 35,
                      child: Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              gradient: gradient,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Positioned(
                            left: 4,
                            top: 4,
                            child: Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                            'https://picsum.photos/200/300')
                                        .image),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 75,
                      top: 35,
                      child: Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              gradient: gradient,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Positioned(
                            left: 4,
                            top: 4,
                            child: Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                            'https://picsum.photos/400/500')
                                        .image),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: [
                            Container(
                              width: 108,
                              height: 108,
                              decoration: const BoxDecoration(
                                gradient: gradient,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 4,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                              'https://picsum.photos/300/400')
                                          .image),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
