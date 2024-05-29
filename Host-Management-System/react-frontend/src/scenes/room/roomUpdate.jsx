import { Link, useNavigate, useParams } from "react-router-dom";
import axios from "axios";
import React, { useState } from "react";
import { Box } from '@mui/material';
import Topbar from '../../scenes/global/Topbar';
import Sidebar from '../../scenes/global/Sidebar';
import '../../index.css';

function RoomUpdate() {
  const navigate = useNavigate();

  const { roomId } = useParams();

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

    try {
      const response = await axios.put(`http://192.168.8.115:8080/update/${roomId}`,
        null,
        {
          params: {
            newRoomNum: roomNum,
            newFloor: floor,
            newRegNo: regNo,
          },
        }
      );

      if (response.status === 200) {
        navigate("/roomdatas");
      } else {
        console.log("Room update failed");
      }
    } catch (error) {
      console.error("An error occurred while updating the room:", error);
    }
  };

  return (
    <>
      <Box display="flex">
        <Sidebar />
        <Box flex="1">
          <Topbar />
          <Box sx={{ display: 'flex' }}>
            <Box mt={-6} ml={10}>
              <div className='container mt-5'>
                <div className='py-4'>
                  <div className="col-md-12 border rounded p-4 mt-2 shadow" style={{ width: '600px', height: '400px' }}>
                    <form onSubmit={(e) => onSubmit(e)} className="custom-form">
                        <div>
                            <h3 align="center">Update the Room Details</h3>
                        </div>
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

export default RoomUpdate;
