import 'package:flutter/material.dart';
import 'package:untitled/ui/startview/components/start_view_page_body.dart';

class StartViewPage extends StatelessWidget {
  const StartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: StartViewPageBody(media: media),
    );
  }
}
