part of 'download_cubit.dart';


abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class DownloadSuccessful extends DownloadState{}

class DownloadFailed extends DownloadState{}
