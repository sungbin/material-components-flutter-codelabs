import 'package:flutter/material.dart';

class Search extends StatefulWidget {

  @override
  _SearchPage createState() => _SearchPage();
}
class _SearchPage extends State<Search> {
  bool exstatus0 = false;
  bool exstatus1 = false;
  bool exstatus2 = false;
  int radio1 = -1; //Seoul, Bussan, Daegu
  List<String> selected_location = ['Seoul','Bussan','Daegu'];

  int radio2 = -1; //Single, Double, Family
  final List<String> selected_people = ['Single','Double','Family'];
  
  bool location0 = false;
  bool location1 = false;
  bool location2 = false;
  bool location3 = false;
  bool location4 = false;
  bool switch_on = true;

  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  double _sliderValue = 0.0;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2016),
        lastDate: DateTime(2019)
    );
    if(picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date =picked;
      });
    }
  }

Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Please check your choice :)'),
          // color: Theme.of(context).primaryColor,
        content: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Divider(),
            Row(
              children: <Widget>[
                Icon(Icons.location_on,color: Theme.of(context).primaryColorLight,),
                Expanded(
                  child: Text(selected_location[radio1],textAlign: TextAlign.center,),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(Icons.credit_card,color: Theme.of(context).primaryColorLight,),
                Expanded(
                  child: Text(selected_people[radio2],textAlign: TextAlign.center,),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(Icons.star,color: Colors.yellow,),
                Expanded(
                  child: Text(selected_people[radio2],textAlign: TextAlign.center,),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(Icons.credit_card,color: Theme.of(context).primaryColorLight,),
                Expanded(
                  child: Text(selected_people[radio2],textAlign: TextAlign.center,),
                )
              ],
            ),
            Expanded(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                child: Text('Search',style: TextStyle(color: Colors.white),textAlign: TextAlign.left,),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              RaisedButton(
                child: Text('Cancel',style: TextStyle(color: Colors.white),),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ],
            ),
            )
          ],
        ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    // return Text('Hi!');
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: ListView(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              if(index == 0) {
                exstatus0 = (!exstatus0);
              } else if(index == 1) {
                exstatus1 = (!exstatus1);
              } else if(index == 2) {
                exstatus2= (!exstatus2);
              }
            });
          },
          children: <ExpansionPanel>[
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: Text('Location',style: TextStyle(fontSize: 16),),
                  title: Text('select location',textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                );
              },
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Radio(
                        value: 0,
                        groupValue: radio1,
                        onChanged: (seleted) {
                          setState(() {
                            radio1 =seleted;
                          });
                        },
                      ),
                      Text('Seoul'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Radio(
                        value: 1,
                        groupValue: radio1,
                        onChanged: (seleted) {
                          setState(() {
                            radio1 =seleted;
                          });
                        },
                      ),
                      Text('Bussan'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Radio(
                        value: 2,
                        groupValue: radio1,
                        onChanged: (seleted) {
                          setState(() {
                            radio1 =seleted;
                          });
                        },
                      ),
                      Text('Daegu'),
                    ],
                  ),
                ],
              ),
              isExpanded: exstatus0,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: Text('Room',style: TextStyle(fontSize: 16),),
                  title: Text('select room',textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                );
              },
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Radio(
                        value: 0,
                        groupValue: radio2,
                        onChanged: (seleted) {
                          setState(() {
                            radio2 =seleted;
                          });
                        },
                      ),
                      Text('Single'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Radio(
                        value: 1,
                        groupValue: radio2,
                        onChanged: (seleted) {
                          setState(() {
                            radio2 =seleted;
                          });
                        },
                      ),
                      Text('Double'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Radio(
                        value: 2,
                        groupValue: radio2,
                        onChanged: (seleted) {
                          setState(() {
                            radio2 =seleted;
                          });
                        },
                      ),
                      Text('Family'),
                    ],
                  ),
                ],
              ),
              isExpanded: exstatus1,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: Text('Class',style: TextStyle(fontSize: 16),),
                  title: Text('select hotel Classes',textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                );
              },
              
              body: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Checkbox(
                        value: location0,
                        onChanged: (bool value) {
                          setState(() {
                            location0 = value;
                          });
                        },
                      ),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Checkbox(
                        value: location1,
                        onChanged: (bool value) {
                          setState(() {
                            location1 = value;
                          });
                        },
                      ),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Checkbox(
                        value: location2,
                        onChanged: (bool value) {
                          setState(() {
                            location2 = value;
                          });
                        },
                      ),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Checkbox(
                        value: location3,
                        onChanged: (bool value) {
                          setState(() {
                            location3 = value;
                          });
                        },
                      ),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 140.0,
                      ),
                      Checkbox(
                        value: location4,
                        onChanged: (bool value) {
                          setState(() {
                            location4 = value;
                          });
                        },
                      ),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                ],
              ),

              isExpanded: exstatus2,
            ),
          ]
        ),
        Divider(height: 0.5,color: Colors.grey,),
        Container (
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                    children: <Widget>[ 
                      Row(
                        children: <Widget>[
                          Text('Date',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('I don\'t have specific dates yet',style:TextStyle(fontWeight: FontWeight.normal,fontSize: 10,color: Colors.grey),),
                                Switch(value: switch_on, onChanged: (val) { setState(() {
                                  switch_on = val;
                                  });},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ]
                ),
              ),
              Text('Date Selected: ${_date.toString()}'),
              RaisedButton(
                child: Text('Set!'),
                onPressed: (){_selectDate(context);},
              )
            ],
          )
        ),
        Divider(height: 0.5,color: Colors.black,),
        Container (
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Fee',style:TextStyle(fontSize: 16),),
                        ),
                        Expanded(
                          child: Text('up to \$150',style:TextStyle(fontSize: 14),textAlign: TextAlign.end,),
                        )
                      ],
                    ),
                    Slider(
                      activeColor: Theme.of(context).primaryColor,
                      min: 0.0,
                      max: 150.0,
                      onChanged: (newRating) {
                        setState(() => _sliderValue = newRating);
                      },
                      value: _sliderValue,
                    ),
                    SizedBox(height: 40,),
                    RaisedButton(
                      onPressed: () {
                        _neverSatisfied();
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text('Search',style: TextStyle(fontSize: 24),),
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500.0))
                    ),
                  ],
                )
              )
            ]
          )
        )
      ],
    )
        ,
      ),
    );

    
  }
}

/*
Checkbox(
value: location0,
onChanged: (bool value) {
setState(() {
location0 = value;
});
},
),
Text('Seoul'),
*/
