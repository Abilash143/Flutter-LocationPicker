import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/l10n.dart'
    as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocationResult _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
        Locale('es', ''),
        Locale('it', ''),
        Locale('ru', ''),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location picker'),
        ),
        body: Builder(builder: (context) {
          return Container(
            color: Colors.blueGrey[50],
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    LocationResult result = await showLocationPicker(
                      context, 'YOUR API KEY',
                      initialCenter: LatLng(31.1975844, 29.9598339),
                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                      myLocationButtonEnabled: true,
                      layersButtonEnabled: true,
                      // countries: ['AE', 'NG']

                      //resultCardAlignment: Alignment.bottomCenter,
                    );
                    print("result = $result");
                    setState(() => _pickedLocation = result);
                  },
                  child: Text('Pick location',
                      style: GoogleFonts.roboto(color: Colors.white)),
                  color: Colors.blue,
                ),
                SizedBox(height: 15),
                Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(_pickedLocation.toString(),
                          style: GoogleFonts.roboto(color: Colors.black), textAlign: TextAlign.center,)),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
