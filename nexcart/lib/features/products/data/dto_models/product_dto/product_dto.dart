import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
sealed class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required String thumbnail,
    required List<String> images,
    required String availabilityStatus,
    String? brand,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}

// Extension to map DTO → Entity
extension ProductDTOMapper on ProductDTO {
  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        description: description,
        category: category,
        price: price,
        discountPercentage: discountPercentage,
        rating: rating,
        stock: stock,
        thumbnail: thumbnail,
        images: images,
        availabilityStatus: availabilityStatus,
        brand: brand,
      );
}