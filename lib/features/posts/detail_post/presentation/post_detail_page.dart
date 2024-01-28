import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/loading_list_widget.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/posts/detail_post/bloc/detail_post_cubit.dart';
import 'package:rwid/features/posts/models/post_model.dart';

class PostDetailPage extends StatefulWidget {
  static const String routePath = 'detail_post_page';
  static const String routeName = '${DashboardPage.routeName}/$routePath';

  const PostDetailPage({super.key, required this.id});

  final int id;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DetailPostCubit>().getPost(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Detail Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<DetailPostCubit, DetailPostState>(
            buildWhen: (previous, current) =>
                previous.state?.state != current.state?.state,
            builder: (context, state) {
              final response = state.state;
              if (response == null || response.state == ResponseState.loading) {
                return const CustomLoading();
              } else if (response.state == ResponseState.error) {
                return const Center(
                  child: CustomText('Error'),
                );
              } else if (response.state == ResponseState.ok) {
                PostModel? data = response.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      data?.title ?? '-',
                      style: CustomTextStyle.h5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (data?.image != null) Image.network(data?.image ?? '-'),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText(data?.content ?? '')
                  ],
                );
              } else {
                return const Center(
                  child: CustomText('Error'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
