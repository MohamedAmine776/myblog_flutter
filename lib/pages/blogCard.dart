import 'package:flutter/material.dart';
import 'package:my_blog/pages/post.dart';

// ignore: camel_case_types
class blogCard extends StatefulWidget {
  final Post post;
  final Function delete;
  blogCard({this.post,this.delete});

  @override
  _blogCardState createState() => _blogCardState();
}

// ignore: camel_case_types
class _blogCardState extends State<blogCard> {
  bool _isDisable=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
        children: [
          Container(
            child:Image(image: AssetImage('assets/${widget.post.imageUrl}'),
              height: 200.0,
              width: 300,
            )
          ),
          Container(
            child: Text(
                "Author : ${widget.post.name}"
            ),
          ),
          Container(
            child: Text(
              'Description : ${widget.post.description}'
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                color: Colors.white,
                onPressed: _isDisable? (){
                  setState(() {
                    widget.post.like--;
                    _isDisable=false;
                  });
                } : () {
                  setState(() {
                    widget.post.like++;
                    _isDisable=true;
                  });
                },
                icon: Icon(Icons.favorite,
                color:_isDisable?Colors.red:null),
                label: Text("${widget.post.like}"),
              ),
              FlatButton.icon(
                color: Colors.white,
                onPressed:widget.delete ,
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: Text('Delete'),
              )
            ],
          ),
        ],
      )
    );
  }
}
