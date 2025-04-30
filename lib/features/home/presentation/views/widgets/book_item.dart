import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, this.imgUrl, this.onTap});
  final String? imgUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.4 / 3.4,
          child: CachedNetworkImage(
            imageUrl: imgUrl!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
