import React, { useEffect, useState } from 'react';
import { Box } from "@mui/material";
import axios from "axios";
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';
import DeanSidebar from '../global/DeanSidebar';
import Header from '../../Components/Header';

function Dashboard() {
  const [occation, setOccation] = useState("");

  useEffect(() => {
    loadSidebar();
  }, []);

  const loadSidebar = async () => {
    try {
      const response = await axios.get("http://192.168.8.115:8080/api/v1/login");
      setOccation(response.data.occasion);
    } catch (error) {
      console.error(error);
    }
  };

  return (
  <Box display="flex">
    {/* {occation === "warden" || occation === "subwarden" ? <Sidebar /> : occation === "dean" ? <DeanSidebar /> : null} */}
    {occation === "warden" || occation === "subwarden" ? <Sidebar /> : <DeanSidebar />}
    {/* {occation === "warden" || occation === "subwarden" ? <Sidebar /> : <DeanSidebar />} */}
    <Box flex="1">
      <Topbar />
      <Box p={2}>
        <Header title="DASHBOARD" subtitle="Welcome to your dashboard" />
      </Box>
    </Box>
  </Box>
);

}

export default Dashboard;



// import {Box} from "@mui/material";
// import Topbar from '../global/Topbar';
// import Sidebar from '../global/Sidebar';
// import Header from '../../Components/Header';


// function Dashboard() {

//     return (
//       <Box display="flex">
//             <Sidebar />     
//         <Box flex="1">
//           <Topbar />
//           <Box p={2}>
//             <Header title="DASHBOARD" subtitle="Welcome to your dashboard" />
//           </Box>
//         </Box>
//       </Box>
//     );
//   }
    
// export default Dashboard;