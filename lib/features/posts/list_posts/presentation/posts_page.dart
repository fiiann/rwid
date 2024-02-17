import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/auth/page/login_page.dart';
import 'package:rwid/features/posts/add_post/presentation/add_post_page.dart';
import 'package:rwid/features/posts/list_posts/bloc/list_post_bloc.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_list.dart';

class PostsPage extends StatefulWidget {
  static const String route = '/list_post_page';

  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ListPostBloc>().add(const PostFetched());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(authBoxName);
    final user = box.get('user');
    return Scaffold(
      appBar: _buildAppBar(user, context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final addSuccess = await context.push(AddPostPage.routeName);
          if (addSuccess != null) {
            if (context.mounted) {
              context.read<ListPostBloc>().add(const PostFetched());
            }
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: RefreshIndicator(
        onRefresh: () async {
          return context
              .read<ListPostBloc>()
              .add(const PostFetched(isRefresh: true));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                labelText: 'Search',
                name: 'search',
                onChange: (val) {
                  context.read<ListPostBloc>().add(KeywordChanged(val));
                },
                onSubmitted: (val) {
                  context
                      .read<ListPostBloc>()
                      .add(PostFetched(isRefresh: true, keyword: val));
                },
              ),
              const PostList(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(user, BuildContext context) {
    return AppBar(
      title: Text(
        'Welcome, ${user.name} !',
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listenWhen: (previous, current) =>
                previous.statusLogout?.state != current.statusLogout?.state,
            listener: (_, state) {
              if (state.statusLogout?.state == ResponseState.ok) {
                context.go(LoginPage.route);
              } else if (state.statusLogout?.state == ResponseState.error) {
                (state.statusLogout?.message ?? 'Error').failedBar(context);
              }
            },
            buildWhen: (previous, current) =>
                previous.statusLogout != current.statusLogout,
            builder: (context, state) {
              return GestureDetector(
                onDoubleTap: () => context.read<AuthCubit>().logout(),
                child: state.statusLogout?.state == ResponseState.loading
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(),
                      )
                    : CircleAvatar(
                        foregroundImage: NetworkImage(user.photo),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
