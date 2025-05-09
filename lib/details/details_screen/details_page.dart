import 'package:flutter/material.dart';
import 'package:flutter_for_beginners/profile/profile_page/profile_page.dart';
import 'package:provider/provider.dart';

import '../../add_item/add_item_screen.dart';
import '../../add_item/item_model.dart';
import '../../profile/user_model.dart';
import '../details_widget/details_widget.dart';

class DetailsPage extends StatelessWidget {
  // final String? title;
  //
  // final String? body;
  //
  // final List<File>? image;

  const DetailsPage(
      {
      // this.image, this.title, this.body,
      super.key});

  @override
  Widget build(BuildContext context) {
    final imageProfile = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: imageProfile == null
                  ? Icon(Icons.account_box)
                  : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          imageProfile,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
        ],
        centerTitle: true,
        title: Text("The ${items.selectedItem!.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //  image == null || image!.isEmpty  ?   Image.asset("assets/tree.jpg") :

          Image.file(
            items.selectedItem!.images.first,
            height: 300,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FavoriteWidget( index:  items.items.indexOf(items.selectedItem!) ,),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(textAlign: TextAlign.justify, items.selectedItem!.body
                  // ??
                  // "A tree is a tall plant with a woody stem, branches, and leaves. It plays a vital role in nature by producing oxygen, providing shade, and offering a details to many animals. Trees absorb carbon dioxide and help reduce air pollution. They come in many types, like oak, pine, and mango. Trees also prevent soil erosion and are important for the water cycle. People use trees for wood, paper, and fruit. In cities and forests, trees add beauty and support life. Planting and protecting trees is essential for a healthy environment and a better future for all living things."

                  )),
          // image == null || image!.isEmpty
          //     ? Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     MySeason(url: "assets/tree_spring.jpg", text: "Spring"),
          //     MySeason(url: "assets/tree_fall.jpg", text: "Fall"),
          //   ],
          // )
          //     :

          SizedBox(
            height: 500,
            child: GridView.builder(
                itemCount: items.selectedItem!.images.length - 1,
                itemBuilder: (context, index) => Image.file(
                      items.selectedItem!.images[index + 1],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                )),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
