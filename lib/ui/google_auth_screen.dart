import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_app/main.dart';
import 'package:flutter/material.dart';

import '../bloc/google_screen_bloc/google_screen_bloc.dart';
import '../bloc/google_screen_bloc/google_screen_event.dart';
import '../bloc/google_screen_bloc/google_screen_state.dart';
import '../first_screen.dart';
import 'add_page.dart';

class GoogleScreen extends StatelessWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: GoogleScreenSTF(),
    );
  }
}

class GoogleScreenSTF extends StatefulWidget {
  const GoogleScreenSTF({Key? key}) : super(key: key);

  @override
  State<GoogleScreenSTF> createState() => _GoogleScreenSTFState();
}

class _GoogleScreenSTFState extends State<GoogleScreenSTF> {

  final GoogleSignIn googleSignIn = GoogleSignIn();


  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;

    return SafeArea(
        child: BlocConsumer<GoogleScreenBloc, GoogleScreenState>(
            builder: (context, state) {
              return Container(
                child: Center(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back, size: 30.0, color: Colors.white,),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (
                                  context) => const FirstScreen()));
                        },
                      ),
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
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 21.0,
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

    ),);
  }
}

