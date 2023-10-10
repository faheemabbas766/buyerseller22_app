import 'dart:io';

import 'package:buyerseller/Api%20&%20Routes/api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api & Routes/routes.dart';
import '../Providers/homepro.dart';
import '../Providers/profilepro.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController name = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController address = TextEditingController();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          // systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: RouteManager.width / 16,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 33, 142, 243),
          // bottom: _reusableWidget.bottomAppBar(),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: RouteManager.width / 24),
                    width: RouteManager.width / 3,
                    height: RouteManager.width / 3,
                    child: GestureDetector(
                      onTap: () {
                        // _showPopupUpdatePicture();
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: RouteManager.width / 6.4,
                            backgroundColor: Colors.black,
                            backgroundImage: Provider.of<ProfilePro>(context).dp == null || Provider.of<ProfilePro>(context).dp == ""
                                ? null
                                : NetworkImage(
                                    API.imageip + Provider.of<ProfilePro>(context).dp!,
                                  ),
                          ),
                          // create edit icon in the picture
                          InkWell(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (contextssdsd) {
                                    return AlertDialog(
                                      elevation: 2000,
                                      content: Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromRGBO(52, 109, 199, 10),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Camera ",
                                                  style: TextStyle(fontSize: RouteManager.width / 22),
                                                ),
                                                Icon(Icons.camera_alt_rounded),
                                              ],
                                            ),
                                            onPressed: () async {
                                              final ImagePicker _picker = ImagePicker();
                                              final XFile? image = await _picker.pickImage(
                                                imageQuality: 10,
                                                source: ImageSource.camera,
                                              );
                                              Navigator.of(context).pop();
                                              if (image != null) {
                                                API.showLoading(context);
                                                API
                                                    .updateProfile(
                                                        Provider.of<ProfilePro>(context, listen: false).userid!,
                                                        Provider.of<ProfilePro>(context, listen: false).name!,
                                                        Provider.of<ProfilePro>(context, listen: false).company!,
                                                        Provider.of<ProfilePro>(context, listen: false).address!,
                                                        Provider.of<ProfilePro>(context, listen: false).dp!,
                                                        File(image.path),
                                                        context)
                                                    .then((value) {
                                                      setState(() {
                                                        
                                                      });
                                                  Navigator.of(context, rootNavigator: true).pop();
                                                });
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: RouteManager.width / 20,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromRGBO(52, 109, 199, 10),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Gallery ",
                                                  style: TextStyle(fontSize: RouteManager.width / 22),
                                                ),
                                                const Icon(Icons.photo_library),
                                              ],
                                            ),
                                            onPressed: () async {
                                              final ImagePicker _picker = ImagePicker();
                                              final XFile? image = await _picker.pickImage(
                                                imageQuality: 10,
                                                source: ImageSource.gallery,
                                              );
                                              Navigator.of(context).pop();
                                              if (image != null) {
                                                API.showLoading(context);
                                                API
                                                    .updateProfile(
                                                        Provider.of<ProfilePro>(context, listen: false).userid!,
                                                        Provider.of<ProfilePro>(context, listen: false).name!,
                                                        Provider.of<ProfilePro>(context, listen: false).company!,
                                                        Provider.of<ProfilePro>(context, listen: false).address!,
                                                        Provider.of<ProfilePro>(context, listen: false).dp!,
                                                        File(image.path),
                                                        context)
                                                    .then((value) {
                                                      setState(() {
                                                        
                                                      });
                                                  Navigator.of(context, rootNavigator: true).pop();
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              width: RouteManager.width / 10,
                              height: RouteManager.width / 10,
                              margin: EdgeInsets.only(top: 0, left: RouteManager.width / 4.4),
                              child: Card(
                                color: const Color.fromARGB(255, 33, 142, 243),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    RouteManager.width,
                                  ),
                                ),
                                elevation: 1,
                                child: Icon(
                                  Icons.edit,
                                  size: RouteManager.width / 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: RouteManager.width / 20),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: RouteManager.width / 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 142, 243),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        Provider.of<ProfilePro>(context).name!,
                        style: TextStyle(
                          fontSize: RouteManager.width / 25,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (contextssdsd) {
                            return StatefulBuilder(builder: (context, s) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    "Update Name",
                                    style: TextStyle(
                                      fontSize: RouteManager.width / 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                elevation: 2000,
                                content: Container(
                                  height: RouteManager.width / 2.6,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: RouteManager.width / 1.2,
                                        child: Form(
                                          key: formkey1,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          child: TextFormField(
                                            controller: name,
                                            // obscureText: Provider.of<SignUpPro>(context).signinobscure,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.blue,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              hintText: "Enter Name",
                                              hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                                              enabled: true,
                                              contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                                              counterText: "",
                                              labelText: "Name",
                                              labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                                            ),
                                            maxLength: 20,
                                            style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                                            enableIMEPersonalizedLearning: true,
                                            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                            onTapOutside: (pointerdownevent) {
                                              print("AYAAAAAAAAAAAAAaa");
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter Name";
                                              }
                                              if (value.length < 6) {
                                                return "Must have 6 Characters";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: RouteManager.width / 20,
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 55, 118, 228),
                                              Color.fromARGB(255, 238, 93, 93),
                                              // const Color.fromARGB(255, 207, 127, 221)
                                              //add more colors
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(RouteManager.width / 30),
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'Update',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            final isvalidform = formkey1.currentState!.validate();
                                            if (!isvalidform) {
                                              return;
                                            }
                                            API.showLoading(context);
                                            API
                                                .updateProfile(
                                                    Provider.of<ProfilePro>(context, listen: false).userid!,
                                                    name.text,
                                                    Provider.of<ProfilePro>(context, listen: false).company!,
                                                    Provider.of<ProfilePro>(context, listen: false).address!,
                                                    Provider.of<ProfilePro>(context, listen: false).dp!,
                                                    null,
                                                    context)
                                                .then((value) {
                                              if (value) {
                                                name.text = "";
                                                setState(() {
                                                  
                                                });
                                                Navigator.of(context, rootNavigator: true).pop();
                                              }
                                              Navigator.of(context, rootNavigator: true).pop();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        ).then((value) {
                          name.text = "";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          RouteManager.width / 40,
                        ),
                        decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 33, 142, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: RouteManager.width / 23,
                            ),
                            Text(
                              ' Edit',
                              style: TextStyle(
                                fontSize: RouteManager.width / 27,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 20,
                ),
                Text(
                  'Contact No.',
                  style: TextStyle(
                    fontSize: RouteManager.width / 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 142, 243),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "+92 " + Provider.of<ProfilePro>(context).phn!,
                        style: TextStyle(
                          fontSize: RouteManager.width / 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: RouteManager.width / 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 142, 243),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        Provider.of<ProfilePro>(context).email!,
                        style: TextStyle(
                          fontSize: RouteManager.width / 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 20,
                ),
                Text(
                  'City',
                  style: TextStyle(
                    fontSize: RouteManager.width / 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 142, 243),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        Provider.of<ProfilePro>(context).city!,
                        style: TextStyle(
                          fontSize: RouteManager.width / 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 20,
                ),
                Text(
                  'Company',
                  style: TextStyle(
                    fontSize: RouteManager.width / 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 142, 243),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Provider.of<ProfilePro>(context).company == ""
                          ? Text(
                              "Not Added",
                              style: TextStyle(
                                fontSize: RouteManager.width / 25,
                                color: Colors.grey,
                              ),
                            )
                          : Text(
                              Provider.of<ProfilePro>(context).company!,
                              style: TextStyle(
                                fontSize: RouteManager.width / 25,
                              ),
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                     showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (contextssdsd) {
                            return StatefulBuilder(builder: (context, s) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    "Update Company",
                                    style: TextStyle(
                                      fontSize: RouteManager.width / 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                elevation: 2000,
                                content: Container(
                                  height: RouteManager.width / 2.6,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: RouteManager.width / 1.2,
                                        child: Form(
                                          key: formkey2,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          child: TextFormField(
                                            controller: company,
                                            // obscureText: Provider.of<SignUpPro>(context).signinobscure,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.blue,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              hintText: "Enter Company Name",
                                              hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                                              enabled: true,
                                              contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                                              counterText: "",
                                              labelText: "Company Name",
                                              labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                                            ),
                                            maxLength: 20,
                                            style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                                            enableIMEPersonalizedLearning: true,
                                            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                            onTapOutside: (pointerdownevent) {
                                              print("AYAAAAAAAAAAAAAaa");
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter Company Name";
                                              }
                                              if (value.length < 6) {
                                                return "Must have 6 Characters";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: RouteManager.width / 20,
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 55, 118, 228),
                                              Color.fromARGB(255, 238, 93, 93),
                                              // const Color.fromARGB(255, 207, 127, 221)
                                              //add more colors
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(RouteManager.width / 30),
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'Update',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            final isvalidform = formkey2.currentState!.validate();
                                            if (!isvalidform) {
                                              return;
                                            }
                                            API.showLoading(context);
                                            API
                                                .updateProfile(
                                                    Provider.of<ProfilePro>(context, listen: false).userid!,
                                                    Provider.of<ProfilePro>(context, listen: false).name!,
                                                    company.text,
                                                    Provider.of<ProfilePro>(context, listen: false).address!,
                                                    Provider.of<ProfilePro>(context, listen: false).dp!,
                                                    null,
                                                    context)
                                                .then((value) {
                                              if (value) {
                                                company.text = "";
                                                setState(() {
                                                  
                                                });
                                                Navigator.of(context, rootNavigator: true).pop();
                                              }
                                              Navigator.of(context, rootNavigator: true).pop();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        ).then((value) {
                          company.text = "";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          RouteManager.width / 40,
                        ),
                        decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 33, 142, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: RouteManager.width / 23,
                            ),
                            Text(
                              ' Edit',
                              style: TextStyle(
                                fontSize: RouteManager.width / 27,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 20,
                ),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: RouteManager.width / 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 142, 243),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        Provider.of<ProfilePro>(context).address!,
                        style: TextStyle(
                          fontSize: RouteManager.width / 25,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (contextssdsd) {
                            return StatefulBuilder(builder: (context, s) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    "Update Company",
                                    style: TextStyle(
                                      fontSize: RouteManager.width / 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                elevation: 2000,
                                content: Container(
                                  height: RouteManager.width / 2.6,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: RouteManager.width / 1.2,
                                        child: Form(
                                          key: formkey3,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          child: TextFormField(
                                            controller: address,
                                            // obscureText: Provider.of<SignUpPro>(context).signinobscure,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.blue,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              hintText: "Enter Address",
                                              hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                                              enabled: true,
                                              contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                                              counterText: "",
                                              labelText: "Address",
                                              labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                                            ),
                                            maxLength: 20,
                                            style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                                            enableIMEPersonalizedLearning: true,
                                            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                            onTapOutside: (pointerdownevent) {
                                              print("AYAAAAAAAAAAAAAaa");
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter Address";
                                              }
                                              if (value.length < 6) {
                                                return "Must have 6 Characters";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: RouteManager.width / 20,
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 55, 118, 228),
                                              Color.fromARGB(255, 238, 93, 93),
                                              // const Color.fromARGB(255, 207, 127, 221)
                                              //add more colors
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(RouteManager.width / 30),
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'Update',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            final isvalidform = formkey3.currentState!.validate();
                                            if (!isvalidform) {
                                              return;
                                            }
                                            API.showLoading(context);
                                            API
                                                .updateProfile(
                                                    Provider.of<ProfilePro>(context, listen: false).userid!,
                                                    Provider.of<ProfilePro>(context, listen: false).name!,
                                                    Provider.of<ProfilePro>(context, listen: false).company!,
                                                    address.text,
                                                    Provider.of<ProfilePro>(context, listen: false).dp!,
                                                    null,
                                                    context)
                                                .then((value) {
                                              if (value) {
                                                address.text = "";
                                                setState(() {
                                                  
                                                });
                                                Navigator.of(context, rootNavigator: true).pop();
                                              }
                                              Navigator.of(context, rootNavigator: true).pop();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        ).then((value) {
                          address.text = "";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          RouteManager.width / 40,
                        ),
                        decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 33, 142, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: RouteManager.width / 23,
                            ),
                            Text(
                              ' Edit',
                              style: TextStyle(
                                fontSize: RouteManager.width / 27,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      SharedPreferences.getInstance().then((value) {
                        value.clear();
                      }).then((value) {
                        Provider.of<ProfilePro>(context, listen: false).clearAll();
                        Provider.of<HomePro>(context, listen: false).clearAll();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteManager.signup1,
                          (route) => false,
                        );
                      });
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: RouteManager.width / 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
