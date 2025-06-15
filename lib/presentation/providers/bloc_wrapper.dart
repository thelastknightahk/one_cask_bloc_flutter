import 'package:clevit_flutter_bloc/di/injection.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocWrapper extends StatelessWidget {
  final Widget child;

  const AppBlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LiquorBloc>(
          create: (_) => sl<LiquorBloc>()..add(LoadLiquorData()),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => sl<ThemeBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>(),
        ),
         BlocProvider<BottomNavBloc>(
          create: (_) => sl<BottomNavBloc>(),
        ),
         BlocProvider<CollectionDetailBloc>(
          create: (_) => sl<CollectionDetailBloc>(),
        ),
      ],
      child: child,
    );
  }
}