package com.example.hms_android;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class DrawerBaseActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_drawer_base);
    }
}