
import 'package:flutter/cupertino.dart';
import 'package:space_x_app/RocketList.dart';

class RocketsListUI extends StatelessWidget {

  List<RocketList> list;

  RocketsListUI(
  {
    super.key,
    required this.list
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index)
      {
        return Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Row(
            children: <Widget>[
              Image.network(
                list[index]!.links!.mission_patch_small!,
                width: 50,
                height: 50,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      list[index]!.mission_name!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      list[index]!.launch_year!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

}
