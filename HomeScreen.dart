
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_project/detailsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final nameTextController = TextEditingController();
  final designationTextController = TextEditingController();
  final salaryTextController = TextEditingController();
  final experienceTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0,),
                    const Icon(Icons.person_pin, size: 100, color: Colors.teal,),
                    const Text('Personal Details', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: nameTextController,
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                        prefixIcon: Icon(Icons.person, color: Colors.teal,)
                      ),
                    ),
                    TextFormField(
                      controller: designationTextController,
                      decoration: InputDecoration(
                          hintText: 'Enter Designation',
                          prefixIcon: Icon(Icons.work, color: Colors.teal,)
                      ),
                    ),
                    TextFormField(
                      controller: salaryTextController,
                      decoration: InputDecoration(
                          hintText: 'Enter Salary',
                          prefixIcon: Icon(Icons.attach_money, color: Colors.teal,)
                      ),
                    ),
                    TextFormField(
                      controller: experienceTextController,
                      decoration: InputDecoration(
                          hintText: 'Work Experience',
                          prefixIcon: Icon(Icons.timer_outlined, color: Colors.teal,)
                      ),
                    ),
                    const SizedBox(height: 30.0,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('name', nameTextController.text);
                          await prefs.setString('designation', designationTextController.text);
                          await prefs.setString('salary', salaryTextController.text);
                          await prefs.setString('experience', experienceTextController.text);

                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailsScreen();
                          }));
                        },
                        child: Text('Save & Navigate')
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
