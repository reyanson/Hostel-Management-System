import React, { useEffect, useState } from 'react';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import axios from 'axios';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

export default function RoomAssetsTable() {
    const [data, setData] = useState([]);

    useEffect(() => {
      loadAssets();
  }, []);
  
  
  const loadAssets = async () => {
    try {
        const response = await axios.get("http://192.168.8.115:8080/room-assets/get-all-asset-info");
        setData(response.data);
    } catch (error) {
        console.error('Error fetching', error);
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
                    <Header title="Assets" subtitle="Managing all the Assets" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}>
                    <div className='container mt-5'>
                                <div className='py-4'>
                                    <table className="table border shadow">
                                        
                                        {/* <table style={{ border: '1px solid black', borderCollapse: 'collapse' }}> */}
                                          <thead>
                                            <tr>
                                              <th>Name</th>
                                              <th>Room</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            {data.map(item => (
                                              <tr key={item.id}>
                                                <td>{item.name}</td>
                                                <td>{item.room_no}</td>
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
