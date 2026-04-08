import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexcart/features/profile/domain/entities/user_details_entity.dart';

part 'user_details_dto.freezed.dart';
part 'user_details_dto.g.dart';

@freezed
sealed class UserDetailsDTO with _$UserDetailsDTO {
  const UserDetailsDTO._();

  const factory UserDetailsDTO({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
    required String birthDate,
    required String image,
    required String role,
    required AddressDTO address,
  }) = _UserDetailsDTO;

  factory UserDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsDTOFromJson(json);
}

@freezed
sealed class AddressDTO with _$AddressDTO {
  const factory AddressDTO({
    required String address,
    required String city,
    required String state,
    required String country,
    required String postalCode,
  }) = _AddressDTO;

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);
}

extension UserDetailsMapper on UserDetailsDTO {
  UserDetailsEntity toEntity() {
    return UserDetailsEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      gender: gender,
      birthDate: birthDate,
      image: image,
      role: role,
      address: AddressEntity(
        address: address.address,
        city: address.city,
        state: address.state,
        country: address.country,
        postalCode: address.postalCode,
      ),
    );
  }
}
