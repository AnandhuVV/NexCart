// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetailsDTO {

 int get id; String get firstName; String get lastName; String get email; String get phone; String get gender; String get birthDate; String get image; String get role; AddressDTO get address;
/// Create a copy of UserDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailsDTOCopyWith<UserDetailsDTO> get copyWith => _$UserDetailsDTOCopyWithImpl<UserDetailsDTO>(this as UserDetailsDTO, _$identity);

  /// Serializes this UserDetailsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,phone,gender,birthDate,image,role,address);

@override
String toString() {
  return 'UserDetailsDTO(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, gender: $gender, birthDate: $birthDate, image: $image, role: $role, address: $address)';
}


}

/// @nodoc
abstract mixin class $UserDetailsDTOCopyWith<$Res>  {
  factory $UserDetailsDTOCopyWith(UserDetailsDTO value, $Res Function(UserDetailsDTO) _then) = _$UserDetailsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String lastName, String email, String phone, String gender, String birthDate, String image, String role, AddressDTO address
});


$AddressDTOCopyWith<$Res> get address;

}
/// @nodoc
class _$UserDetailsDTOCopyWithImpl<$Res>
    implements $UserDetailsDTOCopyWith<$Res> {
  _$UserDetailsDTOCopyWithImpl(this._self, this._then);

  final UserDetailsDTO _self;
  final $Res Function(UserDetailsDTO) _then;

/// Create a copy of UserDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,Object? gender = null,Object? birthDate = null,Object? image = null,Object? role = null,Object? address = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDTO,
  ));
}
/// Create a copy of UserDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDTOCopyWith<$Res> get address {
  
  return $AddressDTOCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDetailsDTO].
extension UserDetailsDTOPatterns on UserDetailsDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailsDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailsDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailsDTO():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailsDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String email,  String phone,  String gender,  String birthDate,  String image,  String role,  AddressDTO address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailsDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone,_that.gender,_that.birthDate,_that.image,_that.role,_that.address);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String email,  String phone,  String gender,  String birthDate,  String image,  String role,  AddressDTO address)  $default,) {final _that = this;
switch (_that) {
case _UserDetailsDTO():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone,_that.gender,_that.birthDate,_that.image,_that.role,_that.address);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String lastName,  String email,  String phone,  String gender,  String birthDate,  String image,  String role,  AddressDTO address)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailsDTO() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone,_that.gender,_that.birthDate,_that.image,_that.role,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailsDTO extends UserDetailsDTO {
  const _UserDetailsDTO({required this.id, required this.firstName, required this.lastName, required this.email, required this.phone, required this.gender, required this.birthDate, required this.image, required this.role, required this.address}): super._();
  factory _UserDetailsDTO.fromJson(Map<String, dynamic> json) => _$UserDetailsDTOFromJson(json);

@override final  int id;
@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String phone;
@override final  String gender;
@override final  String birthDate;
@override final  String image;
@override final  String role;
@override final  AddressDTO address;

/// Create a copy of UserDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailsDTOCopyWith<_UserDetailsDTO> get copyWith => __$UserDetailsDTOCopyWithImpl<_UserDetailsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,phone,gender,birthDate,image,role,address);

@override
String toString() {
  return 'UserDetailsDTO(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, gender: $gender, birthDate: $birthDate, image: $image, role: $role, address: $address)';
}


}

/// @nodoc
abstract mixin class _$UserDetailsDTOCopyWith<$Res> implements $UserDetailsDTOCopyWith<$Res> {
  factory _$UserDetailsDTOCopyWith(_UserDetailsDTO value, $Res Function(_UserDetailsDTO) _then) = __$UserDetailsDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String lastName, String email, String phone, String gender, String birthDate, String image, String role, AddressDTO address
});


@override $AddressDTOCopyWith<$Res> get address;

}
/// @nodoc
class __$UserDetailsDTOCopyWithImpl<$Res>
    implements _$UserDetailsDTOCopyWith<$Res> {
  __$UserDetailsDTOCopyWithImpl(this._self, this._then);

  final _UserDetailsDTO _self;
  final $Res Function(_UserDetailsDTO) _then;

/// Create a copy of UserDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,Object? gender = null,Object? birthDate = null,Object? image = null,Object? role = null,Object? address = null,}) {
  return _then(_UserDetailsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDTO,
  ));
}

/// Create a copy of UserDetailsDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDTOCopyWith<$Res> get address {
  
  return $AddressDTOCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
mixin _$AddressDTO {

 String get address; String get city; String get state; String get country; String get postalCode;
/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDTOCopyWith<AddressDTO> get copyWith => _$AddressDTOCopyWithImpl<AddressDTO>(this as AddressDTO, _$identity);

  /// Serializes this AddressDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDTO&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,city,state,country,postalCode);

@override
String toString() {
  return 'AddressDTO(address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class $AddressDTOCopyWith<$Res>  {
  factory $AddressDTOCopyWith(AddressDTO value, $Res Function(AddressDTO) _then) = _$AddressDTOCopyWithImpl;
@useResult
$Res call({
 String address, String city, String state, String country, String postalCode
});




}
/// @nodoc
class _$AddressDTOCopyWithImpl<$Res>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._self, this._then);

  final AddressDTO _self;
  final $Res Function(AddressDTO) _then;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? city = null,Object? state = null,Object? country = null,Object? postalCode = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressDTO].
extension AddressDTOPatterns on AddressDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDTO value)  $default,){
final _that = this;
switch (_that) {
case _AddressDTO():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String city,  String state,  String country,  String postalCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that.address,_that.city,_that.state,_that.country,_that.postalCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String city,  String state,  String country,  String postalCode)  $default,) {final _that = this;
switch (_that) {
case _AddressDTO():
return $default(_that.address,_that.city,_that.state,_that.country,_that.postalCode);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String city,  String state,  String country,  String postalCode)?  $default,) {final _that = this;
switch (_that) {
case _AddressDTO() when $default != null:
return $default(_that.address,_that.city,_that.state,_that.country,_that.postalCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressDTO implements AddressDTO {
  const _AddressDTO({required this.address, required this.city, required this.state, required this.country, required this.postalCode});
  factory _AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);

@override final  String address;
@override final  String city;
@override final  String state;
@override final  String country;
@override final  String postalCode;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDTOCopyWith<_AddressDTO> get copyWith => __$AddressDTOCopyWithImpl<_AddressDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDTO&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,city,state,country,postalCode);

@override
String toString() {
  return 'AddressDTO(address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class _$AddressDTOCopyWith<$Res> implements $AddressDTOCopyWith<$Res> {
  factory _$AddressDTOCopyWith(_AddressDTO value, $Res Function(_AddressDTO) _then) = __$AddressDTOCopyWithImpl;
@override @useResult
$Res call({
 String address, String city, String state, String country, String postalCode
});




}
/// @nodoc
class __$AddressDTOCopyWithImpl<$Res>
    implements _$AddressDTOCopyWith<$Res> {
  __$AddressDTOCopyWithImpl(this._self, this._then);

  final _AddressDTO _self;
  final $Res Function(_AddressDTO) _then;

/// Create a copy of AddressDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? city = null,Object? state = null,Object? country = null,Object? postalCode = null,}) {
  return _then(_AddressDTO(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
