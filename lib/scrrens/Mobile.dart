import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginauth/scrrens/Authie.dart';
import 'dart:async';



class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);
  static const String y ='Mobile';
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  int start = 30;
  bool wait = false;
  String buttName = "send";
  TextEditingController pController = TextEditingController();
  String verificationIdFinal="";
  String smsCode = "+91";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 130),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Please enter your mobile number",
                    style:GoogleFonts.roboto(textStyle:TextStyle(color: Colors.black,
                    fontSize: 16,fontWeight: FontWeight.w800),
                    ),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("You’ll receive a 6 digit code to verify next.",style:GoogleFonts.roboto(textStyle:TextStyle(color: Color(0xff6A6C7B),fontSize: 10,
                  ),
                  ),
                  ),
                ),
                SizedBox(height: 30,),

                textField(),
                SizedBox(height: 14),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Didn’t receive the code? Request Again",style: GoogleFonts.roboto(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w500)),
                    TextSpan(text: " 00:$start",style: GoogleFonts.roboto(fontSize: 12,color: Colors.black87,fontWeight: FontWeight.w500)),
                  ],
                ),
                ),
                SizedBox(height: 15,),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                    child :Material(
                      color: Color(0xff2E3B62),
                      child: MaterialButton(
                        onPressed: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Authie(phone: "+91"+pController.text,codess:smsCode)));
                        },
                        minWidth: 355,
                        height: 60,
                        child: Text("CONTINUE",style: GoogleFonts.roboto(color: Colors.white,fontSize: 20),),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          //borderRadius: BorderRadius
        ),
        child: TextFormField(
          controller: pController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Mobile Number",
            hintStyle: GoogleFonts.roboto(color: Color(0xff6A6C7B), fontSize: 15,),
            contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            prefixIcon:
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8,),
              child: Text(" +91  -  ",
                style: GoogleFonts.roboto(color: Colors.black87, fontSize: 15,
                ),
              ),
            ),
            suffixIcon: InkWell(
              onTap: wait ? null : () async {
                startTimer();
                setState(() {
                  start = 30;
                  wait = true;
                  buttName = "Resend";
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(buttName, style: GoogleFonts.roboto(
                    color: wait ? Colors.grey : Colors.black87, fontSize: 15),),
              ),
            ),
          ),
        )
    );
  }


  void startTimer() {
  const onsec = Duration(seconds: 1);
  Timer _timer = Timer.periodic(onsec, (timer) {
  if (start == 0) {
  setState(() {
  timer.cancel();
  wait = false;
  });
  } else {
  setState(() {
  start--;
  });
  }
  });
  }

}

