import 'package:flutter/material.dart';

class Estate {
  String name;
  List<Property> properties;

  Estate({required this.name, required this.properties});
}

class Property {
  String address;
  bool isOccupied;

  Property({required this.address, required this.isOccupied});
}

class LandlordDashboard extends StatelessWidget {
  final List<Estate> estates = [
    Estate(name: "Estate 1", properties: [
      Property(address: "House 101", isOccupied: true),
      Property(address: "House 102", isOccupied: false),
      // Add more properties
    ]),
    // Add more estates
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landlord Dashboard'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: estates.length,
          itemBuilder: (context, index) {
            return EstateCard(estate: estates[index]);
          },
        ),
      ),
      drawer: Drawer(
        // Drawer for Profile and Notifications
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Landlord Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Navigate to Notifications
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Navigate to Profile
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EstateCard extends StatelessWidget {
  final Estate estate;

  EstateCard({required this.estate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(estate.name),
        children: estate.properties.map((property) {
          return ListTile(
            title: Text(property.address),
            subtitle: Text(property.isOccupied ? 'Occupied' : 'Vacant'),
            trailing: property.isOccupied ? Icon(Icons.people, color: Colors.green) : Icon(Icons.cancel, color: Colors.red),
            // Add onTap functionality if needed
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LandlordDashboard(),
  ));
}
