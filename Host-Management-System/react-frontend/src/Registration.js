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
                <label>Last Name</label>
                <input type="text" class="form-control" id="personalnum" 
                placeholder="Enter personalnum" value={personalnum}
                onChange={(event)=> {setPersonalnum(event.target.value);
                } } 
                />
              </div>
              <div class="form-group">
                <label>Last Name</label>
                <input type="text" class="form-control" id="officenum" 
                placeholder="Enter officenum" value={officenum}
                onChange={(event)=> {setOfficenum(event.target.value);
                } } 
                />
              </div>
            </form>
          </div>
          </div>

          {/* <form onSubmit={(e) => onSubmit(e)}>
            <div className="mb-3">
              <label htmlFor="Userid" className="form-label">
                User Id
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter team leader id"
                name="u_id"
                //value={u_id}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Mtitle" className="form-label">
                Meeting Title/Type
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter meeting title"
                name="meeting_title"
                //value={meeting_title}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Aid" className="form-label">
                Attendees Id
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter attendees id"
                name="attendees_id"
                value={attendees_id}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Status" className="form-label">
                Status
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter attendees status"
                name="attendance_status"
                value={attendance_status}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Date" className="form-label">
                Meeting Date
              </label>
              <input
                type={"date"}
                className="form-control"
                placeholder="Select the date"
                name="meeting_date"
                value={meeting_date}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Remark" className="form-label">
                Remark
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter the remark"
                name="remark"
                value={remark}
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <button type="submit" className="btn btn-outline-primary">
              Marking
            </button>
            <Link className="btn btn-outline-danger mx-2" to="/">
              Cancel
            </Link>
          </form> */}

        </div>
    );
}