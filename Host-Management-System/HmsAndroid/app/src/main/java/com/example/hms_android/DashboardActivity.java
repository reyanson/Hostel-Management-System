package com.example.hms_android;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import com.example.hms_android.databinding.ActivityDashboardBinding;
import com.example.hms_android.databinding.ActivityHomeBinding;

public class DashboardActivity extends HomeActivity {
    ActivityDashboardBinding activityDashboardBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        activityDashboardBinding = ActivityDashboardBinding.inflate(getLayoutInflater());

        setContentView(activityDashboardBinding.getRoot());
    }
}