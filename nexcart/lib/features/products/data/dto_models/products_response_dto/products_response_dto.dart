import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexcart/features/products/data/dto_models/product_dto/product_dto.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';

part 'products_response_dto.freezed.dart';
part 'products_response_dto.g.dart';

@freezed
sealed class ProductsResponseDTO with _$ProductsResponseDTO {
  const factory ProductsResponseDTO({
    required List<ProductDTO> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ProductsResponseDTO;

  factory ProductsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseDTOFromJson(json);
}

extension ProductsResponseDTOMapper on ProductsResponseDTO {
  PaginatedProductsEntity toEntity() => PaginatedProductsEntity(
        products: products.map((dto) => dto.toEntity()).toList(),
        total: total,
        skip: skip,
        limit: limit,
      );
}