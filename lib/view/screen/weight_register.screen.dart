import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/repository/data_provider.dart';
import 'package:weight_tracker/service/data_service.dart';

class WeightRegister extends StatelessWidget {
  static const routeName = "weight_register";
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (!isNumeric(value)) {
                    return 'Please enter weight';
                  }
                  return null;
                },
                controller: nameController,
                decoration:
                    InputDecoration(hintText: 'Enter Current Weight in kg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (nameController.value != null) {
                      DataService.instance.insertWeight(
                          double.parse(nameController.value.text));
                      Provider.of<DataProvider>(context, listen: false)
                          .fetchAndSetData();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Saving Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
