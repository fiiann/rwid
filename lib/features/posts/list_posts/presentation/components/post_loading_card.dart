import 'package:flutter/material.dart';
import 'package:rwid/core/widget/shimmer_loading.dart';

class PostLoadingCard extends StatelessWidget {
  const PostLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity, height: 80, child: ShimmerLoading());
  }
}

class PostLoadingList extends StatelessWidget {
  const PostLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          return const PostLoadingCard();
        });
  }
}
