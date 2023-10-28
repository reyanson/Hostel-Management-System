package com.example.hms_android.retrofit;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder; // Import GsonBuilder for lenient parsing

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class RetrofitService {

    private Retrofit retrofit;

    public RetrofitService() {
        initializeRetrofit();
    }

    private void initializeRetrofit() {
        Gson gson = new GsonBuilder().setLenient().create(); // Enable lenient JSON parsing

        retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.8.100:8080")
                .addConverterFactory(GsonConverterFactory.create(gson)) // Use the Gson instance with lenient parsing
                .build();
    }

    public Retrofit getRetrofit() {
        return retrofit;
    }
}
