import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemsList extends StatelessWidget {
  const ShimmerItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ShimmerItem();
        },
      ),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.4 / 3.4,
          child: Container(color: Colors.white),
        ),
      ),
    );
  }
}
