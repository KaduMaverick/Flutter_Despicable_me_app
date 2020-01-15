import 'package:flutter/material.dart';

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';


class MinionAnimation extends StatefulWidget {
  @override
  _MinionAnimationState createState() => _MinionAnimationState();
}

class _MinionAnimationState extends State<MinionAnimation> {

  @override
  Widget build(BuildContext context) {
    return  FlareActor(
        'assets/Loading.flr',
        animation: 'Wave',
    );
  }

}

