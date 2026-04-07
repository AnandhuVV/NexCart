import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response_dto.freezed.dart';
part 'signin_response_dto.g.dart';

@freezed
abstract class SignInResponseDTO with _$SignInResponseDTO {
  const SignInResponseDTO._();

  const factory SignInResponseDTO({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String accessToken,
    required String refreshToken,
  }) = _SignInResponseDTO;

  factory SignInResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDTOFromJson(json);

  String get fullName => '$firstName $lastName';
}