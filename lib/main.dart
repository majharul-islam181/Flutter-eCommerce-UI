// ignore_for_file: library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/Pages/ShopPage.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _scaleAnimation = Tween<double>(begin: 1.0, end: 30.0)
        .animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: ShopPage()));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Brand New Perspective",
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.2,
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    )),
                const SizedBox(
                  height: 8,
                ),
                FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: Text(
                      "Let's start with our summer collection.",
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 22),
                    )),
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: hide == false
                                  ? const Text(
                                      "Get Start",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Container(),
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInUp(
                    duration: const Duration(milliseconds: 1700),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
