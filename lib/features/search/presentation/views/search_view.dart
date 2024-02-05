import 'package:bookly/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_results_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/search_results_cubit/search_results_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomTextField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        BlocProvider.of<SearchResultsCubit>(context)
                            .fetchSearchResultsBooks(searchText: value);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: SearchResultsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
