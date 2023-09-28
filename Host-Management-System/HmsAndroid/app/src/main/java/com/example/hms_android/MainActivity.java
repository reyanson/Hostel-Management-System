package com.example.hms_android;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class MainActivity extends AppCompatActivity {

    Button loginbtn;
    EditText username,password;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loginbtn = (Button) findViewById(R.id.loginButton);
        username = (EditText) findViewById(R.id.usernameEditText);
        password = (EditText) findViewById(R.id.passwordEditText);

        //set login button on click listener
        loginbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });




    }
    // end of on create activity

    public void authenticateUser(){
        //check for error
        if(!validateEmail() || !validatePassword()){
           return;
        }
        //end of check for error

        //Instantiate the request queue
        RequestQueue queue = Volley.newRequestQueue(MainActivity.this);

        //The url posting to
        String url = "springboot url";

        //set parameters
        HashMap<String,String> params = new HashMap<String,String>();
        params.put("email",username.getText().toString());
        params.put("passwor",password.getText().toString());

        //Set Request object
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, url, new JSONObject(params),
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            //Get  Values  from response object
                            String first_name = (String) response.get("first_name");
                            

                        }catch (JSONException e){
                            e.printStackTrace();
                            System.out.println(e.getMessage());

                        }//end of try block
                    }


                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }

        ); //End of Set request object


    public boolean validateEmail(){
        String email = username.getText().toString();
        //check if email is empty
        if(email.isEmpty()){
            username.setError("Email cannot be empty");
            return false;
        }else {
            username.setError(null);
            return  true;

        }

    }
    // end of email validation code

    public boolean validatePassword(){
        String pass = password.getText().toString();

        if(pass.isEmpty()){
            password.setError("password cannot be empty");
            return false;
        }else{
            password.setError(null);
            return true;
        }
    }

}