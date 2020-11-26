import 'package:flutter/material.dart';
import 'package:my_blog/pages/blogCard.dart';
import 'package:my_blog/pages/post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> Posts=[
    Post('Moh1',"ceci est la description de l'image",2,'sim.png'),
    Post('TOTO2',"ceci est la description de l'image1",2,'Capture.PNG'),
    Post('TOTO3',"ceci est la description de l'image1",2,'sim.png'),
    Post('TOTO4',"ceci est la description de l'image1",2,'sac.PNG'),
    Post('TOTO 5',"ceci est la description de l'image1",2,'Capture.PNG'),
    Post('TOTO6',"ceci est la description de l'image1",2,'sim.png'),
    Post('MOMO7',"ceci est la description de l'image2",2,'sac.PNG')
  ];

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context).settings.arguments;
    if(post!=null) {
      Posts.add(post);
    }

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Center(
            child: Text('My Blog')
          )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          } ,
          child: Icon(Icons.add),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                   children:
                        Posts.reversed.map((post)=> blogCard(
                            post: post,
                            delete:()=>{
                              setState((){
                              Posts.remove(post);
                            })
                            }
                   )).toList()
            ),
            ]
          ),
        ),
      ),
    );
  }
}
