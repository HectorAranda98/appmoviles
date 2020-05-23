import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trabajoappmoviles/data_file.dart';

import 'package:trabajoappmoviles/post_detail.dart';
import 'package:trabajoappmoviles/post.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();

}
class _PostListState extends State<PostList> {
  Data data= new Data();
  List<Post>_post = List<Post>();

void initState(){
  data.getPost().then((value)=> setState((){
    _post.addAll(value);}));
  super.initState();


}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts",textAlign: TextAlign.center,style: GoogleFonts.bangers(fontSize: 25), ),
        backgroundColor: Colors.purple,
      ),

      body: _post == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _post.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new ListTile(

                      title:new Text(_post[index].title,style: GoogleFonts.poppins(fontSize:18),textAlign: TextAlign.left,),

                      subtitle: new Text("\n${_post[index].body}",style: GoogleFonts.dancingScript(fontSize:14),textAlign: TextAlign.left,),
                      leading: Image.network('https://i1.wp.com/criterionoticias.com/wp-content/uploads/2020/01/78769083-sello-postal-y-bandera-del-grunge-de-m%C3%A9xico-en-el-fondo-blanco.jpg?fit=1300%2C780&ssl=1'),
                      contentPadding: const EdgeInsets.all(10.0),
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Comments(post: _post[index],)));
                      },
                    ),
                    elevation: 2.1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}