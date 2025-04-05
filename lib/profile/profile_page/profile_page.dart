import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile "),
      ),
      body: Column(
        children: [
          Center(
              child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                radius: 100,
                child: Icon(
                  Icons.person,
                  size: 200,
                  color: Colors.white38,
                ),
              ),
              CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 150,
                                  child: Column(
                                    children: [
                                      Text("Profile "  , style:  TextStyle(fontSize: 25),),
                                      Divider(),
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment .spaceEvenly,
                                        children: [

                                          Options(title:  "Camera",  icon:  Icons.camera_alt,) ,
                                          Options(title:  "Gallery",  icon:  Icons.image,) ,
                                          Options(title:  "delete",  icon:  Icons.delete,) ,


                                        ],
                                      )
                                    ],
                                  ),
                                ));
                      },
                      icon: Icon(
                        color: Colors.grey,
                        Icons.camera_alt,
                        size: 35,
                      )))
            ],
          ))
        ],
      ),
    );
  }
}






   class Options extends StatelessWidget {


  final String title ;
 final  IconData icon ;

    Colors ? color ;





       Options({ this.color ,  required  this.title , required this.icon ,   super.key});

     @override
     Widget build(BuildContext context) {
       return  Column(
         children: [
           IconButton(
               onPressed: () {},
               icon: Icon(icon   , )),
           Text(title)
         ],
       ) ;
     }
   }









