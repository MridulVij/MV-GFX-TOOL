import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('senstivities_v2.7')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No data available.'),
            );
          }

          // Extract and map the documents into a list of widgets
          final dataWidgets = snapshot.data!.docs.map((document) {
            final data = document.data() as Map<String, dynamic>;
            final itemName = data['contributer_name'];
            final imageUrl = data['banner_img'];

            return ListTile(
              title: Text(itemName ?? "Null"),
              leading: Image.network(imageUrl),
            );
          }).toList();

          return ListView(
            children: dataWidgets,
          );
        },
      ),
    );
  }
}
