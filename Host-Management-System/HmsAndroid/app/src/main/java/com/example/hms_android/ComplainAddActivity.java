package com.example.hms_android;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import com.example.hms_android.databinding.ActivityComplainAddBinding;

public class ComplainAddActivity extends HomeActivity {
    ActivityComplainAddBinding activityComplainAddBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        activityComplainAddBinding = ActivityComplainAddBinding.inflate(getLayoutInflater());
        allocateActivityTitle("Complain ADD");
        setContentView(activityComplainAddBinding.getRoot());
    }
}