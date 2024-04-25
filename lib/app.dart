import 'package:flutter/material.dart';
import 'package:lesson2/models/car.dart';
import 'package:lesson2/widgets/car_tile.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Car> cars = [
    Car(brand:'BMW',price: 10000),
    Car(brand:'Mers',price: 20000),
    Car(brand:'Ferarri',price: 30000),
    Car(brand:'Lamoborgni',price: 40000),
    Car(brand:'Nexia',price: 50000),
  ];

  List<Car> filteredCars = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredCars = cars;
  }

  void sortCars(){
    setState(() {
      cars.sort((a,b)=> a.price.compareTo(b.price));
    });
  }

  void searchCars(String value){
    if(value.isEmpty){
      setState(() {
        filteredCars = cars;
      });
    }
    else{
      setState(() {
        filteredCars = cars
            .where((car)=> car.brand.contains(value))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Car project"),
              backgroundColor: Colors.orange,
            ),
            body:Column(
              children: [
                TextButton(onPressed: (){
                  sortCars();
                }, child: Text('Sort')),
                TextField(
                  onChanged: (value){
                    searchCars(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount:cars.length,
                      itemBuilder:(context,i){
                        return CarTile(car: cars[i]);
                      }
                  ),
                ),
              ],
            )
        )
    );
  }
}