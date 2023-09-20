import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            leadingWidth: 58,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset('assets/icons/logo.svg'),
            ),
            backgroundColor: const Color(0xFFF4F4F4),
            title: const Text('dev'),
            titleSpacing: 10,
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/menu.svg'),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
