import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/custom_error_msg.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarItemsList extends StatelessWidget {
  const SimilarItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksFailure) {
          return CustomErrorMsg(errorMsg: state.errorMsg);
        }
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .18,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BookItem(
                  imgUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                  onTap: () => GoRouter.of(context)
                      .push('/b', extra: state.books[index]),
                );
              },
            ),
          );
        }
        return const CustomCircularIndicator();
      },
    );
  }
}
