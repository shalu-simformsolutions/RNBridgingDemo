package com.rnbridgingdemo;

import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import android.util.Log;

public class NativeScreenModule extends ReactContextBaseJavaModule {

    ReactApplicationContext context = getReactApplicationContext();
    public NativeScreenModule(@Nullable ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @NonNull
    @Override
    public String getName() {
        return "NativeScreen";
    }

    @ReactMethod
    public void NavigateToNative(String url){
        Log.d("NavigateToNative", "imageUrl: " + url);
        Intent i = new Intent(context,HomeActivity.class);
        i.putExtra("imageUrl",url);
        // check whether the activity is exist or not
        if(i.resolveActivity(context.getPackageManager()) != null){
            i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(i);
        }
    }

    @ReactMethod
    public void TestingEvent(String name) {
        Log.d("testingEvent", "Create event called with name: " + name);
    }
}
