import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textmatemd/location/states/states.dart';

class SubjectCubit extends Cubit<states> {
  SubjectCubit() : super(intial());

  static SubjectCubit of(context) => BlocProvider.of(context);
  Location location = new Location();
  PermissionStatus? permissions;
  LocationData? locationData;
  LocationData? locationData2;
  LocationData? currentlocation2;
  List<Marker> m = [

  ];

  checkGps() async {
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    emit(looding());
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    permissions = await location.hasPermission();
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    locationData = await location.getLocation();
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    m.add(
        Marker(
          markerId: MarkerId(
              " element.doc.id"
          ),
          position: LatLng(locationData!.latitude!,
              locationData!.longitude!),
        )
    );
    // await  location.onLocationChanged.listen((LocationData currentlocation) {
    //   currentlocation2 = currentlocation;
    //   print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    //   print(currentlocation.longitude.toString() +"sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"+
    //       currentlocation.latitude.toString());
    //   m.add(
    //       Marker(
    //         markerId: MarkerId(
    //             " element.doc.id"
    //         ),
    //         position: LatLng(locationData!.latitude!,
    //             locationData!.longitude!),
    //       )
    //   );
    //   // FirebaseFirestore.instance
    //   //     .collection('users')
    //   //     .doc('xGu6q8TO0R7tg9njjHke')
    //   //     .set({
    //   //   'named': 'Aabdelaleem',
    //   //   'age':'25',
    //   //   'namber':'1',
    //   //   'phone':'0100000000001000',
    //   //   'locations':
    //   //   GeoPoint(currentlocation.longitude!, currentlocation.latitude!),
    //   // });
    // });
    //
    emit(intial());

  }
  fun2()async{
    emit(looding());
    locationData2 = await location.getLocation();
    await FirebaseFirestore.instance.collection('users').snapshots().listen((
        event) {
      event.docChanges.forEach((element) {
        print(element.doc.data().toString()+"aaaaaaaaaaaaaaaaqqqqqqqqqqqqqqqqfffffffffffffffffff");
        print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaaaaaaaaaaaaaaaaqqqqqqqqqqqqqqqqfffffffffffffffffff");
        m.add(
            Marker(
              markerId: MarkerId(
                  " element.doc.id"
              ),
              position: LatLng(locationData2!.latitude!,
                  locationData2!.longitude!),
            )
        );
        print(element.doc['locations'].Latitude.toString()+"<><><><><><><><><>  <> <> <> <> <> <> <>");

      });
    });
    emit(intial());
  }
// fun(){
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//   print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
//   print('ccccccccccccccccccccccccccccccccccccccccccccccc');
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
// }

}

//m.add(
//         Marker(
//           markerId: MarkerId(
//            " element.doc.id"
//           ),
//           position: LatLng(locationData2!.latitude!,locationData2!.longitude!),
//         )
//       );