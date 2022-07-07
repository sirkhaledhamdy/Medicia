import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:textmatemd/cart/cubits/cubits.dart';
import 'package:textmatemd/core/shared_helper.dart';
import 'package:textmatemd/favourite/cubits/cubits.dart';
import 'package:textmatemd/favourite/states/states.dart';
import 'package:textmatemd/header_icons.dart';
import 'package:textmatemd/pageView/pageViews.dart';
import 'package:textmatemd/products/products1/cubits/cubits.dart';
import 'package:textmatemd/productsDetails/productsDetailsView.dart';
import 'package:textmatemd/test2_icons.dart';

import '../../getStorage.dart';

class CartsBody extends StatefulWidget {
  CartsBody({
    this.image,
    this.name,
    this.price,
    this.total,
    this.quantity = 1,
    this.id,
  });

  final String? image;
  final String? name;
  final int? total;
  final int? price;
  final int? quantity;
  final int? id;

  _CartsBodyState createState() => _CartsBodyState();
}

class _CartsBodyState extends State<CartsBody> {
  int counter = 1;

  @override
  void initState() {
    counter = widget.quantity!;
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: CartsController.of(context),
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(color: Color(0xffdce9fa), blurRadius: 0)
                                ],
                                //0xfde2eff3
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    widget.image!,
                                    fit: BoxFit.fill,
                                    height: 60,
                                  ))),
                        ),
                        Text("")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name!,
                          style: TextStyle(
                            color: Color(0xF8898B8E),
                          ),
                        ),
                        // Text("ترمومتر للحراره",style:TextStyle(
                        //   color: Color(0x3c424c4e),
                        // ) ,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(" السعر " + (widget.price!).toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),


                          ],
                        ),
                        Row(

                          children: [

                            IconButton(
                                onPressed: () async{
                                  // CartsController.of(context).AddToConter(counter);
                                  // print(CartsController.of(context).counters);
                                  await SharedHelper.setConter(counter);

                                  setState(
                                        () {
                                          counter++;
                                        },
                                  );
                                  // CartsController.of(context).AddToSum(widget.total!*counter);
                                  // print("1111111111111111111111111");
                                },
                                icon: Icon(Icons.add,
                                    color: Color(0xff4781a8))),
                            Text(counter.toString(),
                              style: TextStyle(
                                color: Color(0xff69aad5),
                              ),),
                            IconButton(
                                onPressed:  (counter > 1)
                                    ? () async{
                                await  SharedHelper.setConter(counter);

                                  setState(() {

                                    counter--;
                                  });
                                }
                                    : null,
                                icon: Icon(Icons.remove,
                                    color: Color(0xff4781a8))),
                            IconButton(onPressed: (){
                              Get.find<Database>().restoreListCarts()!.removeAt(widget.id!);
                              Get.find<Database>().storeListCarts(Get.find<Database>().restoreListCarts()!);
                              SharedHelper.setConter(1);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("تم حذف المنتج من السله "))
                              );
                              // Add snackbar here to tell to the user that element has deleted
                            }, icon: Icon(FontAwesomeIcons.trashAlt,
                                color: Color(0xff4781a8)))

                          ],
                        ),

                        Text(" المجموع الكلي " + (widget.total! * counter)
                            .toString(),
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Color(0xff09277f)
                            )),
                      ],
                    ),
                  ],
                )),
            Divider(),
          ],
        );
      },
    );
  }
}
//                  Icon(Test2.group__1,
//                     size: 50,color: Color(0xff0f387d),),
