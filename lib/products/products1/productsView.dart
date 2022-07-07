import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:textmatemd/cart/cartsView.dart';
import 'package:textmatemd/favourite/cubits/cubits.dart';
import 'package:textmatemd/header_icons.dart';
import 'package:textmatemd/my_flutter_app_icons.dart';
import 'package:textmatemd/my_flutter_app_iconss.dart';
import 'package:textmatemd/my_icons_icons.dart';
import 'package:textmatemd/products/products1/cubits/cubits.dart';
import 'package:textmatemd/products/products1/states/states.dart';
import 'package:textmatemd/products/products1/widgets/listviewProducts.dart';
import 'package:textmatemd/productsDetails/productsDetailsView.dart';
import 'package:textmatemd/test2_icons.dart';

class ProductsView1 extends StatefulWidget {

  @override
  _ProductsView1State createState() => _ProductsView1State();
}

class _ProductsView1State extends State<ProductsView1> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    Function function;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartsView()));
          }, icon:Icon(Header.cart,color: Colors.grey,size: 38,)),


        ],
        title:Text("ادوية طبيه",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),

        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(
              FontAwesomeIcons.angleRight, size: 25, color: Colors.black,)),
      ),

      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,


          children: [
            Column(
              children: [
                Container(
                  color: Color(0xfdf0f2f3),
                  child: TextField(

                    cursorColor: Colors.indigoAccent,
                    cursorHeight: 25,
                    decoration: InputDecoration(
                        hintText: "ما الذي تبحث عنه",

                        fillColor: Colors.white,

                        border: InputBorder.none,

                        prefixIcon:IconButton(onPressed: (){


                        }, icon:Icon(Icons.search,size: 35,))),
                  ),
                ),
                BlocBuilder(
                  bloc: RealTimeController.of(context),
  builder: (context, state) =>state is ProductsLoading ?CircularProgressIndicator()

    : ListView.builder(
                  itemCount: RealTimeController.of(context).models.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),

                  scrollDirection:Axis.vertical ,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Navigator.push
                        (context, MaterialPageRoute(builder: (context)=>ProductsDetailsView(
                        image: RealTimeController.of(context).imageS[index],
                        name: RealTimeController.of(context).models[index].name!,
                        Price: RealTimeController.of(context).models[index].price!,
                        des:RealTimeController.of(context).models[index].descraption! ,
                      )));

                    },
                    child:  ListViewProducts(
                      image: RealTimeController.of(context).imageS[index],
                      name: RealTimeController.of(context).models[index].name!,
                       price: RealTimeController.of(context).models[index].price!,
                      des: RealTimeController.of(context).models[index].descraption !,
                      id: index,


),
                  ),


),
                ),
              ],
            ) ,

          ] ),
      ),
    );
  }
}
