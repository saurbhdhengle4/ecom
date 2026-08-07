import 'package:demapp/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:demapp/features/splash/presentation/bloc/splash_event.dart';
import 'package:demapp/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(CheckLoginEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigationHome) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Go Home")));
        }

        if (state is NavigationLogin) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Go Login")));
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: .center,
                children: [
                  FlutterLogo(size: 120),
                  SizedBox(height: 20),
                  if (state is SplashLoading) CircularProgressIndicator(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
