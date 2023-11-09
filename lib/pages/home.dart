import 'package:diet_app/models/category_model.dart';
import 'package:diet_app/models/diet_model.dart';
import 'package:diet_app/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    // Orientation orientati1on = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: app_Bar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(
            height: 30,
          ),
          _categoriesSection(deviceWidth),
          const SizedBox(
            height: 30,
          ),
          _dietSection(deviceHeight, deviceWidth),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Popular",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemCount: popularDiets.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 25,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: popularDiets[index].boxIsSelected
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: popularDiets[index].boxIsSelected
                            ? [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.1),
                                  offset: const Offset(0, 10),
                                  spreadRadius: 0,
                                  blurRadius: 40,
                                )
                              ]
                            : []),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            popularDiets[index].iconPath,
                            width: 65,
                            height: 65,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                popularDiets[index].level +
                                    "|" +
                                    popularDiets[index].duration +
                                    "|" +
                                    popularDiets[index].calorie,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromARGB(255, 181, 176, 176),
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: const Color.fromARGB(
                                        255, 181, 176, 176),
                                  )),
                              child: const Icon(
                                Icons.chevron_right_rounded,
                                color: Color.fromARGB(255, 181, 176, 176),
                              ),
                            ),
                          )
                        ]),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Column _dietSection(double deviceHeight, double deviceWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation\nfor diet",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: deviceHeight / 3.5,
          child: ListView.separated(
            itemCount: diets.length,
            separatorBuilder: (context, index) => SizedBox(
              width: deviceWidth / 25,
            ),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: deviceWidth / 2,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      diets[index].iconPath,
                    ),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          diets[index].level +
                              "|" +
                              diets[index].duration +
                              "|" +
                              diets[index].calorie,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 130, 128, 128),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 120,
                      child: Center(
                        child: Text(
                          "View",
                          style: GoogleFonts.poppins(
                              color: diets[index].viewIsSelecetd
                                  ? Colors.white
                                  : Colors.purpleAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          diets[index].viewIsSelecetd
                              ? const Color.fromARGB(255, 178, 218, 236)
                              : Colors.transparent,
                          diets[index].viewIsSelecetd
                              ? const Color.fromARGB(255, 135, 148, 233)
                              : Colors.transparent,
                          // Color.fromARGB(255, 244, 182, 219),
                        ]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Column _categoriesSection(double deviceWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            height: 120,
            child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: deviceWidth / 25,
                    ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: deviceWidth / 4,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: deviceWidth / 8,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(categories[index].iconPath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search Pancake",
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xffDDDADA),
              fontSize: 15,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: Container(
              width: 100,
              child: const IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 0.4,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  AppBar app_Bar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18,
        ),
        // style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //     fontSize: 18,
        //     fontFamily: "poppins"),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          child: const Icon(
            Icons.chevron_left_rounded,
            size: 30,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 230, 230),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: const Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.black,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 230, 230),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
