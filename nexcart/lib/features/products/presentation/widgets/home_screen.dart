import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/offline_banner.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/presentation/widgets/molecules/home_category_section.dart';
import 'package:nexcart/features/products/presentation/widgets/molecules/home_product_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  CategoryEntity? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: context.colors.primaryAction,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 16,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/app_logo_app_bar.png',
              height: 42,
              width: 42,
            ),
            const SizedBox(width: 8),
            Text(
              context.loc.appName,
              style: context.textStyle.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.onPrimary,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const OfflineBanner(),
          
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  spacing: 12,
                  children: [
                    HomeScreenCategorySection(
                      selectedCategory: selectedCategory,
                      onCategorySelection: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
            
                    if (selectedCategory != null)
                      HomeScreenProductsSection(selectedCategory: selectedCategory!),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
