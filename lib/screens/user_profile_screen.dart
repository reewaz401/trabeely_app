import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 0.35 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 0.30 * MediaQuery.of(context).size.height,
                  width: 0.75 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.blue[900]),
                ),
              ),
              Positioned(
                top: 20,
                right: 5,
                child: Container(
                  height: 0.25 * MediaQuery.of(context).size.height,
                  width: 0.70 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black54),
                ),
              ),
              Positioned(
                left: 0,
                top: 40,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 8),
                      borderRadius: BorderRadius.circular(20)),
                  height: 145,
                  width: 145,
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.all(15),
              child: Column(children: [
                Text(
                  'Victoria Robertson',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'A mantra goes here',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ])),
        ]));
  }
}
