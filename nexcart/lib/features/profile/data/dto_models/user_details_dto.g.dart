// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDetailsDTO _$UserDetailsDTOFromJson(Map<String, dynamic> json) =>
    _UserDetailsDTO(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      birthDate: json['birthDate'] as String,
      image: json['image'] as String,
      role: json['role'] as String,
      address: AddressDTO.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailsDTOToJson(_UserDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'role': instance.role,
      'address': instance.address,
    };

_AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => _AddressDTO(
  address: json['address'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
  postalCode: json['postalCode'] as String,
);

Map<String, dynamic> _$AddressDTOToJson(_AddressDTO instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };
