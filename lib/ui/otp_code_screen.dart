import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/otp_screen_bloc/otp_screen_bloc.dart';
import 'package:todo_list_app/bloc/otp_screen_bloc/otp_screen_event.dart';
import 'package:todo_list_app/bloc/otp_screen_bloc/otp_screen_state.dart';
import 'package:todo_list_app/config/custom_button.dart';
import 'package:todo_list_app/ui/add_page.dart';
import '../first_screen.dart';



//stf
class VerifyCode extends StatefulWidget {
  //static variable can be accessed for class name and his value will be same
  static String verify="";


  const VerifyCode({Key? key}) : super(key: key);

  @override
  State<VerifyCode> createState() => _verifycodeState();
}

class _verifycodeState extends State<VerifyCode> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late double width;
  late double height;

  var otpController = List.generate(6, (index) => TextEditingController());

  ///variables
  var isOtpSent = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var code = "";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Check otp'),
        centerTitle: true,
      ),
      body: BlocConsumer<OtpScreenBloc,OtpScreenState>(
          builder: (context,state){
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/girl2.png',width: 300,),
                //2nd row text
                const Text('Verify',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(20,20,20,1),
                  ),
                ),
               SizedBox(
                 height: 10,
               ),
               const  Text('Enter the 6-digit verification code we sent to your email',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(100,100,100,1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                ///5th row verification code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:List.generate(6, (index) => SizedBox(
                        width: 48,
                        height: 48,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: otpController[index],
                          cursorColor: Colors.black54,
                          onChanged: (value){

                            code = code+value;

                            if(value.length == 1 && index <=5){
                              FocusScope.of(context).nextFocus();
                            }
                            else if(value.isEmpty && index >1){
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(100,100,100,1),
                          ),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            // contentPadding: EdgeInsets.only(left: 10.0,right: 10.0,),
                            isDense: true,


                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(),
                              borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1)),),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color:Color.fromRGBO(100,100,100,1))
                            ),
                            // hintText: "*",
                          ),
                        ),
                      ),
                      ),
                    ),
                  ),
                ),
                ///Confirm password btn
                // SizedBox(
                //   width: width*0.93,
                //   height: height*0.053,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       primary: Colors.purple,
                //     ),
                //     onPressed: () async{
                //
                //       BlocProvider.of<OtpScreenBloc>(context).add(
                //         OtpScreenEvent(
                //           code: code,
                //           verify: verifycodeSTF.verify,
                //         ),
                //       );
                //
                //
                //       // PhoneAuthCredential credential = PhoneAuthProvider.credential(
                //       //     verificationId: PhoneScreenSTF.verify,
                //       //     smsCode: code,
                //       // );
                //       // await  auth.signInWithCredential(credential);
                //     },
                //
                //     child: state is OtpDataIsLoadedState ?  const CircularProgressIndicator(color: Colors.white,): const Text('Confirm',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: 14.0,
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                //
                // ),
                ///new confirm btn
                CustomButton(

                  width: width*0.9,
                    height: height*0.065,
                    onPressed: () async{
                      BlocProvider.of<OtpScreenBloc>(context).add(
                        OtpScreenEvent(
                          code: code,
                          verify: verifycodeSTF.verify,
                        ),
                      );
                    },
                    text: 'Confirm',
                    color: Colors.purple.shade200,
                  isLoading: state is OtpDataIsLoadedState,


                ),
                ///last text
                const SizedBox(
                  height: 16.0,
                ),
                 Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Didn\'t receive a code? ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(20,20,20,1,

                              ),
                              fontSize: 14.0,
                            )
                        ),
                        TextSpan(
                          text: 'Resend Code',
                          style: TextStyle(
                            color: Colors.purple.shade200,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          listener: (context,state){

            if(state is OtpVerifiedState){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  AddPage()),

              );
            }
            else if(state is OtpIsFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage,),
                ),
              );
            }
          }
      ),

    );
  }
}
///stf
class verifycodeSTF extends StatefulWidget {
  //static variable can be accessed for class name and his value will be same
  static String verify="";

  const verifycodeSTF({Key? key}) : super(key: key);

  @override
  State<verifycodeSTF> createState() => _verifycodeSTFState();
}

class _verifycodeSTFState extends State<verifycodeSTF> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  late double width;
  late double height;

  var otpController = List.generate(6, (index) => TextEditingController());

  ///variables
  var isOtpSent = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    var code = "";






    return SafeArea(
      child: BlocConsumer<OtpScreenBloc,OtpScreenState>(
        builder: (context,state){
          return  Column(
            children: [
              ///Arrow icon
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FirstScreen()));
                      },
                      icon:const Icon( Icons.arrow_back_outlined,size: 25.0,color: Color.fromRGBO(52,107,33,1), ),
                    ),
                  ),
                ],
              ),
              ///2nd row text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 17.0,left:15.0,),
                    child: const Text('Verify',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(20,20,20,1)
                      ),
                    ),
                  ),
                ],
              ),
              ///3rd row Text
              const SizedBox(
                height: 56.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16.0,right: 16.0,),
                child: const Row(
                  children: [
                    Text('Enter the 6-digit verification code we sent to your email',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(100,100,100,1),
                      ),
                    ),
                  ],
                ),
              ),
              ///4th row text
              const SizedBox(
                height: 2.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16.0,right: 16.0,),
                child: const Row(
                  children: [
                    Text('address.',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(100,100,100,1),
                      ),
                    ),
                  ],
                ),
              ),
              ///5th row verification code
              SizedBox(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:List.generate(6, (index) => SizedBox(
                    width: 48,
                    height: 48,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: otpController[index],
                      cursorColor: Colors.black54,
                      onChanged: (value){

                        code = code+value;

                        if(value.length == 1 && index <=5){
                          FocusScope.of(context).nextFocus();
                        }
                        else if(value.isEmpty && index >1){
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      style: const TextStyle(
                        color: Color.fromRGBO(100,100,100,1),
                      ),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        // contentPadding: EdgeInsets.only(left: 10.0,right: 10.0,),
                        isDense: true,


                        border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(),
                          borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1)),),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color:Color.fromRGBO(100,100,100,1))
                        ),
                        // hintText: "*",
                      ),
                    ),
                  ),
                  ),
                ),
              ),
              ///Confirm password btn
              SizedBox(
                width: width*0.93,
                height: height*0.053,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () async{

                    BlocProvider.of<OtpScreenBloc>(context).add(
                      OtpScreenEvent(
                          code: code,
                          verify: verifycodeSTF.verify,
                      ),
                    );


                    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    //     verificationId: PhoneScreenSTF.verify,
                    //     smsCode: code,
                    // );
                    // await  auth.signInWithCredential(credential);
                  },

                  child: state is OtpDataIsLoadedState ?  const CircularProgressIndicator(color: Colors.white,): const Text('Confirm',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),

              ),
              ///last text
              const SizedBox(
                height: 16.0,
              ),
              const Center(
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [

                          TextSpan(text: 'Didn\'t receive a code?',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(20,20,20,1,

                                ),
                                fontSize: 17.0,
                              )
                          ),
                          TextSpan(
                            text: 'Resend Code',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
          },
            listener: (context,state){

          if(state is OtpVerifiedState){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  AddPage()),

            );
          }
          else if(state is OtpIsFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage,),
              ),
            );
          }
        }
      ),

    );
  }
}
