import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repos/home_repo.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  HomeRepo homeRepo;

  fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var results = await homeRepo.fetchFeaturedBooks();
    results.fold(
      (l) => emit(FeaturedBooksFailure(l.errorMessage)),
      (r) => emit(FeaturedBooksSuccess(r)),
    );
  }
}
