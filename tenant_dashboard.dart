import 'package:flutter/material.dart';

class Property {
  String address;
  bool isAvailable;

  Property({required this.address, required this.isAvailable});
}

class TenantDashboard extends StatelessWidget {
  final List<Property> nearbyProperties = [
    Property(address: "House 201", isAvailable: true),
    // Add more properties
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tenant Dashboard'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: [
            PaymentSection(),
            TicketComplaintSection(),
            AvailablePropertiesSection(properties: nearbyProperties),
          ],
        ),
      ),
    );
  }
}

class PaymentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.payment, color: Colors.green),
        title: Text('Make Payment'),
        onTap: () {
          // Navigate to payment screen
        },
      ),
    );
  }
}

class TicketComplaintSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.report_problem, color: Colors.orange),
        title: Text('Report Issue'),
        onTap: () {
          // Navigate to report issue screen
        },
      ),
    );
  }
}

class AvailablePropertiesSection extends StatelessWidget {
  final List<Property> properties;

  AvailablePropertiesSection({required this.properties});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        leading: Icon(Icons.home_work, color: Colors.blue),
        title: Text('Available Properties'),
        children: properties.map((property) {
          return ListTile(
            title: Text(property.address),
            subtitle: Text(property.isAvailable ? 'Available' : 'Not Available'),
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TenantDashboard(),
  ));
}
