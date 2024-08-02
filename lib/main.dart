import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:music/refresh/refresh_header.dart';
import 'package:music/routes/app_routes.dart';
import 'package:music/utils/inject.dart';
import 'package:music/utils/key_board.dart';
import 'package:music/utils/sp_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'refresh/refresh_footer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.init();
  Inject.init();
  runApp(
    const MyApp(),
  );
  topInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const RefreshHeader(),
      footerBuilder: () => const RefreshFooter(),
      hideFooterWhenNotFull: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'music',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.splash,
        getPages: Routes.routes,
        builder: FlutterSmartDialog.init(
          builder: (context, child) {
            return Scaffold(
              body: GestureDetector(
                onTap: () => KeyboardUtils.hideKeyboard(context),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}

///透明状态栏
topInit() {
  SystemUiOverlayStyle style = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}
