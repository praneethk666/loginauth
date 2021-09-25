import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loginauth/scrrens/Mobile.dart';
import 'package:google_fonts/google_fonts.dart';
class Welcome extends StatefulWidget {
  static const String x ='Welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String langChoose="English";
  var lang = ["English","hindi","Telugu"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //maintainBottomViewPadding: true,
        //bottom: false,
        child: Container(
          child:Column(
            children: <Widget>[
              SizedBox(height:130,),
              //Spacer(flex: 1,),
              Container(
                child:
                Image.asset("assets/images/image.png"),
              ),
                  SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text("Please Select your language",style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w800,
                        fontSize: 19,
                      ),)
                      ),
                  ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text("You can change the language at any time",style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 12,
                  ),),
                ),
              SizedBox(height: 10,),
              Padding(padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.only(left: 50,right: 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1.5),
                  ),
                  child: DropdownButton(items: lang.map((valueN){
                    return DropdownMenuItem(
                      value: valueN,
                      child: Text(valueN),
                    );
                  }).toList(),
                    value: langChoose,
                    onChanged:(String? newValue){
                    setState(() {
                      langChoose=newValue.toString();
                    });
                    },
                    iconEnabledColor: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    iconSize: 35,
                    isExpanded: false,

                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(15),
                child :Material(
                  color: Color(0xff2E3B62),
                child: MaterialButton(
                    onPressed: (){
                  Navigator.pushNamed(context, Mobile.y);
                },
                  minWidth: 195,
                  height: 53,
                  child: Text("NEXT",style: GoogleFonts.roboto(color: Colors.white,fontSize: 20),),
                ),
              )
              ),
             Spacer(flex: 2,),
             Image.asset("assets/images/vector.png"),
            ],
          ),
        ),
      ),
    );
  }
}
