import 'package:bookly/features/home/presentation/views/widgets/shimmer_items_list.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewestList extends StatelessWidget {
  const ShimmerNewestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const SizedBox(
          height: 120,
          child: Row(
            children: [
              ShimmerItem(),
              SizedBox(width: 30),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      ShimmerNewestItem(),
                      SizedBox(height: 5),
                      ShimmerNewestItem(),
                      Expanded(child: SizedBox(height: 3)),
                      ShimmerNewestItem(),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ShimmerNewestItem extends StatelessWidget {
  const ShimmerNewestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        color: Colors.white,
        height: 20,
      ),
    );
  }
}
