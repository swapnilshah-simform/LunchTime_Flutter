import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/data/admin_model.dart';
import 'package:lunchtime_frontend/retrofit/admin_api_service.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Map<String, bool?>? values = {
    'Dal Bati': false,
    'Pav Bhaji': false,
    'Chole Bhature': false,
    'Idli Sambhar ': false,
    'Pulav': false,
    'Roti': false,
    'Puri': false,
    'Dal': false,
    'Jeera Rice': false,
    'Dal Fry': false,
    'Rice': false,
    'Khichdi': false,
    'Kadhi': false,
    'Papad': false,
    'Salad': false,
    'Kachori': false,
    'Sandwich Dhokla': false,
    'Fruit Salad': false,
    'Laapsi': false,
    'Sheero': false,
    'Pickle': false,
    'Khandvi': false,
    'Bhakharwadi': false,
    'Spring roll': false,
    'Dhokla': false,
    'Samosa': false,
    'Aloo Sabzi': false,
    'Aloo Mutter Sabzi': false,
    'Mix Veg Sabzi': false,
    'Flower Sabzi': false,
    'Gobi Sabzi': false,
    'Paneer Sabzi': false,
    'Gatta Sabzi': false,
    'Palak Potato Sabzi': false,
    'Gawar Potato Sabzi': false,
    'Tindoda Sabzi': false,
    'Lauki Sabzi': false,
    'Rajma': false,
    'Soyabean': false,
    'Chora': false,
    'Mix Pulses': false,
    'Mug': false,
  };

  var tempArray = [];

  getCheckboxItems() {
    values?.forEach(
      (key, value) {
        if (value == true) {
          tempArray.add(key);
        }
      },
    );
    print(tempArray);

  }

  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 300,
                    minHeight: 100,
                    maxHeight: 150,
                  ),
                  child: const Image(
                      image: AssetImage('assets/images/simform.png')),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Today\'s Lunch time:',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            _time.format(context),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _selectTime,
                        child: const Text(
                          'SELECT TIME',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Select Menu',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.57,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: values!.keys.map((String key) {
                            return CheckboxListTile(
                              title: Text(key),
                              value: values![key],
                              activeColor: const Color(0xFFef5266),
                              checkColor: Colors.white,
                              onChanged: (bool? value) {
                                setState(() => values![key] = value);
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed:()  async {
                      getCheckboxItems();
                      var response = await client.addMenu(AdminModel(menu: tempArray, time: '2022-04-02 '+_time.toString().substring(10,15)));
                      print(response);
                      if(response.response.statusCode == 200){
                        print('Menu added');
                        tempArray.clear();
                      } else if (response.response.statusCode == 404){
                        print('Not found');
                      }

                    }, child: const Text('Submit',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
