import 'package:desing_app/widgets/radial_progres.dart';
import 'package:flutter/material.dart';

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
            CustomRadialProgress(percentage: percentage, primaryColor: Colors.black, secondaryColor: Colors.green,)
          ]),
          Row(children: [
            CustomRadialProgress(percentage: percentage, primaryColor: Colors.deepPurple, secondaryColor: Colors.redAccent,),
            CustomRadialProgress(percentage: percentage, primaryColor: Colors.blueAccent, secondaryColor: Colors.deepOrange,)
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
    return Container(
      width: 150,
      height: 150,
      // color: Colors.red[400],
      // child:  Text('$percentage %', style: const TextStyle(fontSize: 50),),
      child: RadialProgress(
        percentage: percentage, 
        primaryColor:primaryColor,
        secondaryColor: secondaryColor,
        strokeSecondary: 4,
        strokePrimary: 10
      ),
    );
  }
}