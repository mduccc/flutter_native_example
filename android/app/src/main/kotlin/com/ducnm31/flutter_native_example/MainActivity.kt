package com.ducnm31.flutter_native_example

import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    val channel = BasicMessageChannel<String>(flutterView, "msg", StringCodec.INSTANCE)

    // Receive a message from Dart
    channel.setMessageHandler { m, reply ->
      Log.d("Receive from Dart", m)
      reply.reply("I'm Kotlin")
    }
  }
}
