import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:samurai_app/res/data/app_images.dart';
import 'package:samurai_app/res/theme/app_colors.dart';

import '../cubit/samurai/samurai_cubit.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/image_card.dart';

class SamuraiPage extends StatefulWidget {
  const SamuraiPage({super.key});

  @override
  State<SamuraiPage> createState() => _SamuraiPageState();
}

class _SamuraiPageState extends State<SamuraiPage> {
  bool _retroClicked = false;
  bool _artClicked = false;
  bool _allClicked = true;

  int getImagesCount() {
    if (_retroClicked) {
      return retroStyleImages.length;
    } else if (_artClicked) {
      return artStyleImages.length;
    }
    return allImages.length;
  }

  List<AssetImage> images() {
    if (_retroClicked) {
      return retroStyleImages;
    } else if (_artClicked) {
      return artStyleImages;
    }
    return allImages;
  }

  @override
  Widget build(BuildContext context) {
    context.read<SamuraiCubit>().loadAllImages();
    return AppScaffold(
      backgroundColor: AppColors.blackColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: () => context
                          .read<SamuraiCubit>()
                          .setFilter(images: artStyleImages),
                      child: const Text(
                        'Art',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () => context
                        .read<SamuraiCubit>()
                        .setFilter(images: retroStyleImages),
                    child: const Text(
                      'Retro',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        // border radius
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => context
                        .read<SamuraiCubit>()
                        .setFilter(images: allImages),
                    child: const Text(
                      'All',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<SamuraiCubit, SamuraiState>(
              listener: (context, state) {
                if (state is SamuraiError) {
                  Center(
                    child: Text(state.message),
                  );
                } else if (state is SamuraiLoading) {
                  const Center(child: CircularProgressIndicator());
                }
              },
              builder: (context, state) {
                if (state is SamuraiLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<AssetImage> imagesToShow = [];

                if (state is SamuraiLoaded) {
                  imagesToShow = state.samuraiImages;
                }

                return MasonryGridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  padding: const EdgeInsets.only(top: 10),
                  physics: const BouncingScrollPhysics(),
                  itemCount: imagesToShow.length,
                  crossAxisCount: 2,
                  itemBuilder: (_, index) {
                    return ImageCard(
                      image: imagesToShow[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
