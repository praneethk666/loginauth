import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginauth/scrrens/Selection.dart';
import 'package:pinput/pin_put/pin_put.dart';
class Authie extends StatefulWidget {
  static const String z ='Authie';
  final String phone;
 // final String codess;
  Authie({required this.phone});


  @override
  _AuthieState createState() => _AuthieState();
}
class _AuthieState extends State<Authie> {
  final GlobalKey<ScaffoldState> _scaffoldkey=GlobalKey<ScaffoldState>();
  final FocusNode _pinFocus= FocusNode();
  //String? smsCode;
  String? vrificationId;
  final TextEditingController _oTp = TextEditingController();
  final BoxDecoration otpDeco = BoxDecoration(
    color:Color(0xff93D2F3),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Color(0xff2E3B62),
    )
  );
  @override
  void initState() {
    verifyPhone();
    // TODO: implement initState
    super.initState();
  }
  verifyPhone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: "${widget.phone}", verificationCompleted: (PhoneAuthCredential credential)async{
      await FirebaseAuth.instance.signInWithCredential(credential).then((value){
        if(value.user!=null)
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Selection()));
        }
      });
    }, verificationFailed: (FirebaseAuthException e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification Failed"),duration: Duration(seconds: 5),));
    }, codeSent: (String vI,int? resendToken){
      setState(() {
        vrificationId = vI;
      });
    },
        codeAutoRetrievalTimeout: (String vI){
      setState(() {
        vrificationId=vI;
      });
        },
      timeout: Duration(seconds: 60),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Verify Phone",
                  style:GoogleFonts.roboto(textStyle:TextStyle(color: Colors.black,
                      fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      verifyPhone();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Code is sent to  ${widget.phone}",style:GoogleFonts.roboto(textStyle:TextStyle(color: Color(0xff6A6C7B),fontSize: 14))),
                    ),
                  ),
                ),
              ),
              //SizedBox(height: ,),
              Padding(padding: EdgeInsets.all(25),
                  child: PinPut(
                    fieldsCount: 6,
                    textStyle: TextStyle(fontSize: 19,color:Colors.black),
                    eachFieldHeight: 55,
                    eachFieldWidth: 40,
                    focusNode: _pinFocus,
                    controller: _oTp,
                      selectedFieldDecoration:otpDeco.copyWith(
                        color: Color(0xff2E3B62),
                      ),

                    submittedFieldDecoration: otpDeco,
                    followingFieldDecoration: otpDeco,
                    pinAnimationType: PinAnimationType.fade,
                    onSubmit: (pin) async{
                      try{
                        await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: vrificationId!, smsCode: pin)).then((value){
                          if(value.user!=null)
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Selection()));
                            }
                        });
                      }
                      catch(e){
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid op"),duration: Duration(seconds: 5),));
                      }
                    }
                  ),
              ),

              Padding(padding: EdgeInsets.only(left: 24,right: 24),
                  child :Material(
                    color: Color(0xff2E3B62),
                    child:MaterialButton(
                        onPressed: (){
                        },
                        minWidth: 355,
                        height: 60,
                        child: Text("VERIFY AND CONTINUE",style: GoogleFonts.roboto(color: Colors.white,fontSize: 18),),
                      ),
                    )
                  ),
            ],
          )
          ),
        ),
      );
  }

  }




