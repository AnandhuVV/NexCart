import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/category_chip.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({
    super.key,
    required this.product,
    required this.onTapDeleteButton,
  });

  final ProductEntity product;
  final VoidCallback onTapDeleteButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 10,
            //offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 130,
            fit: BoxFit.contain,
            imageUrl: product.thumbnail,
            placeholder: (context, url) =>
                Container(color: context.colors.shimmerBase, height: 160),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 14,
                bottom: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 0,
                children: [
                  Text(product.title, style: context.textStyle.bodySemibold),
                  SizedBox(height: 4),
                  Text(
                    product.brand ?? "",
                    style: context.textStyle.bodyThin.copyWith(
                      color: context.colors.primaryAction,
                    ),
                  ),

                  SizedBox(height: 12),

                  CategoryChip(label: product.category, isSelected: false, onTap: () {}),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: context.textStyle.bodySemibold,
                      ),

                      IconButton(
                        onPressed: () {
                          onTapDeleteButton();
                        },
                        icon: Icon(Icons.delete, color: context.colors.error),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
