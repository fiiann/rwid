import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required SupabaseService supabaseService})
      : _client = supabaseService,
        super(const ProfileState()) {
    on<SubmitProfile>(_onSubmitProfile);
  }
  final SupabaseService _client;

  FutureOr<void> _onSubmitProfile(SubmitProfile event,
      Emitter<ProfileState> emit) async {
    emit(state.copyWith(stateSubmit: BaseResponse.loading()));
    final submit = await _client.updateUser(event.user);
    emit(state.copyWith(stateSubmit: submit));
  }
}
