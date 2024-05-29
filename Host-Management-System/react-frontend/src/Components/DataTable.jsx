import React, { useState, useEffect } from 'react';
import axios from 'axios';
import {
  Typography,
  List,
  ListItem,
  ListItemText,
  Paper,
  IconButton,
  Button,
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
} from '@mui/material';
import { ExpandMore as ExpandMoreIcon } from '@mui/icons-material';
import { jsPDF } from 'jspdf';
import 'jspdf-autotable';
import Box from '@mui/material/Box';
import Header from './Header';
import Topbar from '../scenes/global/Topbar';
import DeanSidebar from '../scenes/global/DeanSidebar';

const DataTable = () => {
  const [reports, setReports] = useState([]);
  const [expandedReport, setExpandedReport] = useState(null);
  const [tableData, setTableData] = useState([]);
  const [reportNames, setReportNames] = useState([]); 

  useEffect(() => {
    // Fetch your report names from one endpoint
    axios.get('http://192.168.8.115:8080/Report/all')
      .then((response) => {
        const reports = response.data;
        setReports(reports);
        const names = reports.map((report) => report.reportName);
        setReportNames(names);
      })
      .catch((error) => {
        console.error('Error fetching reports:', error);
      });
  }, []);

  useEffect(() => {
    // Fetch your table data from another endpoint when expandedReport is set
    if (expandedReport) {
      axios.get(`http://192.168.8.115:8080/Report/getReportData?viewName=${reportNames}`)
        .then((response) => {
          console.log(reportNames);
          const data = response.data;
          setTableData(data);
        })
        .catch((error) => {
          console.error('Error fetching table data:', error);
        });
    }
  }, [expandedReport]);

  const handleReportClick = (reportName) => {
    if (expandedReport === reportName) {
      setExpandedReport(null);
    } else {
      setExpandedReport(reportName);
    }
  };

  const isReportExpanded = (reportName) => expandedReport === reportName;

  const exportToPdf = () => {
    const doc = new jsPDF('p', 'mm', 'a4');

    if (expandedReport) {
      const columns = ['Full Name', 'Type', 'Asset Name', 'Room No', 'Subject', 'Descrption', 'Created Data', 'Updated Data','Action Status','Accepted By'];

      doc.text(expandedReport, 15, 15);

      doc.autoTable({
        head: [columns],
        body: tableData.map((row) => [row.name, row.type, row.asset_name, row.room_no, row.subject, row.description, row.created_date, row.updated_date,row.action_status,row.accepted_by]),
        startY: 25,
      });

      doc.save(`${expandedReport}_table_data.pdf`);
    }
  };

  return (
    <>
      <Box display="flex">
      <DeanSidebar />
      <Box flex="1">
      <Topbar />

          <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 

          <Box p={2}>
              <Header title="Report" subtitle="Generating the monthly complaint Report" />
          </Box>  

          <Box sx={{ display: 'flex' }}>            
              <Box mt={-6} ml={4}>
                  <div className='container mt-5'>
                      <div className="row">
                        {/* <Typography variant="h4" align="center" gutterBottom>
                          List of Reports
                        </Typography> */}
                        <List>
                          {reports.map((report, index) => (
                            <div key={index}>
                              <ListItem
                                button
                                onClick={() => handleReportClick(report.reportName)}
                                selected={isReportExpanded(report.reportName)}
                              >
                                <ListItemText primary={report.reportName} />
                                <IconButton
                                  edge="end"
                                  onClick={() => handleReportClick(report.reportName)}
                                  size="small"
                                  aria-label="expand"
                                >
                                  <ExpandMoreIcon
                                    color={isReportExpanded(report.reportName) ? 'primary' : 'inherit'}
                                  />
                                </IconButton>
                              </ListItem>
                              {isReportExpanded(report.reportName) && (
                                <Paper elevation={5}>
                                  <Table>
                                    <TableHead>
                                      <TableRow>
                                        <TableCell>Full Name</TableCell>
                                        <TableCell>Type</TableCell>
                                        <TableCell>Asset Name</TableCell>
                                        <TableCell>Room No</TableCell>
                                        <TableCell>Subject</TableCell>
                                        <TableCell>Descrption</TableCell>
                                        <TableCell>Created Data</TableCell>
                                        <TableCell>Updated Data</TableCell>
                                        <TableCell>Action Status</TableCell>
                                        <TableCell>Accepted By</TableCell>
                                      </TableRow>
                                    </TableHead>
                                    <TableBody>
                                      {tableData.map((row) => (
                                        <TableRow key={row.id}>
                                          <TableCell>{row.name}</TableCell>
                                          <TableCell>{row.type}</TableCell>
                                          <TableCell>{row.asset_name}</TableCell>
                                          <TableCell>{row.room_no}</TableCell>
                                          <TableCell>{row.subject}</TableCell>
                                          <TableCell>{row.description}</TableCell>
                                          <TableCell>{row.created_date}</TableCell>
                                          <TableCell>{row.updated_date}</TableCell>
                                          <TableCell>{row.action_status}</TableCell>
                                          <TableCell>{row.accepted_by}</TableCell>
                                        </TableRow>
                                      ))}
                                    </TableBody>
                                  </Table>
                                  <Button variant="contained" color="primary" fullWidth onClick={exportToPdf}>
                                    Export
                                  </Button>
                                </Paper>
                              )}
                            </div>
                          ))}
                        </List>
                        </div>
                      
                      </div>
                    </Box>
                </Box>
            </Box>
            </Box>
        </>
    );
}

export default DataTable;
