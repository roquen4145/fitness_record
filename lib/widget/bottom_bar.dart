import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Container(
          height: 60,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                  icon: Icon(Icons.home, size: 18),
                  child: Text('홈', style: TextStyle(fontSize: 11))),
              Tab(
                  icon: Icon(Icons.fitness_center, size: 18),
                  child: Text('운동', style: TextStyle(fontSize: 11))),
              Tab(
                  icon: Icon(Icons.person, size: 18),
                  child: Text('프로필', style: TextStyle(fontSize: 11))),
            ],
          ),
        ));
  }
}
