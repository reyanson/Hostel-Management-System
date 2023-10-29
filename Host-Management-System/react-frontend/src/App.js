import { Routes, Route, BrowserRouter } from 'react-router-dom';
import Dashboard from './Dashboard';
import Registration from './Registration';
import Login from './Login';
import Forgot from './ForgotPage';
// import Import from './Import';
import Importsample from './Importsample';
import 'bootstrap/dist/css/bootstrap.min.css';


function App() {
  return (
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
  );
}

export default App;


