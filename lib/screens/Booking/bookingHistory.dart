import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            historyCard(width),
            historyCard(width),
            historyCard(width),
            historyCard(width),
            historyCard(width),
            historyCard(width)
          ],
        ),
      ),
    );
  }
}

Widget historyCard(width) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      children: [
        Card(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(5.0),
            width: double.infinity,
            height: 100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.22,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.48,
                      padding: EdgeInsets.only(right: 8),
                      child: Column(
                        children: [
                          Text(
                            'Chabahil Tour And Travel Limiteds ',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Jan 21-Jan 25')
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.22,
                      padding: EdgeInsets.only(right: 5.0),
                      child: Column(
                        children: [
                          Text(
                            'Rs : 7777',
                            style: TextStyle(color: Colors.green),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('''Completed
     False''')
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
