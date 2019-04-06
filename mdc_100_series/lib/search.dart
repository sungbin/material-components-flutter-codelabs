import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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
  List<bool> num_selected_star = List<bool>();

  bool switch_on = true;

  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  double _sliderValue = 0.0;

Widget getStars(int count) { // 
  List<Widget> list = List<Widget>();
  for(int i = 0; i < count; i++)
    list.add(Icon(Icons.star,color: Colors.yellow,size: 12,));
  return Row(
    children: list,
  );
}

List<Widget> drawStars() {
  int true_count = 0;
  List<Widget> val = List<Widget>(); 

  for(int i = 0; i < num_selected_star.length; i++){
    if(num_selected_star[i])
      true_count++;
  }
  int line_count = ((true_count-1) ~/ 2)+1;

  List<Widget> stars_group = List<Widget>();
  for(int i = 0; i < num_selected_star.length; i++){
    if(num_selected_star[i]) {
      stars_group.add(getStars(i+1));
    }
  }
  switch (true_count) {
    case 0:
      val.add(Text('No Seleted'));
      break;
    case 1:
      val.addAll(stars_group);
      break;
    case 2:
      val.add(stars_group[0]);
      val.add(Text('/'));
      val.add(stars_group[1]);
      break;
    case 3:
      val.add(
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                stars_group[0],
                Text('/'),
                stars_group[1],
              ],
            ),
            stars_group[2],
          ],
        )
      );
      break;
    case 4:
      val.add(
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                stars_group[0],
                Text('/'),
                stars_group[1],
              ],
            ),
            Row(
              children: <Widget>[
                stars_group[2],
                Text('/'),
                stars_group[3],
              ],
            ),
          ],
        )
      );
      break;
    case 5:
      val.add(
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                stars_group[0],
                Text('/'),
                stars_group[1],
              ],
            ),
            Row(
              children: <Widget>[
                stars_group[2],
                Text('/'),
                stars_group[3],
              ],
            ),
            stars_group[4],
          ],
        )
      );
      break;
    default:
  }
  

  return val;
}

Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue,

        title: Container(
          width: double.infinity,
          height: 60,
          child: Text('Please check your choice :)',style: TextStyle(color: Colors.white),),
          color: Colors.blue,
        ),
        
        
          // color: Theme.of(context).primaryColor,
        content: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          color: Colors.white,
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Icon(Icons.star,size: 30.0,color: Colors.yellow.shade900,),
                  SizedBox(width: 40.0,),
                  Row(
                    children: drawStars()),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Icon(Icons.calendar_today,color: Theme.of(context).primaryColorLight,), //Calendar
                SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('in ',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                    Text('out',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(width: 24,),
                switch_on? Text('no specific'): Column(
                  children: <Widget>[
                    Text(formatDate(in_selectedDate, [yyyy, '.', mm, '.', dd, ' (', DD,')']) +' ' + formatTime(in_selectedTime) ,style: TextStyle(fontSize: 12.0),),
                    Text(formatDate(out_selectedDate, [yyyy, '.', mm, '.', dd, ' (', DD,')']) +' '+ formatTime(out_selectedTime) ,style: TextStyle(fontSize: 12.0),),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
  DateTime in_selectedDate = DateTime.now();
  Future<Null> in_selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: in_selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != in_selectedDate)
      setState(() {
        in_selectedDate = picked;
      });
  }
  TimeOfDay in_selectedTime =TimeOfDay.now();
  Future<void> in_selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: in_selectedTime,
    );
    if (picked != null && picked != in_selectedTime)
      setState(() {
        in_selectedTime = picked;
      });
  }
  
  DateTime out_selectedDate = DateTime.now();
  Future<Null> out_selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: out_selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != out_selectedDate)
      setState(() {
        out_selectedDate = picked;
      });
  }
  TimeOfDay out_selectedTime =TimeOfDay.now();
  Future<void> out_selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: out_selectedTime,
    );
    if (picked != null && picked != out_selectedTime)
      setState(() {
        out_selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    num_selected_star.add(false);
    num_selected_star.add(false);
    num_selected_star.add(false);
    num_selected_star.add(false);
    num_selected_star.add(false);
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
                        value: num_selected_star[0],
                        onChanged: (bool value) {
                          setState(() {
                            num_selected_star[0] = value;
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
                        value: num_selected_star[1],
                        onChanged: (bool value) {
                          setState(() {
                            num_selected_star[1] = value;
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
                        value: num_selected_star[2],
                        onChanged: (bool value) {
                          setState(() {
                            num_selected_star[2] = value;
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
                        value: num_selected_star[3],
                        onChanged: (bool value) {
                          setState(() {
                            num_selected_star[3] = value;
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
                        value: num_selected_star[4],
                        onChanged: (bool value) {
                          setState(() {
                            num_selected_star[4] = value;
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
              /* Column 2 -> row 2 -> column 2 */
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.calendar_today,color: Colors.pink,),
                                Text('check-in'),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Text(formatDate(in_selectedDate, [yyyy, '.', mm, '.', dd, ' (', DD,')']),style: TextStyle(fontSize: 12,color: Colors.grey),),
                            SizedBox(height: 2,),
                            Text(formatTime(in_selectedTime),style: TextStyle(fontSize: 12,color: Colors.grey),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 150.0,
                              height: 30.0,
                              child: RaisedButton(
                                onPressed: () => switch_on? null : in_selectDate(context),
                                child: Text('select date'),
                                color: Theme.of(context).primaryColorLight,
                              ),
                              buttonColor: Colors.blue,
                            ),
                            
                            ButtonTheme(
                              minWidth: 150.0,
                              height: 30.0,
                              child: RaisedButton(
                                onPressed: () => switch_on? null : in_selectTime(context),
                                child: Text('select time'),
                                color: Theme.of(context).primaryColorLight,
                              ),
                              buttonColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.calendar_today,color: Colors.pink,),
                                Text('check-out'),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Text(formatDate(out_selectedDate, [yyyy, '.', mm, '.', dd, ' (', DD,')']),style: TextStyle(fontSize: 12,color: Colors.grey),),
                            SizedBox(height: 2,),
                            Text(formatTime(out_selectedTime),style: TextStyle(fontSize: 12,color: Colors.grey),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 150.0,
                              height: 30.0,
                              child: RaisedButton(
                                onPressed: () => switch_on? null : out_selectDate(context),
                                child: Text('select date'),
                                color: Theme.of(context).primaryColorLight,
                              ),
                              buttonColor: Colors.blue,
                            ),
                            
                            ButtonTheme(
                              minWidth: 150.0,
                              height: 30.0,
                              child: RaisedButton(
                                onPressed: () => switch_on? null : out_selectTime(context),
                                child: Text('select time'),
                                color: Theme.of(context).primaryColorLight,
                              ),
                              buttonColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 45.0,),
            ],
          )
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
                    Text(_sliderValue.toInt().toString()),
                    SizedBox(height: 40,),
                    RaisedButton(
                      onPressed: () {
                        if(radio1 != -1 && radio2 != -1)
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
  String formatTime(TimeOfDay time) {
    int h = time.hour;
    String am = 'am';
    if(h>=12) {
      h -= 12;
      am = 'pm';
    }
    return h.toString() + ':' + time.minute.toString() + ' ' + am;
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
