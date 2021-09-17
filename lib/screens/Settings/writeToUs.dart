import 'package:flutter/material.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/screens/CreateTour/widgets.dart';

class WriteToUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading('Appreciate your FeedBack'),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write Your Message',
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
