// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentListRequest _$CommentListRequestFromJson(Map<String, dynamic> json) =>
    CommentListRequest(
      list: List.fromJson(json['list'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      spoiler: json['spoiler'] as bool?,
      sharing:
          json['sharing'] == null
              ? null
              : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentListRequestToJson(CommentListRequest instance) =>
    <String, dynamic>{
      'list': instance.list.toJson(),
      'comment': instance.comment,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.sharing?.toJson() case final value?) 'sharing': value,
    };
