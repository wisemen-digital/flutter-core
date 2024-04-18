import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "")
abstract class AppRouter extends _$AppRouter {
  late final ProviderRef ref;
}
