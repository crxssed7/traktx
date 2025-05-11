// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_show_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentShowRequest _$CommentShowRequestFromJson(Map<String, dynamic> json) =>
    CommentShowRequest(
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      spoiler: json['spoiler'] as bool?,
      sharing:
          json['sharing'] == null
              ? null
              : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentShowRequestToJson(CommentShowRequest instance) =>
    <String, dynamic>{
      'show': instance.show.toJson(),
      'comment': instance.comment,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.sharing?.toJson() case final value?) 'sharing': value,
    };
