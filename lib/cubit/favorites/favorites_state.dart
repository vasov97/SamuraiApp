part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesLoaded extends FavoritesState{
  List<AssetImage> favorites;
  FavoritesLoaded({required this.favorites});
}

class FavoriteAdded extends FavoritesState{
  bool isFavorite;
  FavoriteAdded({required this.isFavorite});
}

class FavoriteExists extends FavoritesState{}

class FavoritesLoading extends FavoritesState{}

class FavoriteRemoved extends FavoritesState{
  bool removed;
  FavoriteRemoved({required this.removed});
}