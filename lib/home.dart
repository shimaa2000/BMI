import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = false;
  double result = 0;
  double heightVal = 161;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    m1Expanded('Male'),
                    SizedBox(
                      width: 10,
                    ),
                    m1Expanded('Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            heightVal.toStringAsFixed(0),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text('cm',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white70,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Slider(
                        value: heightVal,
                        onChanged: (val) {
                          setState(() {
                            heightVal = val;
                          });
                        },
                        max: 200,
                        min: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    m2Expanded('Weight'),
                    SizedBox(
                      width: 20,
                    ),
                    m2Expanded('Age'),
                  ],
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blue,
                child: TextButton(
                    onPressed: () {
                      result = weight / (pow(heightVal / 100, 2));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Result(result: result, isMale: isMale, age: age);
                      }));
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    )))
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == 'Male' ? isMale = true : isMale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                ? Colors.blue
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'Male' ? Icons.male : Icons.female,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(String name) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name == 'Age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name == 'Age' ? age.toString() : weight.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: name == 'Age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      name == 'Age' ? age++ : weight++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  heroTag: name == 'Age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      name == 'Age' ? --age : --weight;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    size: 25,
                  ),
                ),
              ],
            ),SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
