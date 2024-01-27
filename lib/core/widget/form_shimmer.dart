import 'package:flutter/material.dart';
import 'package:rwid/core/widget/shimmer_loading.dart';

class FormShimmerLoading extends StatelessWidget {
  const FormShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: ShimmerLoading(),
    );
  }
}
