import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

class RefreshDetailProduct extends DetailProductEvent {
  final String idProduct;
  final RefreshController controller;
  const RefreshDetailProduct(this.idProduct, this.controller);

  @override
  List<Object> get props => [idProduct, controller];
}
