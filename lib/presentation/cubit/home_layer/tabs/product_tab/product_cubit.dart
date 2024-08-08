import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/domain/use_case/product_tab_use_case/get_all_product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.getAllProductUseCase})
      : super(ProductInitialState());
  GetAllProductUseCase getAllProductUseCase;


  List<ProductDataEntity>? listOfProduct;

  void getAllProduct() async {
    emit(ProductLoadingState(loadingMessage: "Loading.."));
    print("loading");
    var eitherResponse = await getAllProductUseCase.excute();
    return eitherResponse.fold(
      (l) {
        emit(ProductErrorState(errorMessage: l.errorMessage));
      },
      (response) {

        listOfProduct = response.data ?? [];
        emit(ProductSuccessState(response));
      },
    );
  }
}
