import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchenomics/Router/navigator_service.dart';
import 'package:kitchenomics/Router/router.dart';
import 'package:kitchenomics/Router/router_path.dart';
import 'package:kitchenomics/common/global.dart';
import 'package:kitchenomics/constant/constant.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _locale;
  dynamic navRouteData;
  double defaultTxtScaleFactor = 1.0;
  double largerTxtScaleFactor = 1.3;
  final double _uiWidth = 375;
  final double _uiHeight = 812;
  @override
  void initState() {
    super.initState();

    _locale = Global.getInstance().locale;
    _initialRoute();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return _appWidget(context);
  }

  _appWidget(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(_uiWidth, _uiHeight),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          locale: _locale,
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            return _locale;
          },
          theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: kPrimaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size(double.infinity, 56),
                  minimumSize: const Size(double.infinity, 56),
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: kPrimaryLightColor,
                iconColor: kPrimaryColor,
                prefixIconColor: kPrimaryColor,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
              )),
          navigatorKey: NavigateService.key,
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  _initialRoute() {
    loadData();
    Future.delayed(const Duration(seconds: 1), () {
      NavigateService.pushNamedRoute(RouterPath.DASHBOARD);
    });
  }

  loadData() async {
    if (Global.getInstance().jsonString == null) {
      var data = await rootBundle.loadString("assets/Recipe-Info.JSON");
      final value = json.decode(data);
      Global.getInstance().jsonString = data;
    }
    print(Global.getInstance().jsonString);
  }
}
