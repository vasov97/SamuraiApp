part of 'samurai_cubit.dart';

abstract class SamuraiState {}

class SamuraiInitial extends SamuraiState {}

class SamuraiLoading extends SamuraiState{}

class SamuraiLoaded extends SamuraiState{
  List<AssetImage> samuraiImages;
  SamuraiLoaded({required this.samuraiImages});
}

class SamuraiError extends SamuraiState{
  final String message;
  SamuraiError({required this.message});
}

class SamuraiImageDownloaded extends SamuraiState{}

class SamuraiImageDownloadError extends SamuraiState{}

