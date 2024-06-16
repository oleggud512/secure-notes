import 'package:editor_riverpod/src/features/local_auth/infrastructure/services/auth_service_provider.dart';
import 'package:editor_riverpod/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}
class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // themeMode: ref.watch(themeModeControllerProvider),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder()
        ),
      ),
      // darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      //   inputDecorationTheme: InputDecorationTheme(
      //     border: OutlineInputBorder()
      //   ),
      // ),
      routerConfig: appRouter.config(
        reevaluateListenable: ref.watch(reevaluateLisenableProvider)
      ),
    );
  }
}