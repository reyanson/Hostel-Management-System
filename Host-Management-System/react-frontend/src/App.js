import { Routes, Route, BrowserRouter } from 'react-router-dom';

import { ColorModeContext, useMode } from './theme';
import {CssBaseline, ThemeProvider} from "@mui/material";
import 'bootstrap/dist/css/bootstrap.min.css';

import Registration from './Registration';
import Login from './Login';
import Forgot from './ForgotPage';
import Import from './ImportRegistration';
import Dashboard from './scenes/dashboard';
import Studentlist from './scenes/students';

//import Topbar from './scenes/global/Topbar';
//import Sidebar from './scenes/global/Sidebar';


function App() {
  const [theme, colorMode] = useMode();

  return (
    <>
    <ColorModeContext.Provider value = {colorMode}>
      <ThemeProvider theme={theme}>

        <CssBaseline />

        <div className="App">
          <main className='content'>
            
            <BrowserRouter>
            <div>
              <Routes>
                <Route path="/" element={<Login />} />
                <Route path="/forgot" element={<Forgot />} />
                <Route path="/home" element={<Dashboard />} />
                <Route path="/registration" element={<Registration />} />
                <Route path="/importRegistration" element={<Import />} />
                <Route path="/studentlist" element={<Studentlist />} />

                {/* <Route path="/topbar" element={<Topbar />} /> */}
                {/* <Route path="/sidebar" element={<Sidebar />} /> */}
              </Routes>
            </div>
            </BrowserRouter>
          </main>
      </div>

      </ThemeProvider>

    </ColorModeContext.Provider>

    </>
  );
}

export default App;
