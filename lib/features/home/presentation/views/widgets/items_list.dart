import 'package:bookly/core/widgets/custom_error_msg.dart';
import 'package:bookly/features/home/presentation/view_model/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/shimmer_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/routes.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomErrorMsg(errorMsg: state.errorMessage),
              ],
            ),
          );
        }
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BookItem(
                  onTap: () => context.push(Routes.bookDetails,
                      extra: state.books[index]),
                  imgUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                );
              },
            ),
          );
        }
        return const ShimmerItemsList();
      },
    );
  }
}
