import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:textmatemd/cart/cartsView.dart';
import 'package:textmatemd/header_icons.dart';
import 'package:textmatemd/my_flutter_app_icons.dart';
import 'package:textmatemd/my_flutter_app_iconss.dart';
import 'package:textmatemd/my_icons_icons.dart';
import 'package:textmatemd/products/products1/widgets/listviewProducts.dart';
import 'package:textmatemd/products/products2/cubits/cubits.dart';
import 'package:textmatemd/products/products2/states/states.dart';
import 'package:textmatemd/products/products2/widgets/listviewProducts.dart';
import 'package:textmatemd/productsDetails/productsDetailsView.dart';
import 'package:textmatemd/test2_icons.dart';

class ProductsView2 extends StatefulWidget {

  @override
  _ProductsView2State createState() => _ProductsView2State();
}

class _ProductsView2State extends State<ProductsView2> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartsView()));
          }, icon:Icon(Header.cart,color: Colors.grey,size: 38,)),


        ],
        title:Text("معدات طبيه",
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
                  //CircularProgressIndicator()
                  BlocBuilder(
                    bloc: RealTimeController2.of(context),
                    builder: (context, state) =>state is ProductsLoading2 ?CircularProgressIndicator()

                      : ListView.builder(
                        itemCount: RealTimeController2.of(context).models.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),

                        scrollDirection:Axis.vertical ,
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            Navigator.push
                              (context, MaterialPageRoute(builder: (context)=>ProductsDetailsView(
                              image: RealTimeController2.of(context).imageS[index],
                              name: RealTimeController2.of(context).models[index].name!,
                              Price: RealTimeController2.of(context).models[index].price!,
                              des:RealTimeController2.of(context).models[index].des! ,
                            )));

                          },
                          child: ListViewProducts2(
                            image: RealTimeController2.of(context).imageS[index],
                            name: RealTimeController2.of(context).models[index].name!,
                            price: RealTimeController2.of(context).models[index].price!,
                            des: RealTimeController2.of(context).models[index].des!,
                          ),
                        ),

                    )
                  )
                ],
              ) ,

            ] ),
      ),
    );
  }
}
