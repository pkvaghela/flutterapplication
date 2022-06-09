import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:airplane_mode_checker/airplane_mode_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:torch_light/torch_light.dart';
import 'package:wifi_iot/wifi_iot.dart';


class SwitchButtonContainer extends StatelessWidget {
  const SwitchButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SwitchButton Demo",
      debugShowCheckedModeBanner:false,
      home: SwitchButton(),
    );
  }
}

class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isInternetOn = false;
  bool isWifiOn = false;
  bool isBluetoothOn = false;
  bool isTorchOn = false;
  bool isAirOn =false;
  FlutterBlue bluetooth = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
    getAirStatus();
    getBluetoothStatus();
    getNetStatus();
    getWifiStatus();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Switch Button"),
      ),
      body: Material(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text("Internet"),
                trailing: Switch(value: isInternetOn, onChanged: (value) {}),
              ),
              ListTile(
                title: Text("Wifi"),
                trailing: Switch(
                  value: isWifiOn,
                  onChanged: (value) {},
                ),
              ),
              ListTile(
                title: Text("Bluetooth"),
                trailing: Switch(
                  value: isBluetoothOn,
                  onChanged: (value) {
                    setState(() {
                      isBluetoothOn = value;
                    });
                  },

                ),
              ),
              ListTile(
                title: Text("Torch"),
                trailing: Switch(
                  value: isTorchOn,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isTorchOn = value;
                      });
                      onOffTorch();
                    }
                  },

                ),

              ),
              ListTile(
                title: Text("Air mode"),
                trailing: Switch(
                  value: isAirOn,
                  onChanged: (value){
                    setState(() {
                      isAirOn = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> getNetStatus() async {
    var connectivityResult =  Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile){

      setState(() {
        isInternetOn = true;
      });
    }
    else {
      setState(() {
        isInternetOn = true;
      });
    }
  }
  Future<void> onOffTorch() async
  {
    if(isTorchOn==false)
      TorchLight.disableTorch();
    else
      TorchLight.enableTorch();
  }
  void getWifiStatus(){
    WiFiForIoTPlugin.isConnected().then((val){
      setState(() {
        isWifiOn = val;
      });
    });
  }
  Future<void> getBluetoothStatus() async{
    print("getBluetoothStatus method is called");
    setState(() async{
      isBluetoothOn = await bluetooth.isOn;
    });
  }
  Future<void> getAirStatus() async{

    setState(() async {
      var status = await AirplaneModeChecker.checkAirplaneMode();
      if (status == AirplaneModeStatus.on){
        AirplaneModeStatus.on;
      print('on');
    }else {
        AirplaneModeStatus.off;
        print('off');
      }
    });
    }


  }

