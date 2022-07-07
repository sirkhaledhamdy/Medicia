import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:textmatemd/addressDetails/addressDetailsView.dart';
import 'package:textmatemd/header_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:textmatemd/location/cubits/cubits.dart';
import 'package:textmatemd/location/states/states.dart';
import 'package:textmatemd/login/widgets/signButton.dart';


class MapView extends StatefulWidget {
  MapView({this.Sum});
 late final  int? Sum;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("مكان التوصيل ",
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
        child: BlocBuilder(
            bloc:SubjectCubit.of(context),
            builder: (context, state) =>state is looding ?Center(child: CircularProgressIndicator())
                :Container(
              // height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 16,

                target: LatLng(SubjectCubit.of(context).locationData!.latitude!,
                    SubjectCubit.of(context).locationData!.longitude!),
              ),
              markers: SubjectCubit.of(context).m.toSet(),
            ),
                )

        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressDetailsView(
              Sum: widget.Sum!,
            )));

          },
          child: SignButton(
            name:"حفظ العنوان" ,
            c:Color(0xff0c558b) ,
          ),
        ),
      ) ,

    );
  }
}
