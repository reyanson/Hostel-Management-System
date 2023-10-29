import React, { useState } from 'react';
import axios from 'axios';
import * as XLSX from 'xlsx';
import {
  Button,
  Container,
  Paper,
  Table,
  TableContainer,
  TableHead,
  TableBody,
  TableRow,
  TableCell,
  Input,
} from '@mui/material';

function StudentUpload() {
  const [file, setFile] = useState(null);
  const [excelData, setExcelData] = useState([]);
  const [showTable, setShowTable] = useState(false);

  const handleFileChange = (event) => {
    const selectedFile = event.target.files[0];
    setFile(selectedFile);

    if (selectedFile) {
      const reader = new FileReader();
      reader.onload = async (e) => {
        const data = new Uint8Array(e.target.result);
        try {
          const workbook = XLSX.read(data, { type: 'array' });
          const sheetName = workbook.SheetNames[0];
          const sheet = workbook.Sheets[sheetName];
          const jsonData = XLSX.utils.sheet_to_json(sheet, { header: 1 });
          setExcelData(jsonData);
          setShowTable(true);
        } catch (error) {
          console.error('Error processing Excel data:', error);
        }
      };
      reader.readAsArrayBuffer(selectedFile);
    }
  };

  const handleUpload = async () => {
    if (file && excelData.length > 0) {
      const formData = new FormData();
      formData.append('file', file);

      try {
        const response = await axios.post('http://localhost:8080/student/uploadStudent', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        });

        console.log('Response from the server:', response.data);
      } catch (error) {
        console.error('Error uploading file:', error);
      }
    }
  };

  return (
    <Container maxWidth="md">
      <Paper elevation={3} style={{ padding: '20px', marginTop: '20px' }}>
        <h1>Upload and View Student Data</h1>
        <Input type="file" accept=".xlsx" onChange={handleFileChange} />

        {showTable && excelData && excelData.length > 0 && (
          <div>
            <h2>Excel Data</h2>
            <TableContainer component={Paper}>
              <Table>
                <TableHead>
                  <TableRow>
                    {excelData[0].map((cell, index) => (
                      <TableCell key={index}>{cell}</TableCell>
                    ))}
                  </TableRow>
                </TableHead>
                <TableBody>
                  {excelData.slice(1).map((row, rowIndex) => (
                    <TableRow key={rowIndex}>
                      {row.map((cell, cellIndex) => (
                        <TableCell key={cellIndex}>{cell}</TableCell>
                      ))}
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
            <Button variant="contained" color="primary" onClick={handleUpload}>
              Upload
            </Button>
          </div>
        )}
      </Paper>
    </Container>
  );
}

export default StudentUpload;
