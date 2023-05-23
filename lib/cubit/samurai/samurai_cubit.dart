import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:samurai_app/res/data/app_images.dart';

part 'samurai_state.dart';

class SamuraiCubit extends Cubit<SamuraiState> {
  SamuraiCubit() : super(SamuraiLoading());

  List<AssetImage> samuraiImages = [];
 

  Future<void> setFilter(
      {required List<AssetImage> images}) async {
    emit(SamuraiLoaded(samuraiImages: images));
    samuraiImages = images;
    
  }

  Future<void> loadAllImages() async {
    emit(SamuraiLoading());
    samuraiImages = allImages;
    emit(SamuraiLoaded(samuraiImages: samuraiImages));
  }
}
