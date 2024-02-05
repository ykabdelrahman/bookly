part of 'search_results_cubit.dart';

sealed class SearchResultsState extends Equatable {
  const SearchResultsState();

  @override
  List<Object> get props => [];
}

final class SearchResultsInitial extends SearchResultsState {}

final class SearchResultsLoading extends SearchResultsState {}

final class SearchResultsSuccess extends SearchResultsState {
  final List<BookModel>? books;

  const SearchResultsSuccess(this.books);
}

final class SearchResultsfailure extends SearchResultsState {
  final String errorMsg;

  const SearchResultsfailure(this.errorMsg);
}
