part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> product;

  ProductLoaded({required this.product});

  @override
  List<Object> get props => [product];
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ProductAdded extends ProductState {
  // final Product product;

  // ProductAdded({required this.product});

  // @override
  // List<Object> get props => [product];
}

class ProductRemoved extends ProductState {
  final String removedMessage;

  ProductRemoved({required this.removedMessage});

  @override
  List<Object> get props => [removedMessage];
}

class ProductUpdated extends ProductState {
  final Product product;

  ProductUpdated({required this.product});

  @override
  List<Object> get props => [product];
}

class SpecificProductLoaded extends ProductState {
  final Product product;

  SpecificProductLoaded({required this.product});

  @override
  List<Object> get props => [product];
}
