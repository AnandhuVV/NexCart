// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => _ProductDTO(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
  discountPercentage: (json['discountPercentage'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  thumbnail: json['thumbnail'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  availabilityStatus: json['availabilityStatus'] as String,
  brand: json['brand'] as String?,
);

Map<String, dynamic> _$ProductDTOToJson(_ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'availabilityStatus': instance.availabilityStatus,
      'brand': instance.brand,
    };
