import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/presentation/constants.dart';
import 'package:editor_riverpod/src/core/presentation/theme/theme_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../change_password/change_password_dialog.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  onChangePassword(BuildContext context, WidgetRef ref) async {
    await ChangePasswordDialog.show(context);
  }

  onThemeSelected(WidgetRef ref, ThemeMode mode) async {
    await ref.watch(themeModeControllerProvider.notifier).changeTheme(mode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.hardcoded)),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: p400
          ),
          child: ListView(
            padding: const EdgeInsets.all(p16),
            children: [
              TextButton(
                onPressed: () => onChangePassword(context, ref), 
                child: Text('Chagne password'.hardcoded)
              ),
              h16gap,
              // SegmentedButton<ThemeMode>(
              //   segments: [
              //     ButtonSegment(value: ThemeMode.light, label: Text('Light'.hardcoded)),
              //     ButtonSegment(value: ThemeMode.dark, label: Text('Dark'.hardcoded)),
              //     ButtonSegment(value: ThemeMode.system, label: Text('System'.hardcoded))
              //   ],
              //   selected: { ref.watch(themeModeControllerProvider) },
              //   onSelectionChanged: (s) {
              //     onThemeSelected(ref, s.first);
              //   },
              // )
            ]
          ),
        ),
      )
    );
  }
}