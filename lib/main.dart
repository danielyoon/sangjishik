import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/business_logic/logic/user_service.dart';
import 'package:sangjishik/business_logic/logic/app_model.dart';
import 'package:sangjishik/business_logic/logic/bootstrap.dart';
import 'package:sangjishik/service/nodejs.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  registerSingletons();

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
  GetIt.I.registerLazySingleton<AppModel>(() => AppModel());
  GetIt.I.registerLazySingleton<UserService>(() => UserService());
  GetIt.I.registerLazySingleton<NodeJs>(() => NodeJs());
}

Bootstrap get bootstrap => GetIt.I.get<Bootstrap>();

AppModel get appModel => GetIt.I.get<AppModel>();

UserService get userService => GetIt.I.get<UserService>();
