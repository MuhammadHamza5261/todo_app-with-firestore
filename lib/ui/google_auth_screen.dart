import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../bloc/google_screen_bloc/google_screen_bloc.dart';
import '../bloc/google_screen_bloc/google_screen_event.dart';
import '../bloc/google_screen_bloc/google_screen_state.dart';
import 'add_page.dart';



class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  State<GoogleScreen> createState() => _GoogleScreenSTFState();
}

class _GoogleScreenSTFState extends State<GoogleScreen> {

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {

   var width = MediaQuery.of(context).size.width;
   var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
            
        ),

      ),
      body: BlocConsumer<GoogleScreenBloc, GoogleScreenState>(
          builder: (context, state) {
            return Container(
              child: Center(
                child: Column(
                  children: [

                    SizedBox(
                      height: height * 0.2,
                    ),
                    Image.asset('assets/images/google.gif'),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      height: height * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0,),
                          ),
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          BlocProvider.of<GoogleScreenBloc>(context).add(
                            GoogleAuthEvent(


                            ),
                          ) ;



                          // googleSignIn.signIn().then((value){
                          //   String? userName = value!.displayName;
                          //   String? profilePicture = value!.photoUrl;
                          // });

                        },
                        child: state is GoogleInProgressState ? const CircularProgressIndicator(color: Colors.white,):
                        const Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 21.0,
                            color: Colors.white
                          ),),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state){
            if(state is GoogleDataIsLoadedState){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  AddPage()),
              );
            }
            else if(state is GoogleIsFailure){
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

