import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/cloudinary.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/controller/logic/bootstrap.dart';
import 'package:sangjishik/controller/logic/token_storage.dart';
import 'package:sangjishik/controller/logic/login.dart';
import 'package:sangjishik/controller/logic/auth_user.dart';
import 'package:sangjishik/controller/logic/posts.dart';

void main() async {
  usePathUrlStrategy();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
  GetIt.I.registerLazySingleton<Bootstrap>(() => Bootstrap());
  GetIt.I.registerLazySingleton<AuthUser>(() => AuthUser());
  GetIt.I.registerLazySingleton<Login>(() => Login());
  GetIt.I.registerLazySingleton<TokenStorage>(() => TokenStorage());
  GetIt.I.registerLazySingleton<NodeJs>(() => NodeJs());
  GetIt.I.registerLazySingleton<Cloudinary>(() => Cloudinary());
  GetIt.I.registerLazySingleton<Posts>(() => Posts());
}

Bootstrap get bootstrap => GetIt.I.get<Bootstrap>();

AuthUser get auth => GetIt.I.get<AuthUser>();

Login get login => GetIt.I.get<Login>();

TokenStorage get tokens => GetIt.I.get<TokenStorage>();

Cloudinary get cloudinary => GetIt.I.get<Cloudinary>();

Posts get posts => GetIt.I.get<Posts>();
