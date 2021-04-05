import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 4: Notification',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex != 0 ? Colors.grey : null),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business,
                color: _selectedIndex != 1 ? Colors.grey : null),
            label: 'Business',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school,
                color: _selectedIndex != 2 ? Colors.grey : null),
            label: 'School',
            //backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                color: _selectedIndex != 3 ? Colors.grey : null),
            label: 'Settings',
            //backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                color: _selectedIndex != 4 ? Colors.grey : null),
            label: 'Notification',
            //backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownvalue = "Software Engineering";

  final _formkey1 = GlobalKey<FormState>();
  String _email = "rsaw409@gmail.com";
  String _currentLocation = "Kolkata West Bengal";
  String _dobDate = "14";
  String _dobMonth = "05";
  String _dobYear = "1997";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Column(
          children: [
            // 1st container
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.blue[600],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15.0, bottom: 15),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Disabled for demo purpose',
                                    ),
                                  ),
                                );
                              },
                              icon:
                                  Icon(Icons.arrow_back, color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Disabled for demo purpose',
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Sign out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      minVerticalPadding: 10,
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('asset/images/Rohit.jpg'),
                      ),
                      title: Text(
                        "Rohit Saw",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Target Industry: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.blue.shade600,
                            ),
                            child: DropdownButton<String>(
                              value: dropdownvalue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.blue[600],
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                              items: [
                                "Software Engineering",
                                "DevOps",
                                "Cloud Engineering"
                              ]
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 20),
                      child: Stack(
                        children: [
                          LinearProgressIndicator(
                            value: 0,
                            minHeight: 10,
                            backgroundColor: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3, top: 2, bottom: 3, right: 3),
                            child: LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 6,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 5),
                      child: Text(
                        "60% profile compledted",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2nd Container
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                color: Colors.white54,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Personal",
                                      style: TextStyle(
                                        color: Colors.blue[600],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                padding: EdgeInsets.only(
                                                    top: 8, left: 8, right: 8),
                                                child: Form(
                                                  key: _formkey1,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[600],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  right: 20,
                                                                  top: 8,
                                                                  bottom: 8),
                                                          child: Text(
                                                            "Edit Personal Details",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 24,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child:
                                                                    TextFormField(
                                                                  autofocus:
                                                                      true,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        "DD",
                                                                  ),
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty ||
                                                                        value.length >
                                                                            2) {
                                                                      return 'Please enter Valid Date';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  onSaved:
                                                                      (val) {
                                                                    _dobDate =
                                                                        val;
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child:
                                                                    TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty ||
                                                                        value.length >
                                                                            2) {
                                                                      return 'Please enter Valid Month';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  onSaved:
                                                                      (val) {
                                                                    _dobMonth =
                                                                        val;
                                                                  },
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "MM"),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child:
                                                                    TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty ||
                                                                        value.length !=
                                                                            4) {
                                                                      return 'Please enter Valid Year';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  onSaved:
                                                                      (val) {
                                                                    _dobYear =
                                                                        val;
                                                                  },
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "YYYY"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty ||
                                                                !value.contains(
                                                                    "@")) {
                                                              return 'Please enter Valid Email';
                                                            }
                                                            return null;
                                                          },
                                                          onSaved: (val) {
                                                            _email = val;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                "Enter Email address",
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                "Enter Current Location",
                                                          ),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.length <=
                                                                    0) {
                                                              return "Please Enter Valid Location";
                                                            }
                                                            return null;
                                                          },
                                                          onSaved: (val) {
                                                            _currentLocation =
                                                                val;
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              if (_formkey1
                                                                  .currentState
                                                                  .validate()) {
                                                                setState(() {
                                                                  _formkey1
                                                                      .currentState
                                                                      .save();
                                                                });

                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                            },
                                                            child:
                                                                Text('Submit'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 28,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Date of birth : ",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "$_dobDate/$_dobMonth/$_dobYear",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Email : ",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: _email,
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Location : ",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: _currentLocation,
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 20,
                            bottom: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.school,
                                        color: Colors.blue, size: 30),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Education",
                                        style: TextStyle(
                                          color: Colors.blue[600],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Currently not Implemented',
                                                ),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 28,
                                            color: Colors.blue[600],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Btech : Information Technolgy",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\nHaldia Institute of West Bengal',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Standard : ",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Final Year',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Location : ",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Haldia West Bengal',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 30, top: 20, right: 30, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Experience",
                                      style: TextStyle(
                                        color: Colors.blue[600],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Currently not Implemented',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 28, color: Colors.blue[600]),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Btech in Information Technology",
                                  style: TextStyle(
                                      color: Colors.blue[500],
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  "Haldia Institute of West Bengal (2017-2021)",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Btech in Information Technology",
                                  style: TextStyle(
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  "Haldia Institute of West Bengal (2017-2021)",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 3rd Container
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[600],
                  ),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "EDIT SUGGESTED TARGETS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
