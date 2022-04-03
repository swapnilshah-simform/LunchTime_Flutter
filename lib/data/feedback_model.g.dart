// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackReview _$FeedbackReviewFromJson(Map<String, dynamic> json) =>
    FeedbackReview(
      menu_rev_star: (json['menu_rev_star'] as num).toDouble(),
      menu_rev_comment: json['menu_rev_comment'] as String,
    );

Map<String, dynamic> _$FeedbackReviewToJson(FeedbackReview instance) =>
    <String, dynamic>{
      'menu_rev_star': instance.menu_rev_star,
      'menu_rev_comment': instance.menu_rev_comment,
    };
