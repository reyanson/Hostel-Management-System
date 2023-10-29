package com.example.hms_android.barcode;

import androidx.activity.result.ActivityResultLauncher;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.hms_android.MainActivity;
import com.example.hms_android.R;
import com.journeyapps.barcodescanner.ScanContract;
import com.journeyapps.barcodescanner.ScanOptions;

public class BarCodeActivity extends AppCompatActivity {
    Button scan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bar_code);

        scan = findViewById(R.id.btn_scan);
        scan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                scanCode();
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
            AlertDialog.Builder builder = new AlertDialog.Builder(BarCodeActivity.this);
            builder.setTitle("Result");
            builder.setMessage(result.getContents());
            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            }).show();
        }
    });
}