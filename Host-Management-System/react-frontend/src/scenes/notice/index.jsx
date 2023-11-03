import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

function Noticetable() {
  const [data, setData] = useState([]);

  useEffect(() => {
    // Fetch data from your API or database
    axios.get("http://localhost:8080/notices/all")
      .then(response => {
        setData(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return (
    <>
            <Box display="flex">
            <Sidebar />
            <Box flex="1">
            <Topbar />

                <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 
                {/* <Box m="20px" />  */}

                <Box p={2}>
                    <Header title="Notice" subtitle="Managing all the Notices" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}>
                            <div className='container mt-5'>
                                <div className='py-4'>
                                    <table className="table border shadow">
                                        
                                        {/* <table style={{ border: '1px solid black', borderCollapse: 'collapse' }}> */}
                                          <thead>
                                            <tr>
                                              <th>ID</th>
                                              <th>Date</th>
                                              <th>Subject</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            {data.map(item => (
                                              <tr key={item.id}>
                                                <td style={{ border: '1px solid black' }}>{item.noticeId}</td>
                                                <td style={{ border: '1px solid black' }}>{item.date}</td>
                                                <td style={{ border: '1px solid black' }}>{item.subject}</td>
                                              </tr>
                                            ))}
                                          </tbody>
                                          </table>
                                </div>
                            </div>                       
                    </Box>
            </Box>
            </Box>
            </Box>         
        </>
  );
}

export default Noticetable;