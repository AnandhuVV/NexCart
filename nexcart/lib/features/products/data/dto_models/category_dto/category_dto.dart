import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
sealed class CategoryDTO with _$CategoryDTO {
  const factory CategoryDTO({
    required String slug,
    required String name,
    required String url,
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);
}

extension CategoryDTOMapper on CategoryDTO {
  CategoryEntity toEntity() => CategoryEntity(
        slug: slug,
        name: name,
        url: url,
      );
}