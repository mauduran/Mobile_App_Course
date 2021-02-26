import 'package:flutter/material.dart';

import './action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionBtn(Icons.thumb_up, "Like"),
            ActionBtn(Icons.thumb_down, "Dislike"),
            ActionBtn(Icons.share_rounded, "Share"),
            ActionBtn(Icons.download_done_rounded, "Download"),
            ActionBtn(Icons.save, "Save"),
          ],
        ),
      ),
    );
  }
}
