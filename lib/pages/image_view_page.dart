import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samurai_app/cubit/download/download_cubit.dart';
import 'package:samurai_app/cubit/favorites/favorites_cubit.dart';
import 'package:samurai_app/res/data/app_images.dart';
import 'package:samurai_app/utils/snackbar_utils.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/image_card.dart';


class ImageViewPage extends StatefulWidget {
  const ImageViewPage({
    super.key,
    required this.image,
    this.isFromFav,
  });
  final AssetImage image;
  final bool? isFromFav;
  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {

  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    
    favorites.contains(widget.image)? _isFavorite=true:_isFavorite=false;
    return AppScaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageCard(
              image: widget.image,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<FavoritesCubit, FavoritesState>(
                listener: (context, state) {
                  if (state is FavoriteAdded) {
                    if (state.isFavorite) {
                      SnackbarUtils.showSnackbar(context, 'Added to favorites');
                    }
                  } else if (state is FavoriteRemoved) {
                    SnackbarUtils.showSnackbar(
                        context, 'Removed from favorites');
                  }
                  else if(state is FavoriteExists){
                      SnackbarUtils.showSnackbar(context, 'Already added');
                  }
                },
                builder: (context, state) {
                 

                  return IconButton(
                    onPressed: () {
                     

                      context.read<FavoritesCubit>().handleFavorites(
                          isSaved: !_isFavorite, image: widget.image);
                          
                   
                    if(!_isFavorite){ 
                       _isFavorite =
                          context.read<FavoritesCubit>().isFavorite;
                    }
                 
                    },
                    icon: Icon(
                      _isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              BlocListener<DownloadCubit, DownloadState>(
                listener: (context, state) {
                  if(state is DownloadSuccessful){
                    SnackbarUtils.showSnackbar(context, 'Download successful');
                  }
                  else{
                    SnackbarUtils.showSnackbar(context, 'Download failed');
                  }
                },
                child: IconButton(
                  onPressed: () async => await context
                      .read<DownloadCubit>()
                      .saveWallpaper(widget.image),
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
