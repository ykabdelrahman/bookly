import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repos/home_repo.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  HomeRepo homeRepo;

  fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var results = await homeRepo.fetchSimilarBooks(category: category);
    results.fold(
      (l) => emit(SimilarBooksFailure(l.errorMessage)),
      (r) => emit(SimilarBooksSuccess(r)),
    );
  }
}
