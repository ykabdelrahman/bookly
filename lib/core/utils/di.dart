import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupGeIt() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
}
