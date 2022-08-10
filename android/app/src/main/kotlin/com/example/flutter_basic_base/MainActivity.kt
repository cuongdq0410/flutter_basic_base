package com.example.flutter_basic_base

import android.os.Bundle
import com.example.flutter_base.BuildConfig.FLAVOR
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine?.dartExecutor?.let {
            MethodChannel(it, "flavor").setMethodCallHandler { _, result ->
                result.success(FLAVOR)
            }
        }
    }
}

