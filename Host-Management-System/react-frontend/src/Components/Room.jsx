import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import React, { useState } from "react";
import { Box } from '@mui/material';
import Header from './Header';
import Topbar from '../scenes/global/Topbar';
import Sidebar from '../scenes/global/Sidebar';
import '../index.css';

function Room() {
  let navigate = useNavigate();

  const [room, setRoom] = useState({
    roomNum: "",
    floor: "",
    regNo: "",
  });

  const { roomNum, floor, regNo } = room;

  const onInputChange = (e) => {
    setRoom({ ...room, [e.target.name]: e.target.value });
  };

  const onSubmit = async (e) => {
    e.preventDefault();
    await axios.post("http://localhost:8080/rooms/add", room);
    navigate("/roomdatas");
  };

  return (
    <>
      <Box display="flex">
        <Sidebar />
        <Box flex="1">
          <Topbar />
          <Box mt={-1} p={2} component="main" sx={{ flexGrow: 1 }}>
            <Header title="Rooms" subtitle="Allocating Rooms for Students" />
          </Box>
          <Box sx={{ display: 'flex' }}>
            <Box mt={-6} ml={10}>
              <div className='container mt-5'>
                <div className='py-4'>
                  <div className="col-md-12 border rounded p-4 mt-2 shadow" style={{ width: '600px', height: '400px' }}>
                    <form onSubmit={(e) => onSubmit(e)} className="custom-form">

                      <div className="mb-3">
                        <label htmlFor="roomNum" className="form-label">
                          Room Number
                        </label>
                        <input
                          type="text"
                          className="form-control custom-input "
                          name="roomNum"
                          value={roomNum}
                          required
                          onChange={(e) => onInputChange(e)}
                        />
                      </div>

                      <div className="mb-3">
                        <label className="form-label">Floor</label>
                        <select
                            className="form-control" 
                            name="floor"
                            value={floor}
                            onChange={(e) => onInputChange(e)}
                        >
                            <option value="">Select a floor</option>
                            <option value="L1">L1</option>
                            <option value="L2">L2</option>
                            <option value="L3">L3</option>
                            <option value="L4">L4</option>
                        </select>
                      </div>

                      <div className="mb-3">
                        <label htmlFor="regNo" className="form-label">
                          Registration Number
                        </label>
                        <input
                          type="text"
                          className="form-control custom-input "
                          name="regNo"
                          value={regNo}
                          required
                          placeholder="TG/XXX/XXX"
                          onChange={(e) => onInputChange(e)}
                        />
                      </div>
                      
                      <Box sx={{mb:-10}}>
                        <button type="submit" className="btn btn-outline-primary">
                          Submit
                        </button>
                        <Link className="btn btn-outline-danger mx-2" to="/roomdatas">
                          Cancel
                        </Link>
                      </Box>
                    </form>
                  </div>
                </div>
              </div>
            </Box>
          </Box>
        </Box>
      </Box>
    </>
  );
}

export default Room;
