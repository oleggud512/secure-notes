
import 'package:editor_riverpod/src/core/common/constants/keys.dart';
import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/secure_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {

  ThemeMode build() {
    return ThemeMode.dark;
  }

  init() async {
    final res = await ref.watch(secureStorageProvider).read(StorageKeys.themeMode);
    state = ThemeMode.values.firstWhere((t) => t.name == res, orElse: () => ThemeMode.light);
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    await ref.watch(secureStorageProvider).write(StorageKeys.themeMode, newTheme.name);
    state = newTheme;
  }
}