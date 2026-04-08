import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/nex_shimmer.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/authentication/di/auth_providers.dart';
import 'package:nexcart/features/profile/presentation/notifiers/profile_screen_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Widget _getShimmer() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          NexShimmer(height: 100),
          NexShimmer(height: 60),
          NexShimmer(height: 60),
          NexShimmer(height: 60),
          NexShimmer(height: 60),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileScreenProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: context.textStyle.headingMedium.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        backgroundColor: context.colors.primaryAction,
        foregroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 16,
      ),
      floatingActionButton: SizedBox(
        height: 36,
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: context.colors.textPrimary),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);

                        await ref
                            .read(profileScreenProvider.notifier)
                            .signOut();

                        if (!context.mounted) return;

                        context.go('/login');
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: context.colors.error),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(context.colors.error),
          ),
          child: Text(
            "Log Out",
            style: context.textStyle.bodyThin.copyWith(
              color: context.colors.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: profileState.when(
        loading: () => _getShimmer(),

        error: (error, _) => ErrorState(
          message: error.toString(),
          onRetry: () => ref.invalidate(profileScreenProvider),
        ),

        data: (user) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    color: context.colors.surface,
                    child: CachedNetworkImage(imageUrl: user.image),
                  ),
                ),

                const SizedBox(height: 16),

                Text(user.fullName, style: context.textStyle.headingMedium),

                const SizedBox(height: 4),

                Text(
                  user.role.toUpperCase(),
                  style: context.textStyle.bodyMedium.copyWith(
                    color: context.colors.primaryAction,
                  ),
                ),

                const SizedBox(height: 24),

                _ProfileInfoTile(label: 'Email', value: user.email),

                _ProfileInfoTile(label: 'Phone', value: user.phone),

                _ProfileInfoTile(label: 'Gender', value: user.gender),

                _ProfileInfoTile(label: 'Birth Date', value: user.birthDate),

                _ProfileInfoTile(
                  label: 'Address',
                  value: user.address.formatted,
                ),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  const _ProfileInfoTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black.withValues(alpha: 0.1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textStyle.bodyThin.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: context.textStyle.bodyNormal.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
