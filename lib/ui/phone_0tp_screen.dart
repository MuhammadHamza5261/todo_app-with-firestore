import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/phone_bloc/phone_screen_bloc.dart';
import '../bloc/phone_bloc/phone_screen_event.dart';
import '../bloc/phone_bloc/phone_screen_state.dart';
import '../first_screen.dart';
import 'add_page.dart';
import 'otp_code_screen.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade200,
      body: PhoneScreenSTF(),
    );
  }
}
///stf
class PhoneScreenSTF extends StatefulWidget {
  const PhoneScreenSTF({Key? key}) : super(key: key);





  @override
  State<PhoneScreenSTF> createState() => _PhoneScreenSTFState();
}

class _PhoneScreenSTFState extends State<PhoneScreenSTF> {




  TextEditingController codeField = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _FormKey = GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
  var  width = MediaQuery.of(context).size.width;
   var  height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocConsumer<PhoneScreenBloc,PhoneScreenState>(
        builder: (context,state){
          // if (state is PhoneDataIsLoadedState) {
          //   return const CircularProgressIndicator();
          // }
          // else if (state is OtpSent) {
          //   return const Text('OTP sent!'); // Show OTP input field
          // }
          return Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,size: 30.0,),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstScreen()));
                      },
                  ),
                  SizedBox(
                    height: height*0.5,
                    child: Image.asset('assets/images/girl2.png',width: 300,),
                  ),
                  const Text('Phone Verification',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'We need to register your phone before getting Started!',
                    style: TextStyle(
                    fontSize: 17.0,
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 17.0,),
                    width: width*0.93,
                    height: height*0.06,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      // onChanged: (value){
                      //   phone = value;
                      //
                      //
                      //
                      // },
                      controller: codeField,
                      cursorColor: const Color.fromRGBO(100,100,100,1),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 17.0,top:10.0,),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(0, 173, 25, 1), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                        ),
                        hintText: 'Phone Number',

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                        }
                      },
                    ),

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.93,
                    height: MediaQuery.of(context).size.height*0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Colors.purple,
                      ),
                      onPressed:() async {

                       if (_formKey.currentState!.validate()) {
                         BlocProvider.of<PhoneScreenBloc>(context).add(
                           PhoneAuthEvent(
                             codeField: codeField.text,
                             context: context
                             // email: _emailController.text,

                           ),
                         );
                       }

                        // await FirebaseAuth.instance.verifyPhoneNumber(
                        //   phoneNumber: codeField.text,
                        //   verificationCompleted: (PhoneAuthCredential credential) {},
                        //   verificationFailed: (FirebaseAuthException e) {},
                        //   codeSent: (String verificationId, int? resendToken) {},
                        //   codeAutoRetrievalTimeout: (String verificationId) {},
                        // );
                      },
                      child: state is PhoneInProgressState? const CircularProgressIndicator(color: Colors.white,)
                      :const Text('Send the code',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(255,255,255,1),
                        ),
                      ),
                    ),
                  ),

                ],


              ),
            ),
          );
        },
            listener: (context,state){
          if (state is OtpSent){

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  VerifyCode()),
                );

             }

          else if(state is PhoneIsFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.errorMessage,
                ),
              ),
            );
          }
      }
      ),
    );
  }
}
