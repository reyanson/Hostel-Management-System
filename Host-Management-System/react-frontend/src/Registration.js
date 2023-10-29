import { useState } from "react";
import axios from "axios";

export default function Registration(){

  const [firstname,setFirstname] = useState("");
  const [lastname,setLastname] = useState("");
  const [email,setEmail] = useState("");
  const [nic,setNic] = useState("");
  const [personalnum,setPersonalnum] = useState("");
  const [officenum,setOfficenum] = useState("");

  async function save (event){
    event.preventDefault();
    try{
      await axios.post("http://localhost:8080/api/v1/", {
      firstname : firstname,
      lastname : lastname,
      email : email,
      nic : nic,
      personalnum : personalnum,
      officenum :officenum,
    });
    alert("User Registation Successfully");
      }catch(err){
        alert (err);
    }
  }
    return(
        <div className="container">
          <div className="row">
          <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
            <h2 className="text-center m-4">User Registration</h2>
            <form>
              <div className="mb-3">
                <label className="form-label">First Name</label>
                <input type="text" className="form-control" id="firstname" 
                placeholder="Enter First Name" value={firstname}
                onChange={(event)=> {setFirstname(event.target.value);
                } } 
                />
              </div>
              <div className="mb-3">
                <label className="form-label">Last Name</label>
                <input type="text" className="form-control" id="lastname" 
                placeholder="Enter Last Name" value={lastname}
                onChange={(event)=> {setLastname(event.target.value);
                } } 
                />
              </div>
              <div className="mb-3">
                <label className="form-label">Email</label>
                <input type="text" className="form-control" id="email" 
                placeholder="Enter email" value={email}
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
                <label className="form-label">Personal Number</label>
                <input type="text" className="form-control" id="personalnum" 
                placeholder="Enter personalnum" value={personalnum}
                onChange={(event)=> {setPersonalnum(event.target.value);
                } } 
                />
              </div>
              <div className="mb-3">
                <label className="form-label">Office Number</label>
                <input type="text" className="form-control" id="officenum" 
                placeholder="Enter officenum" value={officenum}
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
    );
}