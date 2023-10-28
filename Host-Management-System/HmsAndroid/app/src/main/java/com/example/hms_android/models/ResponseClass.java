package com.example.hms_android.models;

import com.google.gson.annotations.SerializedName;

public class ResponseClass {
    // Define fields that correspond to the JSON response from the server
    @SerializedName("status")
    private String message;

    // Constructors, getters, and setters
    // You can generate these using your IDE or write them manually

    public ResponseClass(String message) {
        this.message = message;


    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }




}

