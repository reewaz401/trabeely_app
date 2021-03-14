import 'package:flutter/material.dart';

class StoryFeedItem extends StatefulWidget {
  final String userName;
  final String location;
  final String imageUrl;
  final String description;
  StoryFeedItem(
      {this.userName, this.location, this.imageUrl, this.description});
  @override
  _StoryFeedItemState createState() => _StoryFeedItemState();
}

class _StoryFeedItemState extends State<StoryFeedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 430,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ' at ${widget.location}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.description),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image.network(widget.imageUrl),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton.icon(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.face),
                  label: Text('Amazed')),
              RaisedButton.icon(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.book),
                  label: Text('Ask')),
              RaisedButton.icon(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.location_on),
                  label: Text('Location'))
            ],
          )
        ],
      ),
    );
  }
}
