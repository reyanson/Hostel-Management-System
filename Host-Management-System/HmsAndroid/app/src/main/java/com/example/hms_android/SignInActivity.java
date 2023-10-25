package com.example.hms_android;


import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import com.example.hms_android.models.Login;
import com.example.hms_android.models.ResponseClass;
import com.example.hms_android.retrofit.LoginApi;
import com.example.hms_android.retrofit.RetrofitService;
import android.util.Log;

public class SignInActivity extends AppCompatActivity {
    private EditText etEmail;
    private EditText etPassword;
    private Button signInButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);

        // Initialize UI components
        etEmail = findViewById(R.id.email);
        etPassword = findViewById(R.id.password);
        signInButton = findViewById(R.id.sign_in_btn);

        RetrofitService retrofitService = new RetrofitService();
        LoginApi loginApi = retrofitService.getRetrofit().create(LoginApi.class);

        signInButton.setOnClickListener(view -> {
            String username = etEmail.getText().toString();
            String password = etPassword.getText().toString();

            // Create a login object
            Login login = new Login();
            login.setUsername(username);
            login.setPassword(password);

            // Make a POST request to the login API
            Call<ResponseClass> call = loginApi.login(login);

            call.enqueue(new Callback<ResponseClass>() {
                @Override
                public void onResponse(Call<ResponseClass> call, Response<ResponseClass> response) {
                    if (response.isSuccessful()) {
                        // Authentication is successful
                        ResponseClass responseObject = response.body();
                        String loginMsg = responseObject.getMessage().toString();



                        if (loginMsg.equals("Login Successful")) {
                            // Navigate to the next activity when login is successful
                            Intent intent = new Intent(SignInActivity.this, ProfileActivity.class);
                            startActivity(intent);
                            finish(); // Close the current activity
                        } else {
                            // Handle other responses or display a message
                            Toast.makeText(SignInActivity.this, "Login Failed. Please check your credentials.", Toast.LENGTH_LONG).show();
                        }
                    } else {
                        // Handle the error, show a message, etc.
                        Toast.makeText(SignInActivity.this, "Login Failed", Toast.LENGTH_LONG).show();
                    }
                }

                @Override
                public void onFailure(Call<ResponseClass> call, Throwable t) {
                    Log.e("Error", t.getMessage());
                    // Handle network or request failure
                    Toast.makeText(SignInActivity.this, "Login Failed. Please check your network.", Toast.LENGTH_LONG).show();
                }
            });
        });
    }

    // Other methods and logic in your activity
}







//
//import androidx.appcompat.app.AppCompatActivity;
//
//import android.content.Intent;
//import android.os.Bundle;
//import android.view.View;
//import android.widget.Button;
//import android.widget.EditText;
//import android.widget.Toast;
//
//import com.android.volley.Request;
//import com.android.volley.RequestQueue;
//import com.android.volley.Response;
//import com.android.volley.VolleyError;
//import com.android.volley.toolbox.JsonObjectRequest;
//import com.android.volley.toolbox.Volley;
//import com.example.hms_android.helpers.StringHelper;
//import com.example.hms_android.models.Login;
//import com.example.hms_android.retrofit.LoginApi;
//import com.example.hms_android.retrofit.RetrofitService;
//
//
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.util.HashMap;
//
//public class SignInActivity extends AppCompatActivity {
//
//    Button sign_in_btn;
//    EditText et_email, et_password;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_sign_in);
//
//        // Hook Edit Text Fields:
//        et_email = findViewById(R.id.email);
//        et_password = findViewById(R.id.password);
//
//        // Hook Button:
//        sign_in_btn = findViewById(R.id.sign_in_btn);
//
//        RetrofitService retrofitService = new RetrofitService();
//        LoginApi loginApi = retrofitService.getRetrofit().create(LoginApi.class);
//        sign_in_btn.setOnClickListener(view -> {
//            String username = et_email.getText().toString();
//            String password = et_password.getText().toString();
//
//            //create login object
//            Login login = new Login();
//            login.setUsername(username);
//            login.setPassword(password);
//
//
//        });
//
//
//
//    }
//
//}
