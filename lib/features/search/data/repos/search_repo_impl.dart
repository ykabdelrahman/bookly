import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResultsBooks(
      {required String searchText}) async {
    try {
      var data = await ApiService()
          .get(endPoint: 'volumes?filter=free-ebooks&q=fiction');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      List<BookModel>? searchResults = [];
      searchResults = books
          .where((item) => item.volumeInfo!.title!
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();

      return right(searchResults);
    } catch (e) {
      try {
        if (e is DioException) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }
      } on Exception {
        return left(ServerFailure('There was an error'));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
