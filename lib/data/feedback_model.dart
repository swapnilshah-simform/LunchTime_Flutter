import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedbackReview {
  final double menu_rev_star;
  final String menu_rev_comment;

  FeedbackReview({
    required this.menu_rev_star,
    required this.menu_rev_comment,
  });

  factory FeedbackReview.fromJson(Map<String, dynamic> json) =>
      _$FeedbackReviewFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackReviewToJson(this);
}
