import React, { useState } from 'react';
import axios from 'axios';
import * as XLSX from 'xlsx';
import Box from '@mui/material/Box';
import Header from './Header';
import {Button,Paper,Table,TableContainer,TableHead,TableBody,TableRow,TableCell,Input} from '@mui/material';
import Topbar from '../scenes/global/Topbar';
import Sidebar from '../scenes/global/Sidebar';
import {tokens} from "../theme";
import { useTheme } from '@emotion/react';

function StudentUpload() {
  const [file, setFile] = useState(null);
  const [excelData, setExcelData] = useState([]);
  const [showTable, setShowTable] = useState(false);

  const theme = useTheme();
  const colors = tokens(theme.palette.mode);

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
    <>
    <Box
      sx={{
        "& .pro-sidebar-inner": {
          background: `${colors.primary[400]} !important`,
          marginTop: "0",
        },
        "& .pro-icon-wrapper": {
          backgroundColor: "transparent !important",
        },
        "& .pro-inner-item": {
          padding: "5px 35px 5px 20px !important",
        },
        "& .pro-inner-item:hover": {
          color: "#868dfb !important",
        },
        "& .pro-menu-item.active": {
          color: "#6870fa !important",
        },
      }}
    >
    <Box display="flex">
    <Sidebar />
    <Box flex="1">
    <Topbar />

        <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 
        {/* <Box m="20px" />  */}

        <Box p={2}>
            <Header title="Registration" subtitle="Student registration by importing an excel sheet" />
        </Box>  

        <Box sx={{ display: 'flex' }}>            
            <Box mt={-6} ml={4}>

                {/* <Container maxWidth="md"> */}
                <div className='container mt-5'>
                  <Paper elevation={3} style={{ padding: '20px', marginTop: '20px' }}>
                    <h3>Select an Excel file </h3>
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
                          Import
                        </Button>
                      </div>
                    )}
                  </Paper>
                {/* </Container> */}
                </div>
                </Box>
            </Box>
            </Box>
            </Box>
            </Box> 
        </>
  );
}

export default StudentUpload;
