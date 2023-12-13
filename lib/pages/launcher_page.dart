import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:desing_app/routes/routes.dart';
import 'package:desing_app/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Designs flutter'),
        backgroundColor: Colors.blue,
      ),
      drawer: _MenuPrincipal(),
      body: _ListOptions(),
    );
  }
}

class _ListOptions extends StatelessWidget {
  
  const _ListOptions({ super.key });

  @override
  Widget build(BuildContext context) {

    final routes = pageRoutes;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: routes.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.amber,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: FaIcon(routes[index].icon, color: Colors.blue),
          title: Text(routes[index].title),
          trailing: const Icon(Icons.chevron_right, color: Colors.blue,),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => routes[index].page));
          },
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeChanger themeProvider = Provider.of<ThemeChanger>(context);

    return Drawer(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      child: Column(
        children: [

          SafeArea(
            child: Container(
              // padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: 150,
              child: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text('VM', style:  TextStyle( fontSize: 50, color: Colors.white),),
              ),
            ),
          ),

          const Expanded(child: _ListOptions()),

          ListTile(
            leading: const Icon(Icons.lightbulb_outline, color: Colors.blue,),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: themeProvider.darkTheme, 
              activeColor: Colors.blue,
              onChanged: (value) => themeProvider.darkTheme = value,
            ),
          ),

          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: const Icon(Icons.add_to_home_screen, color: Colors.blue,),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: themeProvider.customTheme,
                activeColor: Colors.blue,
                onChanged: (value) => themeProvider.customTheme = value,
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}