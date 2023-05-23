import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.resize,
    this.extendBody,
    this.backgroundColor
  });

  final bool? resize;
  final bool? extendBody;
  final Color? backgroundColor;
  final Widget child;
  final AppBar? appBar;
  final Drawer? drawer;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent),
    );
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resize,
      drawerEnableOpenDragGesture: false,
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(child: child),
    );
  }
}
