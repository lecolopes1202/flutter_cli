import 'package:flutter/material.dart';
import 'Screens/employeeDrawer.dart';
import 'package:Employee_Management/Screens/mapsPage.dart'; //addei
import 'package:provider/provider.dart'; //addei

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HostsManagement',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: employeeDrawer(),//employeeDrawer() ou mapsPage()
    );
  }
}
