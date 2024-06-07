import 'package:equatable/equatable.dart';

abstract class RecommendedEvent extends Equatable {
  const RecommendedEvent();
  @override
  List<Object> get props => [];
}

class FetchRecommended extends RecommendedEvent {}
