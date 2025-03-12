import 'package:categorylogin/recipe_app/categories/data/repository/categories_repository.dart';
import 'package:categorylogin/recipe_app/categories/data/state/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesEvent {}
class CategoriesLoading extends CategoriesEvent{}
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required CategoryRepository catRepo})
      : _catRepo = catRepo,
        super(CategoriesState(categories: [], mainCategory: null, status: CategoriesStatus.loading)) {
    on<CategoriesLoading>(load);
    add(CategoriesLoading());
  }

  final CategoryRepository _catRepo;

  Future<void> load(CategoriesLoading event, Emitter<CategoriesState> emit) async {
    final allCategories = await _catRepo.fetchCategories();
    emit(
      CategoriesState(
        categories: allCategories.where((category) => !category.main).toList(),
        mainCategory: allCategories.firstWhere((category) => category.main),
        status: CategoriesStatus.idle
      ),
    );
  }
}
