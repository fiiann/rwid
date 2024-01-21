import 'dart:developer' as logger show log;

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/features/tag/model/tag_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'tab_cubit.freezed.dart';
part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit({required SupabaseClient supabaseClient})
      : _supabase = supabaseClient,
        super(const TabState());
  final SupabaseClient _supabase;
  Future<void> getListTag() async {
    emit(state.copyWith(status: ProgressStatus.loading));
    final data = await _supabase.from('tag').select();
    logger.log(data.toString());
  }
}
