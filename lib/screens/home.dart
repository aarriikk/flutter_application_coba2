import 'package:flutter/material.dart';
import 'package:my_app/components/hero.dart';
import 'package:my_app/screens/features/data_analytic.dart';
import 'package:my_app/screens/features/data_history.dart';
import 'package:my_app/screens/features/operate_manual.dart';
import 'package:my_app/screens/menus/bep.dart';
import 'package:my_app/screens/menus/dss.dart';
import 'package:my_app/screens/menus/iot.dart';
import 'package:my_app/screens/menus/kpi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listMenus = [
    {
      'title': 'Decision Support System',
      'image': 'assets/images/AI.jpg',
      'component': const DssPage()
    },
    {
      'title': 'Break Even Point',
      'image': 'assets/images/BEP.jpg',
      'component': const BepPage()
    },
    {
      'title': 'Key Performance Indicator',
      'image': 'assets/images/KPI.jpg',
      'component': const KpiPage()
    },
    {
      'title': 'Internet of Things',
      'image': 'assets/images/IOT.jpg',
      'component': const IotPage()
    },
  ];

  var listFeatures = [
    {
      'title': 'Operate Manual Feature',
      'image': 'assets/images/MANUAL.png',
      'component': const OperateManualPage()
    },
    {
      'title': 'Data Analytics',
      'image': 'assets/images/DATA.png',
      'component': const DataAnalyticPage()
    },
    {
      'title': 'Data History',
      'image': 'assets/images/HISTORY.png',
      'component': const DataHistoryPage()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const HeroComponent(),
              Row(
                children: const [
                  Text('Everything you need to know',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listMenus.map((dynamic menu)=> GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => menu['component'])
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                              color: Colors.grey.withOpacity(0.5)
                            )
                          ],
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage('${(menu as Map<String, dynamic>)['image']}')
                          )
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                              (menu)['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ),
                          ),
                        )
                      ),
                    ),
                  ).toList()
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: const [
                  Text('Feature you need to know',
                    style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                ],
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: listFeatures.map((dynamic menu)=> GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => menu['component'])
                        );
                      } ,
                      child: Container(
                          margin: const EdgeInsets.all(5.0),
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 3),
                                    color: Colors.grey.withOpacity(0.5)
                                )
                              ],
                              image: DecorationImage(
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  image: AssetImage('${(menu as Map<String, dynamic>)['image']}')
                              )
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  (menu)['title'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
                    ).toList()
                ),
              ),
            ],
          )),
    );
  }
}

