import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:samurai_app/res/data/app_images.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesLoading());

  List<AssetImage> favoriteSamurais = [];
  bool isFavorite = false;

  void loadFavorites() {
    emit(FavoritesLoading());
    favoriteSamurais = favorites;
    emit(FavoritesLoaded(favorites: favoriteSamurais));
  }

  // bool isSaved(bool saved) {
  //   bool isFav = !saved;
  //   // if(isFav){
  //   //   isFavorite=true;
  //   //   emit(FavoriteAdded(isFavorite: isFavorite));
  //   // }
  //   // else{
  //   //   isFavorite=false;
  //   //   emit(FavoriteRemoved(removed: true));
  //   // }
  //   return isFav;
  // }

  void handleFavorites({required bool isSaved, required AssetImage image}) {
    isFavorite = isSaved;

    if (isSaved == false) {
      emit(FavoriteRemoved(removed: true));
      favorites.remove(image);
    } else {
      if (favorites.contains(image)) {
       
        emit(FavoriteExists());
      } else {
        emit(FavoriteAdded(isFavorite: true));
        favorites.add(image);
      }
    }
  }
}
