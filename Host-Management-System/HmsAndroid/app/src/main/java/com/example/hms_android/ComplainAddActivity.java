package com.example.hms_android;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import com.example.hms_android.databinding.ActivityComplainAddBinding;

public class ComplainAddActivity extends HomeActivity {
    ActivityComplainAddBinding activityComplainAddBinding;
    Button btnScanQRCode;
    EditText category, subject, description;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        activityComplainAddBinding = ActivityComplainAddBinding.inflate(getLayoutInflater());
        allocateActivityTitle("Complain ADD");
        setContentView(activityComplainAddBinding.getRoot());

        Button btnScanQRCode = findViewById(R.id.btnScanQRCode);
        category = findViewById(R.id.etCategory);
        subject = findViewById(R.id.etSubject);
        description = findViewById(R.id.etDescription);

        btnScanQRCode.setOnClickListener(new View.OnClickListener() {
                                             @Override
                                             public void onClick(View v) {
                                                 // Start the QR code scanning activity
                                                 Intent intent = new Intent(ComplainAddActivity.this, QRCodeScannerActivity.class);
                                                 startActivityForResult(intent, 1); // Use requestCode 1 (you can change it as needed)
                                             }
                                         }
        );
    }

    // Handle the result from QRCodeScannerActivity
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 1 && resultCode == RESULT_OK) {
            // Get the scanned QR code from the result
            String scannedQRCode = data.getStringExtra("scannedQRCode");

            // Set the scanned QR code in the category EditText
            category.setText(scannedQRCode);
        }
    }
}
