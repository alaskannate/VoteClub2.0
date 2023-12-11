import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:niku/widget/niku.dart';

class Dapp extends StatelessWidget {
  const Dapp({super.key});

  @override
  Widget build(BuildContext context) =>
      const GetMaterialApp(title: 'VoteClub2.0', home: HomeDapp());
}

class HomeController extends GetxController {}

class HomeDapp extends StatelessWidget {
  const HomeDapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (h) => Scaffold(
              body: Center(
                child: Niku(const Text('hello test')),
              ),
            ));
  }
}
