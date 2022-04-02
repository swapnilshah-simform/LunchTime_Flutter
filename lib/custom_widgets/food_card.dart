import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCardWidget extends StatelessWidget {
  const FoodCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Card(
          elevation: 5,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.3),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          ),
                          image: NetworkImage(
                            "https://blog.dineout-cdn.co.in/blog/wp-content/uploads/2019/04/blog_chandigarh-1030x538.jpg",
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Todays Menu",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 320,
                child: GridView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4.4,
                  ),
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        bottom: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: Text(
                          "✔    Butter Milk",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
