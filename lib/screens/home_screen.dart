import 'package:fencing/screens/cubit/geofencig_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GeofencigCubit>(context).startGeofencing();
    return Scaffold(
      body: Center(
        child: BlocBuilder<GeofencigCubit, GeofencigState>(
          builder: (context, state) {
            if (state is GeofencigLoading) {
              return fencingindicator(Colors.blue.shade700);
            }
            if (state is GeofencigInside) {
              return fencingindicator(Colors.green.shade700);
            } else if (state is Geofencigoutside) {
              return fencingindicator(Colors.red.shade700);
            }
            return fencingindicator(Colors.blue.shade700);
          },
        ),
      ),
    );
  }

  CircleAvatar fencingindicator(Color colour) {
    return CircleAvatar(
      backgroundColor: colour,
      radius: 90,
      child: Text(
        'start',
        style: GoogleFonts.sourceSansPro(fontSize: 60, color: Colors.white),
      ),
    );
  }
}
