import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../src/Widget/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'testPlaylist.dart';


class ManagerPage extends StatefulWidget {


  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  final values = List.filled(7, false);
  List<String> ex5 = [];

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton(String text) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>testPlaylist()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          '$text',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: '',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'E-',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
            TextSpan(
              text: 'Bouncer',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 40),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    WeekdaySelector(
                      shortWeekdays: ["Sun","Mon","Tur","Wed","Tue","Fri","Sat",],
                      selectedFillColor: Color(0xfff7892b),
                      onChanged: (int day) {
                        setState(() {
                          final index = day % 7;
                          values[index] = !values[index];
                            for(int i=0;i<7;i++){
                              if(i!=index){
                                values[i]=false;
                              }
                            }
                        });
                      },
                      values: values,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Maximum of person  :',
                            style: GoogleFonts.portLligatSans(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              //controller: myController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Maximum of music  :  ',
                            style: GoogleFonts.portLligatSans(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              //controller: myController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'proposition for playlist ',
                              style: GoogleFonts.portLligatSans(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            SelectDialog.showModal<String>(
                              context,
                              label: "Choose a song",
                              multipleSelectedValues: ex5,
                              items: ["David Guetta & Sia - Let's Love","Avicii - Wake Me Up","Ed Sheeran - Shape of You","Beyoncé - Halo"],
                              onMultipleItemsChange: (List<String> selected) {
                                setState(() {
                                  ex5 = selected;
                                });
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                            child: Text(
                              'Choose',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    _submitButton("Confirm"),

                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
