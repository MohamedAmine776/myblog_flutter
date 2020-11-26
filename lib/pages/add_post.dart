import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/pages/home.dart';
import 'package:my_blog/pages/post.dart';

class Add_post extends StatefulWidget {
  @override
  _Add_postState createState() => _Add_postState();
}

class _Add_postState extends State<Add_post> {
  final _addForm = GlobalKey<FormState>();
  final _nameController=TextEditingController();
  final _descriptionController=TextEditingController();
  @override
  void dispose() {
    _descriptionController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Post post;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text('Add Post'),
        centerTitle: true,
      ),
      body:Column(
          children: [
           Form(
             key: _addForm,
               child:Column(
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 10.0),
                     child: TextFormField(
                       decoration: InputDecoration(
                         labelText:'Name : ',
                         hintText: 'your name',
                          border: const OutlineInputBorder()
                       ),
                       controller:_nameController,
                       validator: (value){
                         if(value.isEmpty){
                           return 'name should not be empty';
                       }
                         return null;
                       }
                     ),
                   ),
                   SizedBox(height: 8,),
                   Container(
                     child: TextFormField(
                         decoration: InputDecoration(
                             labelText:'Description : ',
                             hintText: 'your description',
                             border: const OutlineInputBorder()
                         ),
                       controller: _descriptionController,
                         validator: (value){
                           if(value.isEmpty){
                             return 'descriptions should not be empty';
                           }
                           return null;
                         }

                     ),
                   ),
                  /* //Image loading
                    Row(
                     children: [
                       Text('Choose an image'),
                       FlatButton(
                           onPressed: (){
                             setState(() {

                             });

                           },
                           child:Text('image....')
                       )
                     ],
                   ),*/
                   Container(
                     margin: EdgeInsets.only(top: 20.0),
                     padding: EdgeInsets.all(10.0),
                     child: RaisedButton(
                       onPressed: (){
                         setState(() {
                           if(_addForm.currentState.validate()){
                             post=Post(_nameController.text,_descriptionController.text,0,'Capture.PNG');
                             print(post.name);
                             //Navigator.of(context).pushReplacementNamed('/',arguments: {'post':post});
                             //Navigator.push(context, MaterialPageRoute(builder: (context) =>Home(),settings: RouteSettings(arguments:post )));
                             Navigator.pushReplacementNamed(context, '/',arguments: post);
                           }
                         });


                         //Navigator.pushNamed(context, '/',arguments: {'post':post});

                       },
                       child:Text('Submit'),
                     ),
                   )
                 ],
               )
           ),
          ],
      ),
    );
  }
}
