package com.example.hms_android;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

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

        // Hook Edit text fields
        username = (EditText) findViewById(R.id.usernameEditText);
        password = (EditText) findViewById(R.id.passwordEditText);

        //Hook button
        loginbtn = (Button) findViewById(R.id.loginButton);

        //set login button on click listener
        loginbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                authenticateUser();
            }


        });


    }
    // End of on create activity

    public void authenticateUser() {
        //check for error
        if (!validateEmail() || !validatePassword()) {
            return;
        }
        //end of check for error


        //Instantiate the request queue
        RequestQueue queue = Volley.newRequestQueue(MainActivity.this);

        //The url posting to
        String url = "http://192.168.8.100:8080/api/v1/user/login";

        //set parameters
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("email", username.getText().toString());
        params.put("password", password.getText().toString());

        //Set Request object
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, url, new JSONObject(params),
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            //Get  Values  from response object
                            String first_name = (String) response.get("first_name");
                            String last_name = (String) response.get("last_name");
                            String email = (String) response.get("email");

                            //Set Intent Actions
                            Intent goToProfile = new Intent(MainActivity.this, Activity_profile.class);
                            //pass Value to profile Activity;
                            goToProfile.putExtra("first_name", first_name);
                            goToProfile.putExtra("last_name", last_name);
                            goToProfile.putExtra("email", email);

                            //Start Activity
                            startActivity(goToProfile);
                            finish();


                        } catch (JSONException e) {
                            e.printStackTrace();
                            System.out.println(e.getMessage());

                        }//end of try block
                    }


                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
                System.out.println(error.getMessage());
                Toast.makeText(MainActivity.this, "Login Failed", Toast.LENGTH_LONG).show();
            }
        }

        ); //End of Set request object

        queue.add(jsonObjectRequest);
    }


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
    }//End of password validation

}//End of Login activity class