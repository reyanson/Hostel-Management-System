package com.example.hms_android.models;

import com.google.gson.annotations.SerializedName;

public class ResponseClass {
    // Define fields that correspond to the JSON response from the server
    @SerializedName("status")
    private String status;

    @SerializedName("loginMsg")
    private String loginMsg;


    // Constructors, getters, and setters
    // You can generate these using your IDE or write them manually

    public ResponseClass(String status, String message) {
        this.status = status;
        this.loginMsg = message;

    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLoginMsg() {
        return loginMsg;
    }

    public void setLoginMsg(String loginMsg) {
        this.loginMsg = loginMsg;
    }


}

