import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';
import 'package:editor_riverpod/src/router.dart';


class AuthGuard extends AutoRouteGuard {
  AuthService authService;

  AuthGuard(this.authService);

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final signedIn = await authService.isSignedInLocally;
    print('AuthGuard.onNavigation logged in = $signedIn');

    if (signedIn) {
      print('signed in');
      resolver.next(true);
    } else {
      print('redirect to login route');
      await resolver.redirect(LocalAuthRoute(onResult: (result) {
        print('autnetnication resolved with $result');
        resolver.next(result);
      }));
    }
    print('end AuthGuard.onNavigation');
  }

}