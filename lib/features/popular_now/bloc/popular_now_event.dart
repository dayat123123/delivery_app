import 'package:equatable/equatable.dart';

abstract class PopularNowEvent extends Equatable {
  const PopularNowEvent();
  @override
  List<Object> get props => [];
}

class FetchPopularNow extends PopularNowEvent {}
