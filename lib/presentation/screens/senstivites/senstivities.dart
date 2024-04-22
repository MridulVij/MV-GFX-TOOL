import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mv_tool/presentation/screens/senstivites/components/front_card.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map? data;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('senstivities_v2.7')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No data available.'),
              );
            }
            // Extract and map the documents into a list of widgets
            final dataWidgets = snapshot.data!.docs.map((document) {
              final data = document.data() as Map<String, dynamic>;
              final contributerName = data['contributer_name'];
              final imageUrl = data['banner_img'];
              final sensi_code = data['sensi_code'];
              final List<String> list = data['img_1'] ?? "";

              return FrontCard(
                  list: list,
                  sensi_code: sensi_code,
                  imageUrl: imageUrl ??
                      "https://img.freepik.com/premium-vector/window-operating-system-error-warning-dialog-window-popup-message-with-system-failure-flat-design_812892-54.jpg",
                  contributerName: contributerName);
            }).toList();

            return ListView(
              children: dataWidgets,
            );
          }),
    );
  }
}
