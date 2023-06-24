// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'main.dart';
// import 'package:flutter/material.dart';
// class PractiseScreen extends StatefulWidget {
//   const PractiseScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PractiseScreen> createState() => _PractiseScreenState();
// }
//
// class _PractiseScreenState extends State<PractiseScreen> {
//
//
//   Future createUser({required String name}) async{
//
//     final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
//
//
//
//     final user = User(
//
//       id: docUser.id,
//       name: name,
//       age: 21,
//       birthday: DateTime(2001,7,28),
//     );
//
//     // final user = User {
//     //   id: docUser.id,
//     //
//     //   'name': name,
//     //   'age': 21,
//     //   'birthday': DateTime(2001,7,28),
//     // };
//
//     // create document and write data to firebase
//     await docUser.set(json);
//
//
//   }
//
//
//
//
//
//
//
//   final controller = TextEditingController();
//   late double width;
//   late double height;
//   @override
//   Widget build(BuildContext context) {
//
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: TextFormField(
//           controller: controller,
//         ),
//         actions: [
//           IconButton(
//               onPressed: (){
//                 final name = controller.text;
//                 createUser(name:name);
//               },
//               icon: Icon(Icons.add,color: Colors.white,)
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//           ],
//         ),
//       ),
//     );
//
//
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PractiseScreen extends StatefulWidget {
  const PractiseScreen({Key? key}) : super(key: key);

  @override
  State<PractiseScreen> createState() => _PractiseScreenState();
}

class _PractiseScreenState extends State<PractiseScreen> {
  late double width;
  late double height;

  var name = '';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   title: Text('To-Do_Crud'),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                  width: width * 0.7,
                  child: Image.asset('assets/images/todo.png')),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'My name is $name',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.7,
                height: height * 0.055,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Color.fromRGBO(0, 178, 25, 1),
                    ),
                    onPressed: () {
                      var firestore =
                          FirebaseFirestore.instance.collection('users');

                      var store = firestore.doc('my_doc');
                      store.set({
                        'name': "Muhammad Hamza",
                        'position': "Flutter Developer",
                        'company': "2b vision Technologies",
                      });
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.7,
                height: height * 0.055,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.pinkAccent),
                    onPressed: () {
                      var firestore = FirebaseFirestore.instance
                          .collection('users')
                          .doc('my_doc');
                      firestore.get().then((value) {
                        name = value.data()!['name'];
                        setState(() {});
                      });
                    },
                    child: Text(
                      'Read',
                      style: TextStyle(fontSize: 20.0),
                    )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
          SizedBox(
            width: width * 0.7,
            height: height * 0.055,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.purpleAccent,
              ),

                        onPressed: (){

                       var firestore = FirebaseFirestore.instance.collection('users').doc('my_doc');
                       firestore.update({
                         'name': "Bilal",
                       });

                        },
                        child: Text('Update',style: TextStyle(
                          fontSize: 20.0,
                        ),),
                    ),
          ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.7,
                height: height * 0.055,

                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.grey,
                    ),

                    onPressed: (){
                      var firestore = FirebaseFirestore.instance.collection('users').doc('my_doc');
                      firestore.delete();

                    },
                    child: Text('Delete',style: TextStyle(
                      fontSize: 20.0,
                    ),)
                ),
              ),




            ],
          ),
        ),
        // child: Center(
        //   child: Column(
        //     children: [
        //       const SizedBox(
        //         height: 300,
        //       ),
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //



        //       ElevatedButton(
        //           onPressed: (){
        //
        //           },
        //           child: Text('Delete'),
        //       ),
        //     ],
        //   ),




        // ),




      ),
    );
  }
}
