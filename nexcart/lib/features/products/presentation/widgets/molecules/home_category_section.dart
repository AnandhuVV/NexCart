import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/see_all_button.dart';
import 'package:nexcart/core/ui/molecules/empty_state.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/presentation/notifiers/categories_notifier/categories_notifier.dart';
import 'package:nexcart/core/ui/atoms/category_chip.dart';
import 'package:nexcart/features/products/presentation/widgets/atoms/home_screen_category_shimmer.dart';

class HomeScreenCategorySection extends ConsumerStatefulWidget {
  const HomeScreenCategorySection({
    super.key,
    required this.onCategorySelection,
    this.selectedCategory,
  });

  final ValueChanged<CategoryEntity> onCategorySelection;
  final CategoryEntity? selectedCategory;

  @override
  ConsumerState<HomeScreenCategorySection> createState() =>
      _HomeScreenCategorySectionState();
}

class _HomeScreenCategorySectionState
    extends ConsumerState<HomeScreenCategorySection> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoriesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 48,
          decoration: BoxDecoration(color: context.colors.surface),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.categories, style: context.textStyle.bodySemibold),
              if (!categoryState.isLoading || !categoryState.hasError)
                SeeAllButton(
                  label: _showAll ? context.loc.seeLess : context.loc.seeAll,
                  onPressed: () {
                    setState(() {
                      if (_showAll) { // If currently showing all, rearrange to move selected category to front
                        ref
                            .read(categoriesProvider.notifier)
                            .reArrange(widget.selectedCategory!);
                      }

                      _showAll = !_showAll;
                    });
                  },
                ),
            ],
          ),
        ),

        categoryState.when(
          loading: () => const HomeScreenCategoryShimmer(),

          error: (error, _) => ErrorState(
            message: context.localizeError(error),
            onRetry: () => ref.invalidate(categoriesProvider),
          ),

          data: (categories) {
            if (categories.isEmpty) {
              return EmptyState(message: context.loc.noCategoriesFound);
            }

            // Checks if on first load and categories are available
            if (widget.selectedCategory == null && categories.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget.onCategorySelection(categories.first);
              });
            }

            if (!_showAll) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 12,
                        right: index == 3 ? 16 : 0,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 130),
                        child: CategoryChip(
                          label: categories[index].name,
                          onTap: () {
                            widget.onCategorySelection(categories[index]);
                          },
                          isSelected:
                              widget.selectedCategory?.name ==
                              categories[index].name,
                        ),
                      ),
                    );
                  }),
                ),
              );
            }

            final topRow = <Widget>[];
            final bottomRow = <Widget>[];

            for (int i = 0; i < categories.length; i++) {
              final chip = ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 160),
                child: CategoryChip(
                  label: categories[i].name,
                  isSelected:
                      widget.selectedCategory?.name == categories[i].name,
                  onTap: () {
                    widget.onCategorySelection(categories[i]);
                  },
                ),
              );

              if (i.isEven) {
                topRow.add(chip);
              } else {
                bottomRow.add(chip);
              }
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: topRow
                        .map(
                          (chip) => Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: chip,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Row(
                      children: bottomRow
                          .map(
                            (chip) => Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: chip,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
