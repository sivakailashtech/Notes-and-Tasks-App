import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/customWidgets.dart';

class SeeNote extends StatefulWidget {
  DocumentSnapshot getDoc;
  SeeNote({this.getDoc});


  @override
  _SeeNoteState createState() => _SeeNoteState();
}

class _SeeNoteState extends State<SeeNote> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController notesEditingController = TextEditingController();


  TextStyle notesTitle(Color color , double size){
    return TextStyle(
      color: color,
      fontSize: 24,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.call_missed_outgoing_rounded),
            onPressed: (){
              if(formKey.currentState.validate()){
                print("Title Name: ${titleEditingController.text}");
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Container(
                  child: TextFormField(
                    autocorrect: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      return value.length==0?"Enter a title":null;
                    },
                    controller:titleEditingController,
                    style: TextStyle(
                        fontFamily: "Merrieather",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                    decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: notesTitle(Colors.grey, 24),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:BorderSide(color: Colors.black,
                            width: 3.5,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: notesEditingController,
                decoration: InputDecoration(
                  hintText: "Content",
                  hintStyle: notesTitle(Colors.white, 20),
                ),
                maxLines:100000,
                style: customStyle(Colors.white, 20, FontWeight.w600, ""),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}