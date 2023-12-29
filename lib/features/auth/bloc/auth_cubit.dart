import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required SupabaseClient supabase})
      : _supabase = supabase,
        super(const AuthState());

  final SupabaseClient _supabase;
  void loginGoogle() async {
    emit(state.copyWith(status: ProgressStatus.loading));
    final response = await _supabase.auth.signInWithOAuth(
      OAuthProvider.google,
    );
    emit(state.copyWith(
        status: response ? ProgressStatus.success : ProgressStatus.failed));
  }
}
