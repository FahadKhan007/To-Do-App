import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/home_screen.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _priority = 'Low';

  DateTime _date = DateTime.now();

  String btnText = "Add Task";
  String titleText = "Add Title";

  TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[100],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Mordred',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Mordred',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: const TextStyle(
                            // color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Mordred',
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        controller: _dateController,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Mordred',
                        ),
                        onTap: _handleDatePicker,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Mordred',
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: DropdownButtonFormField(
                        items: _priorities.map((String priority) {
                          return DropdownMenuItem(
                            value: priority,
                            child: Text(
                              priority,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontFamily: 'Mordred'),
                            ),
                          );
                        }).toList(),
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Priority',
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Mordred',
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: _priority,
                        onChanged: (String? value) {
                          setState(() {
                            _priority = value.toString();
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 60.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lime),
                        ),
                        onPressed: () {},
                        child: Text(
                          btnText,
                          style: TextStyle(
                            color: Colors.lime[100],
                            fontSize: 20,
                            fontFamily: 'Mordred',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
