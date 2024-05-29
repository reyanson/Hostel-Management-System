import React, { useState, useEffect } from 'react';
import axios from 'axios';
import qr from 'qrcode';
import {
  Paper,
  TextField,
  Button,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Typography,
} from '@mui/material';
import jsPDF from 'jspdf';
import 'jspdf-autotable';
import { Box } from '@mui/material';
import Header from './Header';
import Topbar from '../scenes/global/Topbar';
import Sidebar from '../scenes/global/Sidebar';

const RoomAssetList = () => {
  const [roomAssets, setRoomAssets] = useState([]);
  const [roomNo, setRoomNo] = useState(0);
  const [qrCodes, setQRCodes] = useState([]);
  const [error, setError] = useState('');

  const validateRoomNumber = (roomNumber) => {
    if (
      (roomNumber >= 101 && roomNumber <= 128) ||
      (roomNumber >= 201 && roomNumber <= 228) ||
      (roomNumber >= 301 && roomNumber <= 328) ||
      (roomNumber >= 401 && roomNumber <= 428)
    ) {
      return true;
    }
    return false;
  };

  const fetchRoomAssets = async () => {
    if (validateRoomNumber(roomNo)) {
      setError('');
      try {
        const response = await axios.get(`http://192.168.8.115:8080/room-assets/viewall/${roomNo}`);
        setRoomAssets(response.data);
      } catch (error) {
        console.error('Error fetching room assets:', error);
      }
    } else {
      setError('Invalid room number. Please enter a valid room number.');
    }
  };

  useEffect(() => {
    fetchRoomAssets();
  }, [roomNo]);

  const displayAllQRCodes = async () => {
    if (validateRoomNumber(roomNo)) {
      setError('');
      const qrCodeResults = await Promise.all(
        roomAssets.map(async (asset) => {
          const assetCode = asset.split('/')[0];
          const qrCodeData = `${assetCode}/${roomNo}`;
          const assetName = asset.split('/')[1];
          return { assetCode, assetName, qrCode: await generateQRCode(qrCodeData) };
        })
      );

      setQRCodes(qrCodeResults);
    } else {
      setError('Invalid room number. Please enter a valid room number.');
    }
  };

  const generateQRCode = async (data) => {
    try {
      const qrCode = await qr.toDataURL(data);
      return qrCode;
    } catch (error) {
      console.error('Error generating QR code:', error);
      return '';
    }
  };

  const handlePrint = () => {
    if (qrCodes.length > 0) {
      setError('');
      const pdf = new jsPDF();
      const totalPages = Math.ceil(qrCodes.length / 6);

      for (let i = 0; i < totalPages; i++) {
        if (i > 0) {
          pdf.addPage();
        }
        pdf.text(`Room Number is ${roomNo} (Page ${i + 1}/${totalPages})`, 10, 10);

        const startIndex = i * 6;
        const endIndex = startIndex + 6;
        const pageData = qrCodes.slice(startIndex, endIndex);

        let x = 10;
        let y = 30;
        pageData.forEach((qrCodeData, index) => {
          pdf.addImage(qrCodeData.qrCode, 'PNG', x, y, 60, 60);
          pdf.text(qrCodeData.assetName, x, y + 65);
          x += 70;
          if (index === 2) {
            x = 10;
            y += 90;
          }
        });
      }

      pdf.save("Room No "+roomNo+' qr_codes.pdf');
    } else {
      setError('No QR codes to print. Please fetch and display QR codes first.');
    }
  };

  return (
    <>
      <Box display="flex">
      <Sidebar />
      <Box flex="1">
      <Topbar />

          <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 

          <Box p={2}>
              <Header title="QR Code Generation" subtitle="Creating room assets QR code" />
          </Box>  

          <Box sx={{ display: 'flex' }}> 
          <Box mt={-15} ml={40}>          
                      <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh' }}>
                        <Paper elevation={3} style={{ padding: '20px', margin: '20px', maxWidth: '800px' }}>
                          <Typography variant="h4" gutterBottom>
                          <center>Print the Room Asset QR code</center>
                          </Typography>
                          <TextField
                            type="number"
                            label="Enter Room No"
                            value={roomNo}
                            onChange={(e) => setRoomNo(e.target.value)}
                            fullWidth
                            margin="normal"
                          />
                          {error && <Typography variant="body2" color="error">{error}</Typography>}
                          
                          <Button variant="contained" color="primary" onClick={displayAllQRCodes} fullWidth>
                            Show All QR Codes
                          </Button>
                          
                          <Button variant="contained" color="primary" onClick={handlePrint} fullWidth>
                            Print
                          </Button>

                          <TableContainer component={Paper} style={{ marginTop: '20px' }}>
                            <Table>
                              <TableHead>
                                <TableRow>
                                  <TableCell>Asset Name</TableCell>
                                  <TableCell>QR Code</TableCell>
                                </TableRow>
                              </TableHead>
                              <TableBody>
                                {qrCodes.map((qrCodeData, index) => (
                                  <TableRow key={index}>
                                    <TableCell>{qrCodeData.assetName}</TableCell>
                                    <TableCell>
                                      <img src={qrCodeData.qrCode} alt={`QR Code ${index}`} style={{ width: '150px', height: 'auto' }} />
                                    </TableCell>
                                  </TableRow>
                                ))}
                              </TableBody>
                            </Table>
                          </TableContainer>
                        </Paper>
                      </div>  
                      </Box>             
              </Box>
      </Box>
      </Box>        
    </>
  );
}
export default RoomAssetList;
