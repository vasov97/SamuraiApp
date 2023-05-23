import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:samurai_app/res/theme/app_colors.dart';
import 'package:samurai_app/widgets/app_scaffold.dart';

class WallpapersPage extends StatefulWidget {
  const WallpapersPage({
    super.key,
    required this.child,
    required this.drawer,
  });
  final Widget child;
  final Widget drawer;
  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage>
    with TickerProviderStateMixin {
  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationAnimationForChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationAnimationForDrawer;

  @override
  void initState() {
    super.initState();
    _xControllerForChild = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _yRotationAnimationForChild = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _yRotationAnimationForDrawer = Tween<double>(
      begin: pi / 2.7,
      end: 0,
    ).animate(_xControllerForDrawer);
  }

  @override
  void dispose() {
    _xControllerForChild.dispose();
    _xControllerForDrawer.dispose();
    super.dispose();
  }

  bool _dragStarted = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxDrag = screenWidth * 0.8;
   
    return AppScaffold(
      backgroundColor: AppColors.blackColor,
      child: LayoutBuilder(
        builder: (context,constraints) {
          final layoutHeight = constraints.maxHeight;
         
          return Stack(
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
              GestureDetector(
                dragStartBehavior: DragStartBehavior.start,
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _dragStarted = false;
                  });
                  final delta = details.delta.dx / maxDrag;
                  _xControllerForChild.value += delta;
                  _xControllerForDrawer.value += delta;
                },
                onHorizontalDragEnd: (details) {
                  setState(() {
                    _dragStarted = false;
                  });
                  if (_xControllerForChild.value < 0.5) {
                    _xControllerForChild.reverse();
                    _xControllerForDrawer.reverse();
                    _dragStarted = true;
                  } else {
                    _xControllerForChild.forward();
                    _xControllerForDrawer.forward();
                  }
                },
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _xControllerForChild,
                    _xControllerForDrawer,
                  ]),
                  builder: (context, child) {
                    return Stack(
                      children: [
                       
                        Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(_xControllerForChild.value * maxDrag)
                            ..rotateY(_yRotationAnimationForChild.value),
                          child: widget.child,
                        ),
                        Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(-screenWidth +
                                _xControllerForDrawer.value * maxDrag)
                            ..rotateY(_yRotationAnimationForDrawer.value),
                          child: widget.drawer,
                        ),
                      ],
                    );
                  },
                ),
              ),
              _dragStarted?const Positioned(
                left: 20,
                top:80,
                child: Icon(
                  Icons.swipe,
                  color: Colors.white,
                ),
              ):const SizedBox()
            ],
          );
        }
      ),
    );
  }
}
