import { useState } from "react";


export default function Registration(){

  const [firstname,setFirstname] = useState("");
  const [lastname,setLastname] = useState("");
  const [email,setEmail] = useState("");
  const [nic,setNic] = useState("");
  const [personalnum,setPersonalnum] = useState("");
  const [officenum,setOfficenum] = useState("");

  async function save (event){
    
  }
    return(
        <div>
          <div class="container mt-4">
          <div class="card">
            <h1>User Registration</h1>
            <form>
              <div class="form-group">
                <label>First Name</label>
                <input type="text" class="form-control" id="firstname" 
                placeholder="Enter First Name" value={firstname}
                onChange={(event)=> {setFirstname(event.target.value);
                } } 
                />
              </div>
              <div class="form-group">
                <label>Last Name</label>
                <input type="text" class="form-control" id="lastname" 
                placeholder="Enter Last Name" value={lastname}
                onChange={(event)=> {setLastname(event.target.value);
                } } 
                />
              </div>
              <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" id="email" 
                placeholder="Enter email" value={email}
                onChange={(event)=> {setEmail(event.target.value);
                } } 
                />
              </div>
              <div class="form-group">
                <label>NIC</label>
                <input type="text" class="form-control" id="nic" 
                placeholder="Enter NIC" value={lastname}
                onChange={(event)=> {setNic(event.target.value);
                } } 
                />
              </div>
              <div class="form-group">
                <label>Personal Number</label>
                <input type="text" class="form-control" id="personalnum" 
                placeholder="Enter personalnum" value={personalnum}
                onChange={(event)=> {setPersonalnum(event.target.value);
                } } 
                />
              </div>
              <div class="form-group">
                <label>Office Number</label>
                <input type="text" class="form-control" id="officenum" 
                placeholder="Enter officenum" value={officenum}
                onChange={(event)=> {setOfficenum(event.target.value);
                } } 
                />
              </div>
            </form>
          </div>
          </div>
        </div>
    );
}