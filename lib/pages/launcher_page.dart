import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 30,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.amber,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return const ListTile(
          leading: FaIcon(FontAwesomeIcons.slideshare, color: Colors.blue),
          title: Text('Hello write'),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
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
              value: true, 
              activeColor: Colors.blue,
              onChanged: (value) {}
            ),
          ),

          ListTile(
            leading: const Icon(Icons.add_to_home_screen, color: Colors.blue,),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: true,
              activeColor: Colors.blue,
              onChanged: (value) {}
            ),
          ),

          SizedBox(height: 10,)
      
        ],
      ),
    );
  }
}