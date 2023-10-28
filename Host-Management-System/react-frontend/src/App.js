import { Routes, Route, BrowserRouter } from 'react-router-dom';
import './App.css';
import Dashboard from './Dashboard';

import Registration from './Registration';
import Login from './Login';
import Forgot from './ForgotPage';
import Import from './Import';


function App() {
  return (


    <div className="App">


      {/* <Registration /> */}


      <BrowserRouter>
      <div>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/forgot" element={<Forgot />} />
          <Route path="/registration" element={<Registration />} />
          <Route path="/import" element={<Import />} />
        </Routes>
      </div>
    </BrowserRouter>

    </div>
        
    
  );
}

export default App;


