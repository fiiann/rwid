import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/features/bookmarks/bloc/list_bookmark_bloc.dart';
import 'package:rwid/features/bookmarks/presentation/components/bookmark_list.dart';

class BookmarkPage extends StatefulWidget {
  static const String route = '/list_bookmark_page';

  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ListBookmarkBloc>().add(const PostFetched());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(authBoxName);
    final user = box.get('user');
    return Scaffold(
      appBar: _buildAppBar(user, context),
      body: RefreshIndicator(
        onRefresh: () async {
          return context
              .read<ListBookmarkBloc>()
              .add(const PostFetched(isRefresh: true));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _searchForm(context),
              const BookmardkList(),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextFormField _searchForm(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      labelText: 'Search',
      name: 'search',
      onChange: (val) {
        context.read<ListBookmarkBloc>().add(KeywordChanged(val));
      },
      onSubmitted: (val) {
        context
            .read<ListBookmarkBloc>()
            .add(PostFetched(isRefresh: true, keyword: val));
      },
    );
  }

  AppBar _buildAppBar(user, BuildContext context) {
    return AppBar(
      title: Text(
        'Bookmark ${user.name}',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
