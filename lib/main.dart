import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main (){



  runApp(myapp());






}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),);
  }
}
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  TextEditingController agecontroller= TextEditingController();
  TextEditingController ftcontroller= TextEditingController();
  TextEditingController incontroller= TextEditingController();
  TextEditingController kgcontroller= TextEditingController();
double result=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.replay)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))

        ],
        backgroundColor: Colors.red,
        title:const Text('BMI  Calculator'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(

            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
controller:agecontroller ,

                      decoration: InputDecoration(
                        labelText: 'Age',

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(

                      decoration: InputDecoration(
                        labelText: 'Ht(ft)',

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: ftcontroller,
                      decoration: InputDecoration(
                        labelText: 'Ht(in)',

                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
            height: 20,
          ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Icon(Icons.male),

                  Text('|'),
                  Icon(Icons.female),
                  SizedBox(
                    width: 90,

                    child: TextField(
                      controller: kgcontroller,
                      decoration: InputDecoration(
                        labelText: 'Weight(kg)'
                      ),
                    ),
                  ),

                  IconButton(onPressed: (){

                    double ft= double.tryParse(agecontroller.text)??0;
                    double inch= double.tryParse(incontroller.text)??0;
                    double kg= double.tryParse(kgcontroller.text)??0;
                 double  meter=(ft*12+inch)*0.0254;
                        result=(kg)/(meter*meter);
                        setState(() {

                        });
                  }

                  , icon: Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),

            SfRadialGauge(
                axes: <RadialAxis>[
                RadialAxis(minimum:10, maximum: 40,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 10, endValue: 18, color:Colors.blue),
              GaugeRange(startValue: 18,endValue: 24,color: Colors.orange),
              GaugeRange(startValue: 24,endValue: 40,color: Colors.red)],
            pointers: <GaugePointer>[
              NeedlePointer(value: result.toDouble())],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(widget: Container(child:
              Text(result.toStringAsFixed(2).toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                  angle: 90, positionFactor: 0.5
              )]
                )]),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('Very Serverely Underweight',style: TextStyle(
             color: (result.toDouble()??0) <= 15.9? Colors.green :Colors.black
                  ),
                  ),
                  Text('<- 15.9',style: TextStyle(
                      color: (result.toDouble()??0) <= 15.9? Colors.green :Colors.black
                  ),),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text('serverely Underweight',style: TextStyle(
                  color: (result.toDouble()??0) >= 15.9  && (result.toDouble()??0) <16.9 ? Colors.green :Colors.black
      ),

                  ),
                  Text('16.0-16.9',style: TextStyle(
                      color: (result.toDouble()??0) >= 15.9  && (result.toDouble()??0) <16.9 ? Colors.green :Colors.black
                  ),)

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text('Underweight',
              style: TextStyle(
                  color: (result.toDouble()??0) >= 17.0  && (result.toDouble()??0) <18.4 ? Colors.green :Colors.black
      ),),
                  Text('17.0-18.4', style: TextStyle(
                      color: (result.toDouble()??0) >= 17.0  && (result.toDouble()??0) <18.4 ? Colors.green :Colors.black
                  ),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text('Normal', style: TextStyle(
                  color: (result.toDouble()??0) >= 18.5  && (result.toDouble()??0) <=24.9 ? Colors.green :Colors.black
              ),
                  ),
                  Text('18.5-24.9',style: TextStyle(
                      color: (result.toDouble()??0) >= 18.5  && (result.toDouble()??0) <=24.9 ? Colors.green :Colors.black
                  ),)

                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text(' overweight',style: TextStyle(
                      color: (result.toDouble()??0) >= 25.0 && (result.toDouble()??0) <=29.9 ? Colors.green :Colors.black
                  ),),
                  Text('25.0-29.9',style: TextStyle(
                      color: (result.toDouble()??0) >= 18.5  && (result.toDouble()??0) <=24.9 ? Colors.green :Colors.black
                  ),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text('Obese Class |'),
                  Text('30.0-29.9')

                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text('Obese Class ||'),
                  Text('30.0-39.9')

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text('Obese Class |',style: TextStyle(
                      color: (result.toDouble()??0) >= 30  && (result.toDouble()??0) <45 ? Colors.green :Colors.black
                  ),),
                  Text('>=45.0')

                ],
              ),


              Text('Normal Weight:119.180',
                style:  TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.red
                ),)



            ]
          )




             ),
        )
    );

  }
}

