import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          title: const Text(
            "Profile",
          ),
          actions: [
            PopupMenuButton(
                icon: Icon(
                    Icons.menu), //don't specify icon if you want 3 dot menu
                color: Colors.blue,
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text(
                          "Setting",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                onSelected: (item) => {print(item)})
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 15,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png",
                ),
                radius: 60,
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
                    Text(
                      "Flutter",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
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
                onPressed: () {},
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
