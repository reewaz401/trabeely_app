import 'package:flutter/material.dart';
import 'package:travel/services/tours_services.dart';
import './tour_item.dart';

class ResultsWidget extends StatelessWidget {
  final String destination;
  ResultsWidget(this.destination);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ToursServices().fetchPacakgeList(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : snapshot.hasData
                ? Expanded(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (ctx, index) {
                          var extData = snapshot.data['packages'][index];
                          return TourItem(
                            agencyName: extData['destination'],
                            date: '2021-08-02 15:30',
                            title: extData['title'],
                            destination: extData['destination'],
                            price: 1500,
                          );
                        }),
                  )
                : Center(
                    child: Text('No data found',
                        style: TextStyle(color: Colors.grey)));
      },
    );
  }

  //SearchFunction
  Future<void> fetchMethod(String type, [String destination]) async {
    if (type == 'Tours') {
      return ToursServices().fetchPacakgeList(destination);
    } else if (type == 'Hotels') {
      // return To().fetchHotelList();
    } else {
      // return ViewServices().fetchRestaurantList();
    }
  }
}
