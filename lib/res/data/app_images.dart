import 'package:flutter/material.dart';

List<AssetImage> retroStyleImages = [
  const AssetImage('assets/images/retro0.png'),
  const AssetImage('assets/images/retro1.png'),
  const AssetImage('assets/images/retro2.png'),
  const AssetImage('assets/images/retro3.png'),
  const AssetImage('assets/images/retro4.png'),
  const AssetImage('assets/images/retro5.png'),
  const AssetImage('assets/images/retro6.png'),
  const AssetImage('assets/images/retro7.png'),
  const AssetImage('assets/images/retro8.png'),
  const AssetImage('assets/images/retro9.png'),
  const AssetImage('assets/images/retro10.png'),
];

List<AssetImage> artStyleImages = [
  const AssetImage('assets/images/art0.png'),
  const AssetImage('assets/images/art1.png'),
  const AssetImage('assets/images/art2.png'),
  const AssetImage('assets/images/art3.png'),
  const AssetImage('assets/images/art4.png'),
  const AssetImage('assets/images/art5.png'),
  const AssetImage('assets/images/art6.png'),
  const AssetImage('assets/images/art7.png'),
  const AssetImage('assets/images/art8.png'),
  const AssetImage('assets/images/art9.png'),
  const AssetImage('assets/images/art10.png'),
  const AssetImage('assets/images/art11.png'),
  const AssetImage('assets/images/art12.png'),
  const AssetImage('assets/images/art13.png'),
  const AssetImage('assets/images/art14.png'),
];

List<AssetImage> favorites=[];

 List<AssetImage> shuffleLists(){
    List<AssetImage> allImages=[];
    retroStyleImages.shuffle();
    artStyleImages.shuffle();
    allImages = retroStyleImages+ artStyleImages;
    allImages.shuffle();
    return allImages;
  }

  List<AssetImage> allImages=shuffleLists();



