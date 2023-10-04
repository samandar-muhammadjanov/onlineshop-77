package com.example.onlineshop_77
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("fbceddf4-00b4-4456-8193-82ac0e4c60d5") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
