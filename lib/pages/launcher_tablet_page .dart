import 'package:desing_app/models/layout_model.dart';
import 'package:desing_app/routes/routes.dart';
import 'package:desing_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeChanger themeProvider = Provider.of<ThemeChanger>(context);
    final LayoutProvider layoutProvider = Provider.of<LayoutProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.currentTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Designs flutter Tablet'),
      ),
      drawer: const _MenuPrincipal(),
      body:  Row(
        children: [
          const SizedBox(
            width: 320,
            height: double.infinity,
            child: _OptionList(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (themeProvider.darkTheme) ? Colors.grey : themeProvider.currentTheme.hintColor,
          ),
          Expanded(
            child: layoutProvider.currentPage
          )
        ],
      ),
      // body: ,
    );
  }
}

class _OptionList extends StatelessWidget {
  
  const _OptionList({ super.key });

  @override
  Widget build(BuildContext context) {

    final routes = pageRoutes;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final LayoutProvider layoutProvider = Provider.of<LayoutProvider>(context, listen: false);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: routes.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: appTheme.primaryColorLight,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: FaIcon(routes[index].icon, color: appTheme.colorScheme.secondary),
          title: Text(routes[index].title),
          trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary,),
          onTap: () {
            layoutProvider.currentPage = routes[index].page;
            // Navigator.push(context, MaterialPageRoute(builder: (context) => routes[index].page));
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
    final secondaryColor = themeProvider.currentTheme.colorScheme.secondary;

    return Drawer(
      // surfaceTintColor: Colors.white,
      // shadowColor: Colors.white,
      child: Column(
        children: [

          SafeArea(
            child: SizedBox(
              // padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: 150,
              child:  CircleAvatar(
                backgroundColor: secondaryColor,
                child: const Text('VM', style:  TextStyle( fontSize: 50, color: Colors.white),),
              ),
            ),
          ),

          const Expanded(child: _OptionList()),

          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: secondaryColor,),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: themeProvider.darkTheme, 
              activeColor: secondaryColor,
              onChanged: (value) => themeProvider.darkTheme = value,
            ),
          ),

          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(Icons.add_to_home_screen, color: secondaryColor,),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: themeProvider.customTheme,
                activeColor: secondaryColor,
                onChanged: (value) => themeProvider.customTheme = value,
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}