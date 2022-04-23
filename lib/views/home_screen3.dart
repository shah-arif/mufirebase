import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mufirebase/views/add_new_course.dart';
import 'package:mufirebase/views/update_course.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  addNewCourse(){
    return showModalBottomSheet(backgroundColor: Colors.transparent,isScrollControlled: true,context: context, builder: (context)=>AddNewCouerse());
  }

  final Stream<QuerySnapshot> _courseStream = FirebaseFirestore.instance.collection('courses').snapshots();

  Future <void> deleteCourse(selectDocument)async{
    return FirebaseFirestore.instance.collection('courses').doc(selectDocument).delete().then((value) => print("course has been deleted")).catchError((error)=>print(error));
  }
  Future <void> updateCourse(selectDocumentId,title,description,img)async{
    return showModalBottomSheet(backgroundColor: Colors.transparent,isScrollControlled: true,context: context, builder: (context)=>UpdateCourse(selectDocumentId,title,description,img));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Courses"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>addNewCourse(), icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _courseStream,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong"));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document){
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Stack(
              children: [
                Container(
                  height: 200,
                  child: Column(
                    children: [
                      Expanded(child: Image.network(data['img'])),
                      Text(data['course_name']),
                      Text(data['course_description']),
                    ],
                  )
                ),
                Positioned(child: Container(
                  child: Row(
                    children: [
                      IconButton(onPressed: ()=>updateCourse(document.id,data['course_name'],data['course_description'],data['img']), icon: Icon(Icons.edit)),
                      IconButton(onPressed: ()=>deleteCourse(document.id), icon: Icon(Icons.remove)),
                    ],
                  ),
                ))
              ],
            );
          }).toList()
        );
          }
      ),
    );
  }
}
