import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/custom_error_msg.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_results_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/search_results_cubit/search_results_cubit.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultsCubit, SearchResultsState>(
      builder: (context, state) {
        if (state is SearchResultsfailure) {
          return CustomErrorMsg(errorMsg: state.errorMsg);
        }
        if (state is SearchResultsSuccess) {
          if (state.books!.isNotEmpty) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.zero,
              itemCount: state.books!.length,
              itemBuilder: (context, index) {
                return SearchResultsItem(bookModel: state.books![index]);
              },
            );
          } else {
            return const CustomErrorMsg(errorMsg: 'No Match Found!');
          }
        }
        if (state is SearchResultsLoading) {
          return const CustomCircularIndicator();
        }
        return const Text('');
      },
    );
  }
}
