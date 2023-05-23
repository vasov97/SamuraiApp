import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:samurai_app/cubit/favorites/favorites_cubit.dart';
import 'package:samurai_app/res/data/app_images.dart';
import 'package:samurai_app/utils/snackbar_utils.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/image_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      child: BlocConsumer<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          if(state is FavoriteRemoved){
            SnackbarUtils.showSnackbar(context,'Removed from favorites');
          }
        },
        builder: (context, state) {
          if(state is FavoritesLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          //bool isFavorite=favorites.isEmpty;
          return MasonryGridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
            crossAxisCount: 2,
            padding: const EdgeInsets.only(top: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return ImageCard(image: favorites[index],isFromFavorite: true,);
            },
          );
        },
      ),
    );
  }
}
