import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/strings.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  TextEditingController _textFieldController = TextEditingController();

  String? imagePath;
  getImage() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Your Department'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Department"),
            ),
            actions: <Widget>[
              new ElevatedButton(
                child: new Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 15,
          ),
          child: Row(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png",
                      ),
                      radius: 60,
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: IconButton(
                        onPressed: getImage,
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jatin Tolwani",
                      style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Flutter",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: TextButton(
                            onPressed: () => _displayDialog(context),
                            child: Text(
                              "Add Department",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.mail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "jatin.t@simformsolutions.com",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 25.0,
          ),
          child: Divider(
            thickness: 2,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 15,
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey[800],
                  size: 30,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 5,
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.lock,
                  color: Colors.grey[800],
                  size: 30,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(
                    "Change Password",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
              ),
              child: TextButton.icon(
                onPressed: () => Navigator.popUntil(
                  context,
                  ModalRoute.withName(
                    StringApp.signIn,
                  ),
                ),
                icon: Icon(
                  Icons.logout,
                  size: 30,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(
                    "Logout",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
