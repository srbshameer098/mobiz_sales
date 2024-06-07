import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/Repositiry/Api/product_Api.dart';

import '../../Repositiry/Model_Class/Product_Model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductApi productApi = ProductApi();
  late SalesProductModel productModel;

  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async{

      emit(ProductblocLoading());
      try {
        productModel = await productApi.getProduct();
        emit(ProductblocLoaded());
      } catch (e) {
        print(e);
        emit(ProductblocError());
      }

      // TODO: implement event handler
    });
  }
}
