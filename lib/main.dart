import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/business_logic/logic/user_service.dart';
import 'package:sangjishik/business_logic/logic/app_model.dart';
import 'package:sangjishik/business_logic/logic/bootstrap.dart';
import 'package:sangjishik/service/cloudinary.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/business_logic/logic/token_storage.dart';
import 'package:sangjishik/user_interface/app_scaffold.dart';
import 'package:sangjishik/user_interface/styles/styles.dart';

void main() async {
  usePathUrlStrategy();

  WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  registerSingletons();

  await bootstrap.init();

  runApp(const Sangjishik());
}

class Sangjishik extends StatelessWidget {
  const Sangjishik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}

void registerSingletons() {
  GetIt.I
      .registerLazySingleton<Bootstrap>(() => Bootstrap());
  GetIt.I.registerLazySingleton<AppModel>(() => AppModel());
  GetIt.I.registerLazySingleton<UserService>(
      () => UserService());
  GetIt.I.registerLazySingleton<TokenStorage>(
      () => TokenStorage());
  GetIt.I.registerLazySingleton<NodeJs>(() => NodeJs());
  GetIt.I.registerLazySingleton<Cloudinary>(
      () => Cloudinary());
}

Bootstrap get bootstrap => GetIt.I.get<Bootstrap>();
AppModel get appModel => GetIt.I.get<AppModel>();
UserService get userService => GetIt.I.get<UserService>();
TokenStorage get tokens => GetIt.I.get<TokenStorage>();
Cloudinary get cloudinary => GetIt.I.get<Cloudinary>();
AppStyle get $styles => AppScaffold.style;
