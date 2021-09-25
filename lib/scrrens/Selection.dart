import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Selection extends StatefulWidget {
  const Selection({Key? key}) : super(key: key);
  static const String w = 'Selection';

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  late int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          //scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 112,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Please select your profile",
                style:
                    GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: FittedBox(
                child: Material(
                  color: Colors.white,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  onChanged: (val) {
                                    setSelectedRadio(val);
                                  },
                                  activeColor: Color(0xff2E3B62),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  "assets/images/Group.png",
                                  //height: 100,
                                  //width: 150,
                                  //fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                children: [
                                  Text("Shipper",
                                      style: GoogleFonts.roboto(
                                        fontSize: 25,fontWeight: FontWeight.w700
                                      )),
                                  Container(
                                    child: Text("Lorem ipsum dolor sit amet consectetur adipiscing",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,fontWeight: FontWeight.w500
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: FittedBox(
                child: Material(
                  color: Colors.white,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                  value: 2,
                                  groupValue: selectedRadio,
                                  onChanged: (val) {
                                    setSelectedRadio(val);
                                  },
                                  activeColor: Color(0xff2E3B62),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  "assets/images/Group2.png",
                                  //height: 100,
                                  //width: 150,
                                  //fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                children: [
                                  Text("Transporter",
                                      style: GoogleFonts.roboto(
                                        fontSize: 25,fontWeight: FontWeight.w700
                                      )),
                                  Container(
                                    child: Text("Lorem ipsum dolor sit amet consectetur adipiscing",
                                        style: GoogleFonts.roboto(
                                          fontSize: 10,fontWeight: FontWeight.w500
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 48,),
            Padding(padding: EdgeInsets.only(left: 25,right: 25),
                child :Material(
                  color: Color(0xff2E3B62),
                  child:MaterialButton(
                    onPressed: (){
                    },
                    minWidth: 355,
                    height: 60,
                    child: Text("CONTINUE",style:GoogleFonts.roboto(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
