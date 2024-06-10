import 'package:flutter/material.dart';
import 'package:mux_player/mux_player.dart';

class StreamingPage extends StatelessWidget {
  const StreamingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Html5Player(
        muted: false,
        streamType: 'll-live:dvr',
        playbackId: 'uNrNFhQuIXI6zCoezo1OLuTAKq91YqMORtUDmS1jTx8',
      ),
    );
  }
}
