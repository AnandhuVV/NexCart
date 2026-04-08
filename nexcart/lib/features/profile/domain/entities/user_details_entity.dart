class UserDetailsEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String birthDate;
  final String image;
  final String role;
  final AddressEntity address;

  const UserDetailsEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.image,
    required this.role,
    required this.address,
  });

  String get fullName => '$firstName $lastName';
}

class AddressEntity {
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  const AddressEntity({
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  String get formatted =>
      '$address, $city, $state, $country - $postalCode';
}