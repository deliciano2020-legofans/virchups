import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../../controllers/quote_controller.dart';

/// Minimalist home page with focus on quotes
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final QuoteController quoteController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Virchups'),
        actions: [
          // Theme toggle button
          Obx(() => IconButton(
                icon: Icon(
                  themeController.isDarkMode
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
                onPressed: () => themeController.toggleTheme(),
                tooltip: themeController.isDarkMode
                    ? 'Switch to Light Mode'
                    : 'Switch to Dark Mode',
              )),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),

                  // App branding - simple text
                  Text(
                    'Virchups',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  // Subtle tagline
                  Text(
                    'Some Nonsense Quotes',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withOpacity(0.6),
                          letterSpacing: 1,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 80),

                  // Quote display area
                  Obx(() {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 48,
                      ),
                      child: Column(
                        children: [
                          // Opening quote mark (static)
                          Icon(
                            Icons.format_quote,
                            size: 32,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                          ),

                          const SizedBox(height: 24),

                          // The quote (animated)
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 0.1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              );
                            },
                            child: Text(
                              quoteController.currentQuote.isEmpty
                                  ? 'Click below to start nonsense'
                                  : quoteController.currentQuote,
                              key: ValueKey(quoteController.currentQuote),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    height: 1.6,
                                    fontStyle:
                                        quoteController.currentQuote.isEmpty
                                            ? FontStyle.italic
                                            : FontStyle.normal,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Closing quote mark (static)
                          Icon(
                            Icons.format_quote,
                            size: 32,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 64),

                  // Minimalist refresh button
                  TextButton.icon(
                    onPressed: () => quoteController.getRandomQuote(),
                    icon: const Icon(Icons.refresh_rounded, size: 20),
                    label: const Text('New quote'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
