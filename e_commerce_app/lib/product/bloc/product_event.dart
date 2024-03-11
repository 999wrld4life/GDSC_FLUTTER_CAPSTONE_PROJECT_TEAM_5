part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable{
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductEvent{}

class GetSpecificProduct extends ProductEvent{
  final String id;

  GetSpecificProduct({required this.id});

  @override
  List<Object> get props => [id];
}

class AddProduct extends ProductEvent{
  final Product product;
  final File image;

  AddProduct({required this.product, required this.image});

  @override
  List<Object> get props => [product];
}

class UpdateProduct extends ProductEvent{
  final Product product;

  UpdateProduct({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteProduct extends ProductEvent{
  final Product product;

  DeleteProduct({required this.product});

  @override
  List<Object> get props => [product];
}


