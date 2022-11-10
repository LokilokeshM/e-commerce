import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/Router/navigator_service.dart';
import 'package:ecommerce/Router/router.dart';
import 'package:ecommerce/Router/router_path.dart';
import 'package:ecommerce/common/global.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/generated/l10n.dart';

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
    ///Initializing screen Util
    ScreenUtil.init(context);
    return _appWidget(context);
  }

  _appWidget(BuildContext context) {
    return ScreenUtilInit(
      ///Initializing the screen with the common height and width
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
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
          ],
        );
      },
    );
  }

  _initialRoute() {
    loadData();
    loadDataFormApi();

    ///Initial Navigation to Dashboard Screen
    Future.delayed(const Duration(seconds: 1), () {
      NavigateService.pushNamedRoute(RouterPath.DASHBOARD);
    });
  }

  ///Used to store the json in the local storage / local cache storage
  ///If data available it will not load data from the json file.
  loadData() async {
    if (Global.getInstance().jsonString == null) {
      ///loading data from the json file
      var data = await rootBundle.loadString("assets/Recipe-Info.JSON");
      final value = json.decode(data);

      ///Storing data to the local storage data
      Global.getInstance().jsonString = data;
    }

    ///Log the stored Value
    ///If need to check log uncomment Line 116
    // log(Global.getInstance().jsonString.toString());
  }

  void loadDataFormApi() async {
    // final client = ApiClient(Dio(BaseOptions()));
    try {
      // ItemList response = await client.getItems();
      // log(response.toString());
      // log(await client.getItems().toString());
    } catch (e) {
      log(e.toString());
    }
    // print(response.toString());
  }
}
