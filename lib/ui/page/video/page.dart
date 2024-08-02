import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('VideoPage')),
        body: SafeArea(child: Text('VideoController')));
  }
}
