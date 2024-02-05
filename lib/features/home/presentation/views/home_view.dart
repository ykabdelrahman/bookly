import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/assets.dart';
import '../view_model/featured_book_cubit/featured_books_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2), () {});
          if (context.mounted) {
            BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
            BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
          }
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        widget: Image.asset(
                          AssetsData.logo,
                          height: 20,
                        ),
                        icon: Icons.search,
                        onPresssed: () => GoRouter.of(context).push('/s'),
                      ),
                      const ItemsList(),
                      const SizedBox(height: 36),
                      const Text(
                        'Newest Books',
                        style: Styles.textStyle18,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20),
                child: NewestBooksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
