import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchtime_frontend/screens/homescreen.dart';
import 'package:lunchtime_frontend/utils/colors.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppColors.red,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                      right: 8,
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        StringApp.profile,
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png'),
                          radius: 27,
                        ),
                      ),
                    ),
                  )
                ],
                expandedHeight: 90.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Hello Jatin",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  background: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Share Your Thoughts",
                            style: GoogleFonts.lato(
                                fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: const HomePage(),
        ),
      ),
    );
  }
}
