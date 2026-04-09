import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/providers/connectivity/connectivity_guard_provider.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We use .watch here because we want the UI to rebuild instantly
    final connectivity = ref.watch(connectivityStatusProvider);

    return connectivity.when(
      data: (isOnline) {
        // If online, this widget takes up zero space
        if (isOnline) return const SizedBox.shrink(); 
        
        // If offline, it renders the banner
        return Container(
          width: double.infinity,
          color: context.colors.error,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.loc.offlineBannerMessage,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
