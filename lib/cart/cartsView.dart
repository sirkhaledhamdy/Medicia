import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:textmatemd/cart/cubits/cubits.dart';
import 'package:textmatemd/cart/widgets/cartsbody.dart';
import 'package:textmatemd/contactUs/contactUsView.dart';
import 'package:textmatemd/core/shared_helper.dart';
import 'package:textmatemd/editAddresss/ebitAddressView.dart';
import 'package:textmatemd/favourite/widgets/favoriteBody.dart';
import 'package:textmatemd/getStorage.dart';
import 'package:textmatemd/header_icons.dart';
import 'package:textmatemd/location/mapView.dart';
import 'package:textmatemd/login/widgets/signButton.dart';
import 'package:textmatemd/products/products1/cubits/cubits.dart';
import 'package:textmatemd/productsDetails/productsDetailsView.dart';
import 'package:textmatemd/test2_icons.dart';

class CartsView extends StatefulWidget {
  @override
  _CartsViewState createState() => _CartsViewState();
}

class _CartsViewState extends State<CartsView> {
  @override
  Widget build(BuildContext context) {
   int? Sum=0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text("السله",
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(color: Color(0xffbfc2c4), blurRadius: 0)
                      ],
                      color: Colors.white70,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("منطقه الوصيل",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Spacer(),
                              Icon(
                                FontAwesomeIcons.edit,
                                color: Color(0xff0267b4),
                              ),
                              TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff0267b4)),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)
                                    =>EditAddressView()));
                                  },
                                  child: Text("تعديل")),
                            ],
                          ),
                          Text("المنصوره ,الدقهليه, مصر",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Text("الطلبات",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  BlocBuilder(
                    bloc: CartsController.of(context),
                    builder: (context, state) {
                      if(
                           Get.find<Database>().restoreListCarts()==null
                               ||Get.find<Database>().restoreListCarts()!.isEmpty){
                        return Text("لا يوجد عناصر في السله ");

                      }
                      else {
    for( var i =0 ; i < Get.find<Database>().restoreListCarts()!.length;  i++ ) {
       Sum = (Sum! + (Get.find<Database>().restoreListCarts()![i][1]) ) as int? ;
       print("111111111111111111111111111111111111111111");
       print(Sum);
    }

    return Column(
      children: [
    ListView.builder(

    itemCount:  Get.find<Database>().restoreListCarts()!.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>

                      CartsBody(
                      image:  Get.find<Database>().restoreListCarts()![index][2],
                      price:  Get.find<Database>().restoreListCarts()![index][1],
                      name:  Get.find<Database>().restoreListCarts()![index][0],
                      total:  Get.find<Database>().restoreListCarts()![index][1],
                      id:index ,


                      ),



                      ),
        ///////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
       // Text(Sum!.toString()),
        //////////////////////////////////////////////////////
       /////////////////////////////////////////////////////////
                      ],
    );


                      }
                    },
                  ),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(CartsController.of(context).Adds![0][1].toString(),
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black,
                  //         )),
                  //     Spacer(),
                  //     Text(" 470 جنيه",
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.bold,
                  //           color: Color(0xff0267b4),
                  //         )),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BlocBuilder(
        bloc: CartsController.of(context),
  builder: (context, state) {
    return InkWell(
        onTap: (){
          if( Get.find<Database>().restoreListCarts()==null||Get.find<Database>().restoreListCarts()!.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("السله فارغه !!!!!"))
            );

          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView(Sum: Sum!,)));

          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SignButton(
            name: "استمرار",
            c: Color(0xff0c558b),
          ),
        ),
      );
  },
),
    );
  }
}
