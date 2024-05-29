import { Routes, Route, BrowserRouter } from 'react-router-dom';
import { ColorModeContext, useMode } from './theme';
import {CssBaseline, ThemeProvider} from "@mui/material";
import 'bootstrap/dist/css/bootstrap.min.css';

import Login from './Login';
import Forgot from './Components/ForgotPage';
import Import from './Components/ImportRegistration';
import Registration from './Components/Registration';

import Dashboard from './scenes/dashboard';
// import DashboardWarden from './scenes/dashboard/DashboardWarden';
// import DashboardDean from './scenes/dashboard/DashboardDean';

import Notice from './Components/Notice';
import Noticetable from './scenes/notice';
import Studentlist from './scenes/students';
// import StudentUpdate from './scenes/students/studentUpdate';
import ComplainTable from './scenes/complain';
import DamageTable from './scenes/damage';
import Room from './Components/Room';
import RoomTable from './scenes/room';
import NoticeUpdate from './scenes/notice/NoticeUpdate';
import RoomUpdate from './scenes/room/roomUpdate';

import QRCodeGenerator from './Components/QRCodeGenerator';
import DataTable from './Components/DataTable';


function App() {
  const [theme, colorMode] = useMode();


  return (
    <>
    <ColorModeContext.Provider value = {colorMode}>
      <ThemeProvider theme={theme}>

        <CssBaseline />

        <div className="App">
            <BrowserRouter>
              <Routes>
                <Route path="/" element={<Login />} />
                <Route path="/forgot" element={<Forgot />} />
                <Route path="/home" element={<Dashboard />} />
                {/* <Route path="/home" element={<DashboardDean />} />
                <Route path="/home" element={<DashboardWarden />} /> */}

                <Route path="/registration" element={<Registration />} />
                <Route path="/importRegistration" element={<Import />} />


                <Route path="/studentlist" element={<Studentlist />} />
                {/* <Route path="/studentUpdate/:regNo" element={<StudentUpdate />} /> */}

                <Route path="/notice" element={<Notice />} />
                <Route path="/noticetable" element={<Noticetable />} />
                <Route path="/noticeupdate/:noticeId" element={<NoticeUpdate />} />

                <Route path="/complaintable" element={<ComplainTable />} />
                <Route path="/damagelist" element={<DamageTable />} />
                <Route path="/room" element={<Room />} />
                <Route path="/roomdatas" element={<RoomTable />} />
                <Route path="/roomUpdate" element={<RoomUpdate />} />

                <Route path='/qr' element={<QRCodeGenerator />} />
                <Route path='/table' element={<DataTable />} />

              </Routes>
            </BrowserRouter>
          </div>
      </ThemeProvider>
    </ColorModeContext.Provider>

    </>
  );
}

export default App;
