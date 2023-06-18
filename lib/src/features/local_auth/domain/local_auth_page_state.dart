import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_auth_page_state.freezed.dart';

@freezed
class LocalAuthPageState with _$LocalAuthPageState {
  factory LocalAuthPageState({
    @Default("") String password, 
    String? error,
  }) = _LocalAuthPageState;
}