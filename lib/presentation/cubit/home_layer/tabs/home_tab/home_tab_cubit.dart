import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';
import 'package:ecommerce/domain/use_case/home_tabe_use_case/get_allCategory_use_case.dart';
import 'package:ecommerce/domain/use_case/home_tabe_use_case/get_all_brand_use_case.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(
      {required this.getAllCategoryUseCase, required this.getAllBrandUseCase})
      : super(HomeTabInitialState());
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandUseCase getAllBrandUseCase;
  List<DataOfCategoryOrBrandEntity> listOfCategory = [];
  List<DataOfCategoryOrBrandEntity> listOfBrand = [];

  Future<bool> getAllCategory() async {
    emit(HomeTabCategoryLoadingState(loadingMessage: "Loading.."));
    var eitherResponse = await getAllCategoryUseCase.excute();
    return eitherResponse.fold(
      (l) {
        emit(HomeTabCategoryErrorState(errorMessage: l.errorMessage));
        return Future.value(false);
      },
      (response) {
        listOfCategory = response.data ?? [];
        emit(HomeTabCategorySuccessState(categoryEntityModel: response));
        return Future.value(true);
      },
    );
  }

  void getAllBrands() async {
    emit(HomeTabBrandLoadingState(loadingMessage: "Loading.."));
    var eitherResponse = await getAllBrandUseCase.excute();
    return eitherResponse.fold(
      (l) {
        emit(HomeTabBrandErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        listOfBrand = response.data ?? [];
        emit(HomeTabBrandSuccessState(brandEntityModel: response));
      },
    );
  }
}
