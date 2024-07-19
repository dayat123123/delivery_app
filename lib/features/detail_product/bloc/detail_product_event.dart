import 'package:equatable/equatable.dart';

abstract class DetailProductEvent extends Equatable {
  const DetailProductEvent();
  @override
  List<Object> get props => [];
}

class LoadDetailProduct extends DetailProductEvent {
  final String idProduct;
  const LoadDetailProduct(this.idProduct);

  @override
  List<Object> get props => [idProduct];
}
