package com.example.hms_android.barcode;

import androidx.activity.result.ActivityResultLauncher;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.example.hms_android.HomeActivity;
import com.example.hms_android.MainActivity;
import com.example.hms_android.ProfileActivity;
import com.example.hms_android.R;
import com.example.hms_android.SignInActivity;
import com.journeyapps.barcodescanner.ScanContract;
import com.journeyapps.barcodescanner.ScanOptions;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class BarCodeActivity extends AppCompatActivity {
    Button scan,logout;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bar_code);

        scan = findViewById(R.id.btn_scan);
        logout = findViewById(R.id.btn_logout);
        scan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                scanCode();
            }
        });

        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                loginUserOut();
            }
        });
    }

    private void scanCode() {
        ScanOptions options = new ScanOptions();
        options.setPrompt("Volume up to flash on");
        options.setBeepEnabled(true);
        options.setOrientationLocked(true);
        options.setCaptureActivity(CaptureAct.class);
        barLauncher.launch(options);




    }

    ActivityResultLauncher<ScanOptions> barLauncher = registerForActivityResult(new ScanContract(),result->{
        if(result.getContents() != null){

            //builder.setMessage(result.getContents());
            String regnum = result.getContents();

            // Instantiate The Request Queue:
            RequestQueue queue = Volley.newRequestQueue(BarCodeActivity.this);
            // The URL Posting TO:
            String url = "http://192.168.8.101:8080/security/inOut";
            // Set Parameters:
            HashMap<String, String> params = new HashMap<String, String>();
            params.put("regnum", regnum);

            // Set Request Object:
            JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.PUT, url, new JSONObject(params),
                    response -> {
                        // Get Values From Response Object:
                        String msg = null, regNo=null;
                        try {
                            msg = (String) response.get("msg");
                            regNo = (String) response.get("regnum");
                            //Toast.makeText(BarCodeActivity.this,msg,Toast.LENGTH_LONG).show();
                            AlertDialog.Builder builder = new AlertDialog.Builder(BarCodeActivity.this);
                            builder.setTitle("Result");
                            builder.setMessage(regNo+ " is "+ "Room "+msg);

                            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    dialog.dismiss();
                                }
                            }).show();


                        } catch (JSONException e) {
                            Toast.makeText(BarCodeActivity.this,"Error",Toast.LENGTH_LONG).show();
                            throw new RuntimeException(e);

                        }

                        // End Of Try Block.
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    error.printStackTrace();
                    System.out.println(error.getMessage());
                    Toast.makeText(BarCodeActivity.this, "Login Failed", Toast.LENGTH_LONG).show();
                }
            });// End Of Set Request Object.

            queue.add(jsonObjectRequest);



        }
    });













    public void loginUserOut(){

        // Set Text View Profile Values:
        //tv_first_name.setText(null);
        //tv_last_name.setText(null);
        //tv_email.setText(null);

        // Return User Back To Home:
        Intent goToHome = new Intent(BarCodeActivity.this, SignInActivity.class);
        startActivity(goToHome);
        finish();

    }
}