import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/product/repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;
  ProductBloc({
    required ProductRepo productRepo,
  })  : _productRepo = productRepo,
        super(ProductInitial()) {
    on<AddProduct>((event, emit) async{
      emit(ProductLoading());
      try {
       await _productRepo.addProduct(product: event.product, imageFile: event.image);
       emit(ProductAdded());
      } catch (e) {
        emit(ProductError(errorMessage: e.toString()));
      }
    });
  }
}
