package com.example.hms_android;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.example.hms_android.barcode.BarCodeActivity;


import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class SignInActivity extends AppCompatActivity {

    Button sign_in_btn;
    EditText et_email, et_password;
    Intent goToProfile;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);
        // Hook Edit Text Fields:
        et_email = findViewById(R.id.email);
        et_password = findViewById(R.id.password);

        // Hook Button:
        sign_in_btn = findViewById(R.id.sign_in_btn);

        // Set Sign In Button On Click Listener:
        sign_in_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                authenticateUser();
            }
        });


    }
    // End Of On Create Activity.

    public void authenticateUser(){
        // Check For Errors:
        if( !validateEmail() || !validatePassword()){
            return;
        }
        // End Of Check For Errors.

        // Instantiate The Request Queue:
        RequestQueue queue = Volley.newRequestQueue(SignInActivity.this);
        // The URL Posting TO:
        String url = "http://192.168.8.100:8080/api/v1/login";

        // Set Parameters:
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("username", et_email.getText().toString());
        params.put("password", et_password.getText().toString());

        // Set Request Object:
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, url, new JSONObject(params),
                response -> {
                    // Get Values From Response Object:
                    String msg = null;
                    try {
                        msg = (String) response.get("username");
                        String occasion = (String) response.get("occasion");
                        Toast.makeText(SignInActivity.this,msg,Toast.LENGTH_LONG).show();

                        if(occasion.equals("student")){
                            // Set Intent Actions:
                            goToProfile = new Intent(SignInActivity.this,HomeActivity.class);
                            //goToProfile.putExtra("first_name", msg);

                            // Start Activity:
                            startActivity(goToProfile);
                            finish();
                        } else if (occasion.equals("security")) {
                            // Set Intent Actions:
                            goToProfile = new Intent(SignInActivity.this, BarCodeActivity.class);
                            //goToProfile.putExtra("first_name", msg);

                            // Start Activity:
                            startActivity(goToProfile);
                            finish();

                        }else{
                            Toast.makeText(SignInActivity.this, "Login Failed", Toast.LENGTH_LONG).show();
                        }


                    } catch (JSONException e) {
                        Toast.makeText(SignInActivity.this,"Error",Toast.LENGTH_LONG).show();
                        throw new RuntimeException(e);

                    }

                    // End Of Try Block.
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
                System.out.println(error.getMessage());
                Toast.makeText(SignInActivity.this, "Login Failed", Toast.LENGTH_LONG).show();
            }
        });// End Of Set Request Object.

        queue.add(jsonObjectRequest);

    }

    public void goToHome(View view){
        Intent intent = new Intent(SignInActivity.this, MainActivity.class);
        startActivity(intent);
        finish();
    }
    // End Of Go To Home Intent Method.


    public void goToSigUpAct(View view){
        Intent intent = new Intent(SignInActivity.this, SignUpActivity.class);
        startActivity(intent);
        finish();
    }
    // End Of Go To Sign Up Intent Method.


    public boolean validateEmail(){
        String email = et_email.getText().toString();
        // Check If Email Is Empty:
        if(email.isEmpty()){
            et_email.setError("Email cannot be empty!");
            return false;
        }else{
            et_email.setError(null);
            return true;
        }// Check If Email Is Empty.
    }
    // End Of Validate Email Field.

    public boolean validatePassword() {
        String password = et_password.getText().toString();

        // Check If Password and Confirm Field Is Empty:
        if (password.isEmpty()) {
            et_password.setError("Password cannot be empty!");
            return false;
        } else {
            et_password.setError(null);
            return true;
        }// Check Password and Confirm Field Is Empty.
    }
    // End Of Validate Password;
}
// End Of Sign In Activity Class.