
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCouerse extends StatefulWidget {
  const AddNewCouerse({Key? key}) : super(key: key);

  @override
  State<AddNewCouerse> createState() => _AddNewCouerseState();
}

class _AddNewCouerseState extends State<AddNewCouerse> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  XFile? _courseImage;
  String? imageUrl;
  chooseImageFromGallery()async{
    final ImagePicker _picker = ImagePicker();
    _courseImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }
  writeData()async{
    File _imageFile = File(_courseImage!.path);
    FirebaseStorage _storage = FirebaseStorage.instance;
    UploadTask _uploadTask = _storage.ref('images').child(_courseImage!.name).putFile(_imageFile);
    TaskSnapshot snapshot = await _uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
    print(imageUrl);
    CollectionReference _course = FirebaseFirestore.instance.collection('courses');
    _course.add({
      'course_name': _titleController.text,
      'course_description': _descriptionController.text,
      'img': imageUrl
    });
    print("Succesfully added");
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      ),
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Enter course title"
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  hintText: "Enter course description"
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: Container(
              child: Center(
                child: Material(child: _courseImage == null ? IconButton(onPressed: ()=>chooseImageFromGallery(), icon: Icon(Icons.photo)):Image.file(File(_courseImage!.path),fit: BoxFit.cover,)),
              ),
            )),
            ElevatedButton(onPressed: ()=>writeData(), child: Text('Add new course'))
          ],
        ),
      ),
    );
  }
}
