import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Api & Routes/routes.dart';
import 'Providers/homepro.dart';
import 'Providers/profilepro.dart';
import 'Providers/signuppro.dart';
// twf98914

//name
//company name
//address
//picture
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpPro>(create: (BuildContext context) => SignUpPro()),
        ChangeNotifierProvider<HomePro>(create: (BuildContext context) => HomePro()),
        ChangeNotifierProvider<ProfilePro>(create: (BuildContext context) => ProfilePro()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    RouteManager.width = MediaQuery.of(context).size.width;
    RouteManager.height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: RouteManager.rootpage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
