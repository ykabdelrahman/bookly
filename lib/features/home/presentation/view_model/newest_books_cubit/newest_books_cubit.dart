import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  HomeRepo homeRepo;

  fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var results = await homeRepo.fetchNewestBooks();
    results.fold(
      (l) => emit(NewestBooksFailure(l.errorMessage)),
      (r) => emit(NewestBooksSuccess(r)),
    );
  }
}
