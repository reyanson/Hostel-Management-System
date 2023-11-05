import { useState } from "react";
import axios from "axios";
import Box from '@mui/material/Box';
import Header from './Header';
import Topbar from '../scenes/global/Topbar';
import Sidebar from '../scenes/global/Sidebar';

export default function Registration(){

  const [first_Name,setFirstname] = useState("");
  const [last_Name,setLastname] = useState("");
  const [Email,setEmail] = useState("");
  const [nic,setNic] = useState("");
  const [address, setAddress] = useState("");
  const [personal_no,setPersonalnum] = useState("");
  const [office_no,setOfficenum] = useState("");
  const [position, setPosition] = useState("");

  async function save (event){
    event.preventDefault();
    try{
      await axios.post(`http://localhost:8080/api/user/insert/${position}`, {
      first_Name : first_Name,
      last_Name : last_Name,
      email : Email,
      nic : nic,
      address: address,
      personal_no : personal_no,
      office_no :office_no,
      
    });
    alert("User Registation Successfully");
      }catch(err){
        alert (err);
    }
  }
    return(
      <>
      <Box display="flex">
      <Sidebar />
      <Box flex="1">
      <Topbar />

          <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 

          <Box p={2}>
              <Header title="Rooms" subtitle="Managing all the Rooms" />
          </Box>  

          <Box sx={{ display: 'flex' }}>            
              <Box mt={-6} ml={4}>
                  <div className='container mt-5'>
                      <div className="row">
                      <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow" style={{ width: '600px', height: '850px' }}>
                        <h2 className="text-center m-4">User Registration</h2>
                        <form>
                          <div className="mb-3">
                            <label className="form-label">First Name</label>
                            <input type="text" className="form-control" id="firstname" 
                            placeholder="Enter First Name" value={first_Name}
                            onChange={(event)=> {setFirstname(event.target.value);
                            } } 
                            />
                          </div>
                          <div className="mb-3">
                            <label className="form-label">Last Name</label>
                            <input type="text" className="form-control" id="lastname" 
                            placeholder="Enter Last Name" value={last_Name}
                            onChange={(event)=> {setLastname(event.target.value);
                            } } 
                            />
                          </div>
                          <div className="mb-3">
                            <label className="form-label">Email</label>
                            <input type="text" className="form-control" id="email" 
                            placeholder="Enter email" value={Email}
                            onChange={(event)=> {setEmail(event.target.value);
                            } } 
                            />
                          </div>
                          <div className="mb-3">
                            <label className="form-label">NIC</label>
                            <input type="text" className="form-control" id="nic" 
                            placeholder="Enter NIC" value={nic}
                            onChange={(event)=> {setNic(event.target.value);
                            } } 
                            />
                          </div>
                          <div className="mb-3">
                            <label className="form-label">Address</label>
                            <input type="text" className="form-control" id="address" 
                            placeholder="Enter address" value={address}
                            onChange={(event)=> {setAddress(event.target.value);
                            } } 
                            />
                          </div>
                          <div className="mb-3">
                          <label className="form-label">Position</label>
                          <select
                            className="form-control" id="position"
                            value={position}
                            onChange={(event) => {
                              setPosition(event.target.value);
                            }}
                          >
                            <option value="">Select a position</option>
                            <option value="Warden">Warden</option>
                            <option value="Subwarden">Subwarden</option>
                            <option value="Security">Security</option>
                          </select>
                        </div>
                          <div className="mb-3">
                            <label className="form-label">Personal Number</label>
                            <input type="text" className="form-control" id="personalnum" 
                            placeholder="Enter personalnum" value={personal_no}
                            onChange={(event)=> {setPersonalnum(event.target.value);
                            } } 
                            />
                          </div>
                          <div className="mb-3">
                            <label className="form-label">Office Number</label>
                            <input type="text" className="form-control" id="officenum" 
                            placeholder="Enter officenum" value={office_no}
                            onChange={(event)=> {setOfficenum(event.target.value);
                            } } 
                            />
                          </div>
                          <button type="submit" className="btn btn-outline-primary" onClick={save}>Register</button>
                          <button type="reset" className="btn btn-outline-danger mx-2">Clear</button>
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