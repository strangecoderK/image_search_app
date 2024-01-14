import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:search_app/ui/main/main_page.dart';
import 'package:search_app/ui/main/main_view_model.dart';
import 'di/di_setup.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt<MainViewModel>(),
          child: const MainPage(),
        );
      },
    ),
  ],
);