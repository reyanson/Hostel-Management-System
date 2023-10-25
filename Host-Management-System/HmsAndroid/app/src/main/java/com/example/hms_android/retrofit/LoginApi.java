package com.example.hms_android.retrofit;

import com.example.hms_android.models.Login;
import com.example.hms_android.models.ResponseClass;

import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;
import retrofit2.http.Url;

public interface LoginApi {

    @POST("/api/v1/login")
    Call<ResponseClass> login(@Body Login login);


}

