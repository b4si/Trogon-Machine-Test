import 'package:flutter/material.dart';
import 'package:trogon_machine_test/view/course_screen.dart';
import 'package:trogon_machine_test/view/widgets/appbar_container.dart';
import 'package:trogon_machine_test/view/widgets/main_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarContainer(size: size),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainContainer(
                  size: size,
                  color1: const Color(0xFFED617B),
                  color2: const Color(0xFFF2859B),
                  color3: const Color(0xFFDC355F),
                  image: 'assets/exam_image.png',
                  text: "Exam",
                ),
                MainContainer(
                  size: size,
                  color1: const Color(0xFFFFAF01),
                  color2: const Color(0xFFFECC07),
                  color3: const Color(0xFFFE9900),
                  image: 'assets/practice_image.png',
                  text: "Practice",
                ),
                MainContainer(
                  size: size,
                  color1: const Color(0xFF24AED2),
                  color2: const Color(0xFF7BC9DD),
                  color3: const Color(0xFF28AFD2),
                  image: 'assets/materials_image.png',
                  text: "Materials",
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Courses",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Color(0xFF512E7E),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.3,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CourseScreen(),
                              ));
                        },
                        child: Image.asset(
                          'assets/Course 1.png',
                          height: size.height * 0.1,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("KTET")
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/Ads.png'),
            )
          ],
        ),
      ),
    );
  }
}
