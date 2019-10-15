package com.example.flutter_gonative_app

import android.os.Bundle
// import gonativelib.DataProcessor
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    // internal var goNativeDataProcessor = DataProcessor()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
    //    MethodChannel(flutterView, "example.com/gonative").setMethodCallHandler {
    //      methodCall: MethodCall, result: MethodChannel.Result ->
    //             if (methodCall.method.equals("dataProcessor_increment")) {
    //                 if (!methodCall.hasArgument("data")) {
    //                     result.error("dataProcessor_increment", "Send argument as Map<\"data\", int>", null)
    //                 }
    //                 try {
    //                      val data = methodCall.argument<Long>("data")
    //                      result.success(goNativeDataProcessor.increment(data))
    //                 } catch (e: Exception) {
    //                     result.error("dataProcessor_increment", e.toString(), null)
    //                 }

    //             } else {
    //                 result.notImplemented()
    //             }
    //         }       
    }
}
