import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/earth.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 40.0,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )),
                Container(
                  padding: EdgeInsets.only(left: 80.0, top: 80.0),
                  width: double.infinity,
                  child: TextField(
                    onChanged: (value) {
                      cityName = value;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w100,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    decoration: ktextfeildinput,
                  ),
                ),
                SizedBox(
                  child: Divider(
                    thickness: 0.5,
                    height: 50.0,
                    color: Colors.white,
                    indent: 50.0,
                    endIndent: 50.0,
                  ),
                  height: 20.0,
                ),
                Container(
                  child: FlatButton(
                    hoverColor: Colors.black12,
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
