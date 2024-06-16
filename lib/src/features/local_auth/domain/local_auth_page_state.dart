import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_auth_page_state.freezed.dart';
// TODO: how did state became domain/?
@freezed
class LocalAuthPageState with _$LocalAuthPageState {
  factory LocalAuthPageState({
    @Default("") String password, 
    String? error,
  }) = _LocalAuthPageState;
}