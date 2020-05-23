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
//aqui manda a llamar la lista de los post para que pueda ser mostrada
void initState(){
  data.getPost().then((value)=> setState((){
    _post.addAll(value);}));
  super.initState();

}
//el metodo de arriba toma la informacion del archivo data_file para poderlo mostrar en la app



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts",textAlign: TextAlign.center,style: GoogleFonts.bangers(fontSize: 25), ),
        backgroundColor: Colors.purple,
      ),

      body: _post == null
          ? Center(
        child: CircularProgressIndicator(),//Si es que marca null que marque una ruedita girando hasta que cargue la app
      )
          : ListView.builder( //lsitar todo el contenido
        itemCount: _post.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new ListTile(

                      title:new Text(_post[index].title,style: GoogleFonts.poppins(fontSize:18),textAlign: TextAlign.left,),//mandar a llamar el titulo del post

                      subtitle: new Text("\n${_post[index].body}",style: GoogleFonts.dancingScript(fontSize:14),textAlign: TextAlign.left,), //manda a llamar el cuerpo del post
                      leading: Image.network('https://i1.wp.com/criterionoticias.com/wp-content/uploads/2020/01/78769083-sello-postal-y-bandera-del-grunge-de-m%C3%A9xico-en-el-fondo-blanco.jpg?fit=1300%2C780&ssl=1'),
                      contentPadding: const EdgeInsets.all(10.0),
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Comments(post: _post[index],)));// este sirve para cuando se pulse se mande a los comntarios
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