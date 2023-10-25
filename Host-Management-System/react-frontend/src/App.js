import { Routes, Route, BrowserRouter } from 'react-router-dom';
import './App.css';
import Dashboard from './Dashboard';

import Registration from './Registration';
import Login from './Login';
import Forgot from './ForgotPage';


function App() {
  return (
    
    <BrowserRouter>
      <div>
        <Routes>
          <Route path="/signin" element={<Login />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/forgot" element={<Forgot />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;


