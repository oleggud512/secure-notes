import 'package:editor_riverpod/src/features/local_auth/application/auth_guard.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:auto_route/auto_route.dart';

import 'features/app_settings/presentation/settings/settings_page.dart';
import 'features/local_auth/application/services/auth_service.dart';
import 'features/editor/presentation/main_page.dart';
import 'package:editor_riverpod/src/features/local_auth/infrastructure/services/auth_service_provider.dart';
import 'features/local_auth/presentation/local_auth_page.dart';

part 'router.gr.dart';
part 'router.g.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AuthService _authService;

  AppRouter(AuthService authService) : _authService = authService;

  @override      
  List<AutoRoute> get routes => [      
    AutoRoute(page: MainRoute.page, path: '/', initial: true, guards: [AuthGuard(_authService)]),
    AutoRoute(page: LocalAuthRoute.page, path: '/login'),
    AutoRoute(page: SettingsRoute.page, path: '/settings')
  ];
  
}


@Riverpod(keepAlive: true)
AppRouter appRouter(AppRouterRef ref) { 
  return AppRouter(ref.watch(authServiceProvider));
}