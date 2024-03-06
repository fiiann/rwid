import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rwid/core/config/router.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required SupabaseService service, required SupabaseClient supabase})
      : _service = service,
        _supabase = supabase,
        super(const AuthState());

  final SupabaseService _service;
  final SupabaseClient _supabase;
  void changeEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      emit(state.copyWith(email: email));
    } else {}
  }

  void changePassword(String? password) {
    if (password != null && password.isNotEmpty) {
      emit(state.copyWith(password: password));
    }
  }

  void loginGoogle() async {
    emit(state.copyWith(statusLoginGoogle: BaseResponse.loading()));

    final googleSignIn = GoogleSignIn(
      clientId: Platform.isAndroid ? androidClientId : iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null) {
        emit(state.copyWith(
          statusLoginGoogle:
              BaseResponse.error(message: 'No Access Token Found'),
        ));
      }
      if (idToken == null) {
        emit(state.copyWith(
          statusLoginGoogle: BaseResponse.error(message: 'No Id Token Found'),
        ));
      }

      final response = await _service.signInWithIdToken(
        accessToken: accessToken,
        idToken: idToken!,
      );

      if (response.data?.user != null) {
        final session = response.data!.session!;
        UserRWID user = UserRWID(
          id: session.user.id,
          userId: session.user.id,
          name: session.user.userMetadata?['name'] ?? '',
          email: session.user.userMetadata?['email'] ?? '',
          photo: session.user.userMetadata?['avatar_url'] ?? '',
          phone: '',
          address: '',
        );
        saveUserLocal(user);
        await _service.insertUser(user);
        final count = await checkCountTagUser(_supabase);
        if (count == 0) {
          emit(state.copyWith(
            statusLoginGoogle: response,
            authenticationStatus: AuthenticationStatus.authenticatedWithoutTags,
          ));
        } else {
          emit(state.copyWith(
            statusLoginGoogle: response,
            authenticationStatus: AuthenticationStatus.authenticatedWithTags,
          ));
        }
      } else {
        emit(state.copyWith(
          statusLoginGoogle:
              BaseResponse.error(message: 'Failed Login, Try Again'),
        ));
      }
    } else {
      emit(state.copyWith(
        statusLoginGoogle: BaseResponse.error(message: 'User Canceled'),
      ));
    }
  }

  void registerEmail() async {
    // if (kDebugMode) {
    //   print('register');
    // }
    // emit(state.copyWith(statusRegisterEmail: BaseResponse.loading()));
    // try {
    //   final AuthResponse res = await _supabase.auth
    //       .signUp(email: state.email, password: state.password ?? '');
    // } catch (e) {
    //   if (kDebugMode) {
    //     print('error daftar : ${e.toString()}');
    //   }
    //   emit(state.copyWith(
    //       statusRegisterEmail: BaseResponse.error(message: e.toString())));
    // }
  }

  void loginEmail() async {
    // emit(state.copyWith(statusLoginEmail: ProgressStatus.loading));
    // try {
    //   final AuthResponse res = await _supabase.auth.signInWithPassword(
    //       email: state.email ?? '', password: state.password ?? '');
    //   if (res.session != null) {
    //     emit(state.copyWith(statusLoginEmail: ProgressStatus.success));
    //   } else {
    //     emit(state.copyWith(statusLoginEmail: ProgressStatus.failed));
    //   }
    // } catch (e) {
    //   if (kDebugMode) {
    //     print('error login email : $e');
    //   }
    //   emit(state.copyWith(
    //       statusLoginGoogle: ProgressStatus.failed,
    //       errorMessage: 'Error, Please Try Again'));
    // }
  }

  void logout() async {
    emit(state.copyWith(statusLogout: BaseResponse.loading()));
    await _service.signOut();
    emit(state.copyWith(
      statusLogout: BaseResponse.ok(null),
      authenticationStatus: AuthenticationStatus.unauthenticated,
    ));
  }
}
