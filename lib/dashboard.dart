import 'package:emi_tracker/customerDisplay.dart';
import 'package:flutter/material.dart';
import 'sales_display.dart';
import 'emi_display.dart';

class Dashbaord extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashbaord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emi-tracker Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Heena Electronics'),
              accountEmail: Text('heena@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
              onTap: () {},
            ),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Customers"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomersDisplay()));
              },
            ),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Sales"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SalesDisplay()));
              },
            ),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Emi"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmiDisplay()));
              },
            ),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      body: SingleChildScrollView(),
    );
  }
}
