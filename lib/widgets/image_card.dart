import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../pages/image_view_page.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
    this.isFromFavorite,
  });
  final AssetImage image;
  final bool? isFromFavorite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        tag: image.assetName,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewPage(
                image: image,
                isFromFav:isFromFavorite ,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
            
              border: Border.all(
                
                width: 1,
                color: Colors.white,
              ),
            ),
            child: Image(image: image,fit: BoxFit.contain,),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: Image(image: image),
          // ),
        ),
      ),
    );
  }
}
