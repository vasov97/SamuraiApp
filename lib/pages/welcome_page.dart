import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:samurai_app/pages/favorites_page.dart';
import 'package:samurai_app/pages/samurai_page.dart';
import 'package:samurai_app/pages/wallpapers_page.dart';
import 'package:samurai_app/res/theme/app_colors.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_avatar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  bool _smallerText = false;
  AssetImage _myWidget = const AssetImage('assets/images/retro7.png');

  void _changeOpacity() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _changeSmallerOpacity() {
    setState(() {
      _smallerText = !_smallerText;
      _myWidget = const AssetImage('assets/images/retro7.png');
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 850), () {
      _changeOpacity();
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      _changeSmallerOpacity();
    });
  }

  final _posters = [
    const AssetImage('assets/images/retro7.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.blackColor,
      extendBody: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layoutHeight = constraints.maxHeight;
          final layoutWidth = constraints.maxWidth;
          return SizedBox(
            width: layoutWidth,
            height: layoutHeight,
            child: Stack(
              children: [
                Positioned(
                  left: -88,
                  top: layoutHeight * 0.009,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.pinkColor.withOpacity(0.8),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 200,
                        sigmaY: 200,
                      ),
                      child: Container(
                        width: 160,
                        height: 160,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: layoutHeight * 0.3,
                  right: -100,
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cyanColor.withOpacity(0.8),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 200,
                        sigmaY: 200,
                      ),
                      child: Container(
                        width: 166,
                        height: 166,
                        color: Colors.transparent,
                        //child: Image.asset('assets/images/two.png'),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: layoutHeight * 0.07,
                      ),
                      CustomAvatar(
                        strokeWidth: 4,
                        radius: layoutWidth * 0.5,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.pinkColor,
                            AppColors.pinkColor.withOpacity(0.1),
                            AppColors.cyanColor.withOpacity(0.1),
                            AppColors.cyanColor,
                          ],
                          stops: const [0.2, 0.4, 0.6, 1],
                        ),
                        width: layoutWidth * 0.6,
                        height: layoutHeight * 0.3,
                        padding: const EdgeInsets.all(4),
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 6),
                          child: Container(
                            // width: 500,
                            // height: 500,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  //scale: 2.0,
                                  alignment: Alignment.bottomLeft,
                                  image: _myWidget
                                  //AssetImage('assets/images/two.png'),
                                  // _posters[index],
                                  ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: layoutHeight * 0.09,
                      ),
                      Text(
                        'Download high quality \nsamurai images',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.whiteColor.withOpacity(0.85),
                          fontSize: 34, //screenHeight<=667?18:34
                          fontWeight: FontWeight.w300,
                        ),
                      ).animate().fade(
                            begin: 0.0,
                            delay: 500.ms,
                            duration: 1000.ms,
                          ),
                      SizedBox(
                        height: layoutHeight * 0.06,
                      ),
                      Text(
                        'Share them with your friends',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.whiteColor.withOpacity(0.5),
                          fontSize: 24, //screenHeight<=667?18:34
                          fontWeight: FontWeight.w300,
                        ),
                      ).animate().fade(
                            begin: 0.0,
                            delay: 1050.ms,
                            duration: 1040.ms,
                          ),
                      SizedBox(
                        height: layoutHeight * 0.06,
                      ),
                      OutlineGradientButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WallpapersPage(
                                      drawer: Material(
                                        child: Container(
                                          color: AppColors.blackColor,
                                          child: ListView.builder(
                                            padding: const EdgeInsets.only(
                                                left: 100, top: 100),
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return  ListTile(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FavoritesPage(),
                                                  ),
                                                ),
                                                title: const Text(
                                                  'Favorites',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      child: const SamuraiPage(),
                                    )),
                          );
                        },
                        strokeWidth: 3,
                        radius: Radius.circular(layoutWidth * 0.5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 15),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.pinkColor,
                            AppColors.cyanColor,
                          ],
                        ),
                        child: const Text(
                          'Explore',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: AppColors.whiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ).animate().fade(
                            begin: 0.0,
                            delay: 1600.ms,
                            duration: 1000.ms,
                          ),
                    
                      SizedBox(
                        height: layoutHeight * 0.05,
                        width: layoutWidth * 0.05,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
