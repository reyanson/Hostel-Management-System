import { Link, useParams } from "react-router-dom";
import React, { useEffect, useState, useNavigate } from 'react';
import axios from "axios";
import { Box } from '@mui/material';
import Header from '../../Components/Header';
import Topbar from '../../scenes/global/Topbar';
import Sidebar from '../../scenes/global/Sidebar';
import '../../index.css';

function studentUpdate() {
  let navigate = useNavigate();

  const {regNo} = useParams();
  
  const [student, setStudent] = useState({
    reg_no: "",
    first_Name: "",
    last_Name: "",
    Email: "",
    nic: "",
    address: "",
    phone_no: "",
  });

  const { reg_no, first_Name, last_Name, Email, nic, address, phone_no } = student;

  const onInputChange = (e) => {
    setStudent({ ...student, [e.target.name]: e.target.value });
  };

  useEffect(() => {
    loadStudent();
  }, []);

  const onSubmit = async (e) => {
    e.preventDefault();
    await axios.put(`http://192.168.8.115:8080//${regNo}`, student);
    navigate("/studentlist");
  };


  const loadStudent = async () => {
    const result = await axios.get(`http://192.168.8.115:8080/students/view/${regNo}`);
    setStudent(result.data);
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
            <div className="container">
                        <div className="row">
                          <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
                            <h2 className="text-center m-4">Update Student</h2>

                            <form onSubmit={(e) => onSubmit(e)}>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  Registration Number
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="reg_no"
                                  value={reg_no}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  First Name
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="first_Name"
                                  value={first_Name}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  Last Name
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="last_Name"
                                  value={last_Name}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  Email
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="Email"
                                  value={Email}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  NIC
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="nic"
                                  value={nic}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  Address
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="address"
                                  value={address}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  Phone Number
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="phone_no"
                                  value={phone_no}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <button type="submit" className="btn btn-outline-primary">
                                Submit
                              </button>
                              <Link className="btn btn-outline-danger mx-2" to="/noticetable">
                                Cancel
                              </Link>
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

export default studentUpdate;