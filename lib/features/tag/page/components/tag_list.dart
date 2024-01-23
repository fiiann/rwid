import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/features/tag/bloc/tab_cubit.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagCubit, TagState>(
      buildWhen: (previous, current) => previous.stateList != current.stateList,
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.stateList?.data?.length,
            itemBuilder: (context, index) {
              TagModel tag = state.stateList!.data![index];
              return ListTile(
                onTap: () => context.read<TagCubit>().selectTag(tag),
                selected: tag.isSelected,
                selectedColor: Colors.white,
                selectedTileColor: CustomColors.lightPrimaryMain,
                title: Text(tag.name),
              );
            });
      },
    );
  }
}
