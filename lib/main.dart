import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Finder UI',
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchResultsScreen()));
              },
              child: CustomSignUpCard(
                title: 'I AM LOOKING FOR A TEACHER',
                backgroundColor: Colors.greenAccent.shade400,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchResultsScreen()));
              },
              child: CustomSignUpCard(
                title: 'I AM A TEACHER',
                backgroundColor: Colors.greenAccent.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSignUpCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  CustomSignUpCard({required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Search Results'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4, // Show 4 example users
        itemBuilder: (context, index) {
          return CustomCard(
            name: index % 2 == 0 ? 'Elizabeth Olsen' : 'John Doe',
            price: '90.0 ৳/hr',
            distance: '0.${index}0 km',
            completedJobs: '50%',
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String name;
  final String price;
  final String distance;
  final String completedJobs;

  CustomCard({
    required this.name,
    required this.price,
    required this.distance,
    required this.completedJobs,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            name[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Completed Jobs: $completedJobs'),
            Text('Distance: $distance'),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {},
          child: Text(
            'Hire',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
