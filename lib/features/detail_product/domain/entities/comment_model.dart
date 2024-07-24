import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel(
      {required String commentId,
      required bool isHideAccountId,
      required String commentAccount,
      required String commentDesc,
      required double rating,
      required int isHelps,
      String? imageUrlAccount,
      List<String>? listFotoComments}) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
