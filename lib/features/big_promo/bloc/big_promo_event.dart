import 'package:equatable/equatable.dart';

abstract class BigPromoEvent extends Equatable {
  const BigPromoEvent();
  @override
  List<Object> get props => [];
}

class FetchBigPromo extends BigPromoEvent {}
