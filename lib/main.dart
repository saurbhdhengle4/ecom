import 'package:demapp/core/di/injection_container.dart';
import 'package:demapp/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SplashBloc())],
      child: const MyApp(),
    ),
  );
}
