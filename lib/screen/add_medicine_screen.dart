import 'package:al_lover_mer/Themes/colors.dart';
import 'package:al_lover_mer/widget/input_decoration.dart';
import 'package:flutter/material.dart';

class addMedicineScreen extends StatefulWidget {
  const addMedicineScreen({super.key});

  @override
  State<addMedicineScreen> createState() => _addMedicineScreenState();
}

class _addMedicineScreenState extends State<addMedicineScreen> {
  String? medicine ,dose;
  final formKey = GlobalKey<FormState>();
  DateTime setDate = DateTime.now();
  TimeOfDay time  =TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[ Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
                child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Container(
                          width: 350,
                          height: 730,
                          decoration: BoxDecoration(
                            color: kColorGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text('เพิ่มยาประจำตัว',style: TextStyle(fontFamily: 'TH-Chara',fontSize: 30)),
                              SizedBox(height: 10,),
                              AddMedicine(),
                              SizedBox(height: 10,),
                              AddDose(),
                              Text('${time.hour}:${time.minute}',style: TextStyle(fontFamily: 'TH-Chara',fontSize: 30),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async{
                                  TimeOfDay? Newtime = await showTimePicker(context: context, initialTime: time);
                                  if (Newtime == null) return;
        
                                  setState(() => time = Newtime);
                                } ,
                                child: Text('เลือกเวลา',style: TextStyle(fontFamily: 'TH-Chara',fontSize: 20),))
                            ],
                          ),
                          ),
                    )),
          ),
           Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: BackButton())),
          ]
        ),
      ),
    );
  }

  Widget AddMedicine() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'ชื่อยา'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณายา";
            }
            return null;
          },
          onChanged: (value) {
            medicine = value;
          },
        ));
  }
  Widget AddDose() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          decoration: InputDecorationWidget(context,'จำนวนเม็ด'),
          validator: (value) {
            if (value!.isEmpty) {
              return "กรุณากรอกจำนวนเม็ด";
            }
            return null;
          },
          onChanged: (value) {
            dose = value;
          },
        ));
  }

  
  Widget BackButton() => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(Icons.arrow_back),
    );
}