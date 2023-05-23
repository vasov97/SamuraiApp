import 'package:provider/single_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samurai_app/cubit/samurai/samurai_cubit.dart';

import '../cubit/download/download_cubit.dart';
import '../cubit/favorites/favorites_cubit.dart';

class AppDependencies {
  final BuildContext context;
  static AppDependencies? _instance;

  AppDependencies._(this.context);

  factory AppDependencies.of(BuildContext context) =>
      _instance != null ? _instance! : _instance = AppDependencies._(context);

  List<SingleChildWidget> get providers => [
        ..._blocs,
      ];

  List<SingleChildWidget> get _blocs => [
        BlocProvider(create: (context) => SamuraiCubit()),
        BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => DownloadCubit(),
        ),
      ];
}
