
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x_app/RocketList.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {

  late RocketList rocketList;

  RocketDetailsScreen(
  {
    super.key,
    required this.rocketList
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Flight Number => '+rocketList.flight_number.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Mission Name => '+rocketList!.mission_name!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Launch Year => '+rocketList!.launch_year!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Launch Date/Time => '+DateFormat('MM-dd-yyyy / hh:mm').format(DateTime.parse(rocketList!.launch_date_utc!)),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Launch Success => ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Image.asset(
                    rocketList!.launch_success!?'assets/images/check_mark.png':'assets/images/close.png',
                    width: 15,
                    height: 15,
                  )
                ],
              ),
              Text(
                'Launch details => '+rocketList!.details!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(rocketList!.links!.wikipedia!)),
                    child: Text('Wikipedia',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(rocketList!.links!.article_link!)),
                    child: Text('Article',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(rocketList!.links!.video_link!)),
                    child: Text('Video Link',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
