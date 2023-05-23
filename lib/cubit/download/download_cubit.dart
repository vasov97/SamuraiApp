import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit() : super(DownloadInitial());

  Future<void> saveWallpaper(AssetImage image) async {
    try {
      ByteData? data = await rootBundle.load(image.assetName);
      await ImageGallerySaver.saveImage(data.buffer.asUint8List());
      emit(DownloadSuccessful());
    } catch (_) {
      emit(DownloadFailed());
    }
  }
}
