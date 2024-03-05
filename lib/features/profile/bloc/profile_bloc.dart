import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required SupabaseService supabaseService})
      : _client = supabaseService,
        super(const ProfileState()) {
    on<ProfileEvent>(_onSubmitProfile);
  }
  final SupabaseService _client;

  FutureOr<void> _onSubmitProfile(
      ProfileEvent event, Emitter<ProfileState> emit) {}
}
