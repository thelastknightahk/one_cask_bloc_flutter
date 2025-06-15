// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:clevit_flutter_bloc/domain/entities/liquor.dart' as _i8;
import 'package:clevit_flutter_bloc/presentation/features/collection/pages/collection_detail_screen.dart'
    as _i1;
import 'package:clevit_flutter_bloc/presentation/features/home/pages/home_screen.dart'
    as _i2;
import 'package:clevit_flutter_bloc/presentation/features/login/pages/login_screen.dart'
    as _i3;
import 'package:clevit_flutter_bloc/presentation/features/splash/pages/splash_screen.dart'
    as _i4;
import 'package:clevit_flutter_bloc/presentation/features/welcome/pages/welcome_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.CollectionDetailScreen]
class CollectionDetailRoute
    extends _i6.PageRouteInfo<CollectionDetailRouteArgs> {
  CollectionDetailRoute({
    _i7.Key? key,
    required _i8.Liquor liquor,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         CollectionDetailRoute.name,
         args: CollectionDetailRouteArgs(key: key, liquor: liquor),
         initialChildren: children,
       );

  static const String name = 'CollectionDetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionDetailRouteArgs>();
      return _i1.CollectionDetailScreen(key: args.key, liquor: args.liquor);
    },
  );
}

class CollectionDetailRouteArgs {
  const CollectionDetailRouteArgs({this.key, required this.liquor});

  final _i7.Key? key;

  final _i8.Liquor liquor;

  @override
  String toString() {
    return 'CollectionDetailRouteArgs{key: $key, liquor: $liquor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CollectionDetailRouteArgs) return false;
    return key == other.key && liquor == other.liquor;
  }

  @override
  int get hashCode => key.hashCode ^ liquor.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute({List<_i6.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.WelcomeScreen();
    },
  );
}
