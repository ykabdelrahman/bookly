import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit(this.searchRepo) : super(SearchResultsInitial());

  SearchRepo searchRepo;

  fetchSearchResultsBooks({required String searchText}) async {
    emit(SearchResultsLoading());
    var results =
        await searchRepo.fetchSearchResultsBooks(searchText: searchText);
    results.fold(
      (l) => emit(SearchResultsfailure(l.errorMessage)),
      (r) => emit(SearchResultsSuccess(r)),
    );
  }
}
