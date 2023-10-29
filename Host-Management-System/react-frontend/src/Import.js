import React, { useState } from "react";
import { TextField, Grid, Button, Typography, Container } from "@mui/material";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { Table, TableHead, TableRow, TableCell, TableBody } from "@mui/material";
import * as XLSX from "xlsx";
import axios from "axios"; 
import Box from "@mui/material/Box";

const theme = createTheme({
  typography: {
    button: {
      textTransform: "capitalize",
      "&:first-letter": {
        textTransform: "uppercase",
      },
    },
  },
});

const isValidNIC = (nic) => {
  // the regular expression pattern for the NIC format
  const nicPattern = /^[0-9]{9}[vVxX]$/;

  // Check if the NIC matches the pattern
  return nicPattern.test(nic);
};

const isValidPhoneNumber = (phone_no) => {
  // Remove any non-numeric characters from the WhatsApp number
  const formattedValue = phone_no.replace(/\D/g, '');

  // WhatsApp numbers should be at least 10 digits long
  if (formattedValue.length < 10) {
    return false;
  }

  // Check if the formatted value contains only digits (no special characters or text)
  if (!/^\d+$/.test(formattedValue)) {
    return false;
  }

  return true;
};

const isValidEmail = (Email) => {
  // the regular expression pattern for email validation
  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  // Check if the email matches the pattern
  return emailPattern.test(Email);
};

const IndividualData = ({ individualExcelData }) => {
  return (
    <TableRow>
      <TableCell>{individualExcelData.Id}</TableCell>
      <TableCell>{individualExcelData.first_Name}</TableCell>
      <TableCell>{individualExcelData.last_Name}</TableCell>
      <TableCell>{individualExcelData.Email}</TableCell>
      <TableCell>{individualExcelData.nic}</TableCell>
      <TableCell>{individualExcelData.address}</TableCell>
      <TableCell>{individualExcelData.phone_no}</TableCell>
    </TableRow>
  );
};

const Data = ({ excelData }) => {
  return (
    <Table>
      <TableHead>
        <TableRow>
          <TableCell>ID</TableCell>
          <TableCell>First Name</TableCell>
          <TableCell>Last Name</TableCell>
          <TableCell>Email</TableCell>
          <TableCell>NIC</TableCell>
          <TableCell>Address</TableCell>
          <TableCell>Phone Number</TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {excelData.map((individualExcelData) => (
          <IndividualData key={individualExcelData.Id} individualExcelData={individualExcelData} />
        ))}
      </TableBody>
    </Table>
  );
};

function Import() {
  const [excelFile, setExcelFile] = useState(null);
  const [excelFileError, setExcelFileError] = useState(null);
  const [excelData, setExcelData] = useState([]);

  const handleFile = async (e) => {
    let selectedFile = e.target.files[0];
    if (selectedFile) {
      if (selectedFile.name.endsWith(".xlsx")) {
        try {
          const fileReader = new FileReader();
          fileReader.readAsArrayBuffer(selectedFile);
          fileReader.onload = (e) => {
            const data = new Uint8Array(e.target.result);
            const workbook = XLSX.read(data, { type: "array" });
            const worksheetName = workbook.SheetNames[0];
            const worksheet = workbook.Sheets[worksheetName];
            const jsonData = XLSX.utils.sheet_to_json(worksheet);
            setExcelData(jsonData);
            setExcelFileError(null);
          };
        } catch (error) {
          console.error("Error reading the Excel file:", error);
          setExcelFile(null);
          setExcelFileError(
            "Error reading the Excel file. Please select a valid Excel file."
          );
        }
      } else {
        setExcelFile(null);
        setExcelFileError("Please select a valid .xlsx file.");
      }
    } else {
      console.log("Please select your file");
    }
  };

  const handleRegistration = async () => {
    console.log("it is work");
  
    if (excelData.length > 0) {
      // Validate each data item before sending to the backend
      const isDataValid = excelData.every((item) => {
        const isNICValid = isValidNIC(item.nic);
        const isPhoneNumberValid = isValidPhoneNumber(item.phone_no);
        const isEmailValid = isValidEmail(item.Email);
  
        return (
          isNICValid &&
          isPhoneNumberValid &&
          isEmailValid
        );
      });
  
      if (!isDataValid) {
        console.log("Invalid data. Please check NIC, WhatsApp number, Personal email.");
        return;
      }
  
      // Combine user data and position data into a single array of objects
      const dataToStore = excelData.map((item) => ({
        user: {
          first_Name: item.first_Name,
          last_Name: item.last_Name,
          Email: item.Email,
          nic: item.NIC,
          phone_no: item.phone_no,
          address: item.Address,
        },
      }));

      try {
        // Post data to the "student" table in an  API call
        await axios.post('http://localhost:8080/student/uploadStudent', dataToStore);

        console.log("Data registered successfully.");
      } catch (error) {
        console.error("Error while registering data:", error);
      }
      } else {
        console.log("No data to register.");
      }
    };
  

  return (
    <>
      <Box height={30} />
      <Box sx={{ display: "flex" }}>
        <Box mt={-5} ml={-50} component="main" sx={{ flexGrow: 1, p: 3 }}>
          <ThemeProvider theme={theme}>
            <Container maxWidth="md">
              {/* Upload file section */}
              <form autoComplete="off">
                <Grid container spacing={2} alignItems="center">
                  <Grid item xs={12}>
                    <Typography variant="h6">Import an Excel file</Typography>
                  </Grid>
                  <Grid item xs={8}>
                    <TextField type="file" fullWidth onChange={handleFile} required />
                  </Grid>
                  <Grid item xs={4}>
                    <Button type="submit" variant="contained" color="success" sx={{ fontSize: "16px" }} style={{ padding: "11px 25px" }} onClick={handleRegistration}>
                      Register Users
                    </Button>
                  </Grid>
                  <Grid item xs={12}>
                    {excelFileError && (
                      <Typography variant="body2" color="error">
                        {excelFileError}
                      </Typography>
                    )}
                  </Grid>
                </Grid>
              </form>

              <br />

              {/* View file section */}
              <div className="viewer">
                {excelData.length > 0 && (
                  <div className="table-responsive">
                    <Table
                      sx={{
                        minWidth: "100%",
                        borderRadius: "5px",
                        boxShadow: "0 2px 4px rgba(0, 0, 0, 0.1)",
                      }}
                    >
                      <Data excelData={excelData} />
                    </Table>
                  </div>
                )}
              </div>
            </Container>
          </ThemeProvider>
        </Box>
      </Box>
    </>
  );
}

export default Import;