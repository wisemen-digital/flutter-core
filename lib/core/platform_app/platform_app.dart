import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wisecore/core/router/app_router.dart';
import 'package:wisecore/core/router/route_observer.dart';
import 'package:logger/logger.dart';

import 'platform_widget.dart';

class PlatformApp extends PlatformWidget<Widget, Widget> {
  final ThemeData materialTheme;
  final CupertinoThemeData cupertinoTheme;
  final Widget? home;
  final String title;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState>? globalNavKey;
  final Locale? locale;
  final dynamic builder;
  final String initialRoute;
  final bool showDebugBanner;
  final WidgetRef ref;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final bool useInheritedMediaQuery;
  final bool showFlavorBanner;
  final AppRouter appRouter;
  final String? flavorName;
  final List<NavigatorObserver>? navigatorObservers;
  // final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  PlatformApp({
    this.globalNavKey,
    required this.materialTheme,
    required this.cupertinoTheme,
    this.home,
    required this.title,
    required this.supportedLocales,
    this.locale,
    this.builder,
    this.initialRoute = '/',
    this.showDebugBanner = true,
    required this.ref,
    required this.localizationsDelegates,
    this.useInheritedMediaQuery = false,
    this.showFlavorBanner = true,
    required this.appRouter,
    this.navigatorObservers,
    // required this.onGenerateRoute,
    this.flavorName,
  });

  @override
  Widget createCupertinoWidget(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: _flavorBanner(
          show: showFlavorBanner,
          child: CupertinoApp.router(
            title: title,
            theme: cupertinoTheme,
            locale: locale,
            // navigatorKey: globalNavKey,

            debugShowCheckedModeBanner: showDebugBanner,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            routerConfig: appRouter.config(
              navigatorObservers: () => [
                AppRouterObserver(),
                ...?navigatorObservers,
              ],
            ),
          ),
        ),
      );

  @override
  Widget createMaterialWidget(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: _flavorBanner(
          show: showFlavorBanner,
          child: MaterialApp.router(
            title: title,
            theme: materialTheme,
            // navigatorKey: globalNavKey,
            debugShowCheckedModeBanner: showDebugBanner,
            localizationsDelegates: localizationsDelegates,
            // localizationsDelegates: const [
            // S.delegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
            // DefaultMaterialLocalizations.delegate,
            // ],
            locale: locale,
            builder: builder,
            supportedLocales: supportedLocales,
            routerConfig: appRouter.config(
              // initialDeepLink: initialRoute,
              deepLinkBuilder: (deepLink) {
                Logger().d(deepLink);
                return deepLink;
              },
              navigatorObservers: () => [
                AppRouterObserver(),
                ...?navigatorObservers,
              ],
            ),
            // initialRoute: initialRoute,
            // onGenerateRoute: onGenerateRoute,
          ),
        ),
      );

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show && flavorName != null
          ? Directionality(
              textDirection: TextDirection.ltr,
              child: Banner(
                location: BannerLocation.topStart,
                message: flavorName!,
                color: const Color(0xFF7D1B1A),
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.0,
                    letterSpacing: 1.0,
                    color: Colors.white),
                textDirection: TextDirection.ltr,
                child: child,
              ),
            )
          : child;
}
