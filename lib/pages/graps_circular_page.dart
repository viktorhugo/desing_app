import 'package:desing_app/theme/theme.dart';
import 'package:desing_app/widgets/radial_progres.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphsCircularsPage extends StatefulWidget {
  const GraphsCircularsPage({super.key});

  @override
  State<GraphsCircularsPage> createState() => _GraphsCircularsPageState();
}

class _GraphsCircularsPageState extends State<GraphsCircularsPage> {

  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          percentage += 10;
          if (percentage > 100 ) {
            percentage = 0;
          }
          setState(() {});
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            CustomRadialProgress(percentage: percentage, primaryColor: Colors.amber, secondaryColor: Colors.greenAccent,),
            CustomRadialProgress(percentage: percentage * 1.2, primaryColor: Colors.black, secondaryColor: Colors.green,)
          ]),
          Row(children: [
            CustomRadialProgress(percentage: percentage* 4, primaryColor: Colors.deepPurple, secondaryColor: Colors.redAccent,),
            CustomRadialProgress(percentage: percentage* 6, primaryColor: Colors.blueAccent, secondaryColor: Colors.deepOrange,)
          ]),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;

  const CustomRadialProgress({
    super.key,
    required this.percentage,
    required this.primaryColor,
    required this.secondaryColor,
  });


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return SizedBox(
      width: 150,
      height: 150,
      // color: Colors.red[400],
      // child:  Text('$percentage %', style: const TextStyle(fontSize: 50),),
      child: RadialProgress(
        percentage: percentage, 
        primaryColor:primaryColor,
        // secondaryColor: secondaryColor,
        secondaryColor: appTheme.textTheme.bodyLarge?.color ?? Colors.grey,
        strokeSecondary: 4,
        strokePrimary: 10
      ),
    );
  }
}