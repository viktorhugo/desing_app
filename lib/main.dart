import 'package:desing_app/models/layout_model.dart';
import 'package:desing_app/pages/pages.dart';
import 'package:desing_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ThemeChanger(theme: 2)),
        ChangeNotifierProvider(create: (BuildContext context) => LayoutProvider())
      ],
      child: const MyApp()
    )
  );
}
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (BuildContext context) => ThemeChanger(theme: 2),
//       child: const MyApp()
//     )
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // themeMode: ThemeMode.light,
      theme: appTheme,
      
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          print ('orientation $orientation');
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          }else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}


