import 'package:flutter/material.dart';
import '../src/Widget/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceuilPage extends StatefulWidget {

  AcceuilPage({required this.par});

  String par;

  @override
  _AcceuilPageState createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {

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
    return Container(
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
                widget.par=="a1"||widget.par=="n1"||widget.par=="A1"||widget.par=="N1"?Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Accepted',
                      style: GoogleFonts.portLligatSans(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )):widget.par=="a2"||widget.par=="A2"||widget.par=="N2"||widget.par=="n2"?Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Rejected',
                        style: GoogleFonts.portLligatSans(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    )):Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Rejected',
                        style: GoogleFonts.portLligatSans(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: widget.par.contains('a')||widget.par.contains('A')?'AGE : XX':'PREDICTED AGE : XX',
                          style: GoogleFonts.portLligatSans(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: widget.par.contains('a')||widget.par.contains('A')?'GENDER : XX':'PREDICTED GENDER: XX',
                        style: GoogleFonts.portLligatSans(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    widget.par=="a2"||widget.par=="A2"||widget.par=="n2"||widget.par=="N2"?RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Sorry !You’re not allowed to enter due to the critaeria  this day, you can come x day',
                        style: GoogleFonts.portLligatSans(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ):widget.par=="a3"||widget.par=="A3"||widget.par=="n3"||widget.par=="N3"?RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Sorry !You’re not allowed to enter !the maximum number of people is reached',
                        style: GoogleFonts.portLligatSans(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ):Container(),
                    SizedBox(height: 30,),
                    widget.par=="n1"||widget.par=="N1"||widget.par=="n2"||widget.par=="N2"?_submitButton('I am not agree with those prediction'):widget.par=="n3"||widget.par=="N3"?_submitButton("Help us to improve our application"):Container(),
                    SizedBox(height: 20,),
                    widget.par=="a1"||widget.par=="n1"||widget.par=="A1"||widget.par=="N1"?_submitButton("I JUST WANT TO ENTER"):_submitButton("SEE YOU"),
                    SizedBox(height: 20,),
                    widget.par=="a1"||widget.par=="n1"||widget.par=="A1"||widget.par=="N1"?_submitButton("Help us to improve our application"): Container(),
                    SizedBox(height: 20,),
                    widget.par=="a1"||widget.par=="n1"||widget.par=="A1"||widget.par=="N1"?_submitButton("Advice some music"):Container(),
                    SizedBox(height: 20,),
                    SizedBox(height: height * .14),

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
