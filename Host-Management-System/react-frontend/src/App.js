import { Routes, Route, BrowserRouter } from 'react-router-dom';

import { ColorModeContext, useMode } from './theme';
import {CssBaseline, ThemeProvider} from "@mui/material";

//import Dash from './Dashboard';
//import Registration from './Registration';

import Registration from './Registration';
import Login from './Login';
import Forgot from './ForgotPage';
// import Import from './Import';
import Importsample from './Importsample';
import 'bootstrap/dist/css/bootstrap.min.css';

import Dashboard from './scenes/dashboard';
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

                {/* <Route path="/topbar" element={<Topbar />} /> */}
                {/* <Route path="/sidebar" element={<Sidebar />} /> */}
              </Routes>
            </div>
            </BrowserRouter>
          </main>
      </div>

      </ThemeProvider>

    </ColorModeContext.Provider>


    <div className="App">
      <BrowserRouter>
      <div>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/forgot" element={<Forgot />} />
          <Route path="/registration" element={<Registration />} />
          {/* <Route path="/import" element={<Import />} /> */}
          <Route path="/importsample" element={<Importsample />} />
        </Routes>
      </div>
    </BrowserRouter>
    </div>
    </>
  );
}

export default App;
