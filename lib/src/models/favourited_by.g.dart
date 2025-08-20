// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourited_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouritedBy _$FavouritedByFromJson(Map<String, dynamic> json) => FavouritedBy(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$FavouritedByToJson(FavouritedBy instance) =>
    <String, dynamic>{'user': instance.user.toJson(), 'notes': instance.notes};
