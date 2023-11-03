import { Routes, Route, BrowserRouter } from 'react-router-dom';
import { ColorModeContext, useMode } from './theme';
import {CssBaseline, ThemeProvider} from "@mui/material";
import 'bootstrap/dist/css/bootstrap.min.css';

import Registration from './Registration';
import Login from './Login';
import Forgot from './Components/ForgotPage';
import Import from './Components/ImportRegistration';
import Dashboard from './scenes/dashboard';

import Notice from './Components/Notice';
import Noticetable from './scenes/notice/Noticetable';
import Studentlist from './scenes/students';
import ComplainTable from './scenes/complain';


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
                <Route path="/registration" element={<Registration />} />
                <Route path="/importRegistration" element={<Import />} />


                <Route path="/studentlist" element={<Studentlist />} />
                <Route path="/notice" element={<Notice />} />
                <Route path="/noticetable" element={<Noticetable />} />
                <Route path="/complaintable" element={<ComplainTable />} />

              </Routes>
            </BrowserRouter>
          </div>
      </ThemeProvider>
    </ColorModeContext.Provider>

    </>
  );
}

export default App;
