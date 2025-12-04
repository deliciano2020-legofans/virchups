import 'package:get/get.dart';
import '../pages/home/home_page.dart';
import '../controllers/quote_controller.dart';

/// Route names
class Routes {
  static const String home = '/';

  // Add more route names here as your app grows
  // static const String settings = '/settings';
  // static const String profile = '/profile';
}

/// App routes configuration
class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      // Inline binding - initialize controllers for home page
      binding: BindingsBuilder(() {
        // Initialize QuoteController for this page
        Get.lazyPut<QuoteController>(() => QuoteController());
      }),
    ),

    // Add more routes here as your app grows
    // GetPage(
    //   name: Routes.settings,
    //   page: () => const SettingsPage(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<SettingsController>(() => SettingsController());
    //   }),
    // ),
  ];
}
