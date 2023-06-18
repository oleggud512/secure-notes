// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LocalAuthRoute.name: (routeData) {
      final args = routeData.argsAs<LocalAuthRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LocalAuthPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [LocalAuthPage]
class LocalAuthRoute extends PageRouteInfo<LocalAuthRouteArgs> {
  LocalAuthRoute({
    Key? key,
    required void Function(bool) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LocalAuthRoute.name,
          args: LocalAuthRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LocalAuthRoute';

  static const PageInfo<LocalAuthRouteArgs> page =
      PageInfo<LocalAuthRouteArgs>(name);
}

class LocalAuthRouteArgs {
  const LocalAuthRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final void Function(bool) onResult;

  @override
  String toString() {
    return 'LocalAuthRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
