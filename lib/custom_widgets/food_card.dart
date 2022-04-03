import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retrofit/dio.dart';

import '../retrofit/api_service.dart';

class FoodCardWidget extends StatefulWidget {
  const FoodCardWidget({Key? key}) : super(key: key);

  @override
  State<FoodCardWidget> createState() => _FoodCardWidgetState();
}

class _FoodCardWidgetState extends State<FoodCardWidget> {
  HttpResponse? res;

  @override
  void initState() {
    super.initState();
    myInit();
  }

  Future<void> myInit() async {
    res = await client.addMenu();
    String myResult = await res?.data['0'];

    print('--------------------- $myResult');
  }

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20,
        ),
        child: Card(
          elevation: 5,
          shadowColor: const Color.fromRGBO(
            0,
            0,
            0,
            0.3,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(
                              0.5,
                            ),
                            BlendMode.darken,
                          ),
                          image: const NetworkImage(
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
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          "Todays Menu",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        bottom: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: StatefulBuilder(
                          builder: (thisLowerContext, innerSetState) {
                            if (res?.data == null) {
                              innerSetState(() => res?.data);
                              return const Text(
                                'NO Data Found!',
                              );
                            } else {
                              return Text(
                                "✔${res?.data['$index']}",
                                style: GoogleFonts.lato(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              );
                            }
                          },
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
