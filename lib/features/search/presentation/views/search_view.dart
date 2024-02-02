import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: CustomTextField(),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Search Results', style: Styles.textStyle18),
              ),
              SizedBox(height: 16),
              // Expanded(
              //   child: SearchResultsList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
