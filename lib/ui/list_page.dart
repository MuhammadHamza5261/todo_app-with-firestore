import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/list_page_bloc/list_page_bloc.dart';
import '../models/employee.dart';
import '../services/firebase_crud.dart';
import 'add_page.dart';
import 'edit_page.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {

  late MyBloc myBloc;

  @override
  void initState() {
    super.initState();
    myBloc = Provider.of<MyBloc>(context, listen: false);
    myBloc.fetchData();
  }












  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readEmployee();
  //FirebaseFirestore.instance.collection('Employee').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("List of Employee"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.app_registration,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => AddPage(),
                ),
                    (route) =>
                false, //if you want to disable back feature set to false
              );
            },
          )
        ],
      ),
      body: // myBloc.isLoading ? Center(child: CircularProgressIndicator(),):
      StreamBuilder<bool>(
        stream: myBloc.isLoadingStream, // Replace with your BLoC's loading stream
        initialData: true, // Set initial value of isLoading to true
        builder: (context, snapshot) {
          if (snapshot.data!) {
            return   StreamBuilder(
              stream: collectionReference,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView(
                      children: snapshot.data!.docs.map((e) {
                        return Card(
                            child: Column(children: [
                              ListTile(
                                // title: Text(e["employee_name"]),
                                subtitle: Container(
                                  child: (Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Position: " + e['position'],
                                          style: const TextStyle(fontSize: 14)),
                                      Text("Contact Number: " + e['contact_no'],
                                          style: const TextStyle(fontSize: 12)),
                                    ],
                                  )),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(5.0),
                                      primary: const Color.fromARGB(255, 143, 133, 226),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    child: const Text('Edit'),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) => EditPage(
                                            employee: Employee(
                                                 uid: e.id,
                                                // employeename: e["employee_name"],
                                                position: e["position"],
                                                contactno: e["contact_no"]),
                                          ),
                                        ),
                                            (route) =>
                                        false, //if you want to disable back feature set to false
                                      );
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(5.0),
                                      primary: const Color.fromARGB(255, 143, 133, 226),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    child: const Text('Delete'),
                                    onPressed: () async {
                                      var response =
                                      await FirebaseCrud.deleteEmployee(docId: e.id);
                                      if (response.code != 200) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content:
                                                Text(response.message.toString()),
                                              );
                                            });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ]));
                      }).toList(),
                    ),
                  );
                }

                return Container();
              },
            );
          }
          else {
            return Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          }
        },
      ),
    );






  }
}