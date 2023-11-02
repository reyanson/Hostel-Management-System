import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import React, { useState } from "react";


function Notice(){
    let navigate = useNavigate();

    const [notice, setNotice] = useState({
        content: "",
        subject:"",
      });

      const { content, subject } = notice;

      const onInputChange = (e) => {
        setNotice({ ...notice, [e.target.name]: e.target.value });
      };
    
      const onSubmit = async (e) => {
        e.preventDefault();
        await axios.post("http://localhost:8080/notices/add", notice);
        navigate("/notice_alert");
      };

    return(
        <>
        <div>
        <div className="container">
        <div className="row">
            <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
            <h2 className="text-center m-4">Notice Upload</h2>
            <form onSubmit={(e) => onSubmit(e)}>
                <div className="mb-3">
                <label htmlFor="Content" className="form-label">
                    Notice Content
                </label>
                <input
                    type={"text"}
                    className="form-control"
                    name="content"
                    value={content}
                    required
                    onChange={(e) => onInputChange(e)}
                />
                </div>
                <div className="mb-3">
                <label htmlFor="Content" className="form-label">
                    Subject
                </label>
                <input
                    type={"text"}
                    className="form-control"
                    name="subject"
                    value={subject}
                    required
                    onChange={(e) => onInputChange(e)}
                />
                </div>
                <button type="submit" className="btn btn-outline-primary">
                Upload 
                </button>
                <Link className="btn btn-outline-danger mx-2" to="/notice_table" style={{marginLeft:50}}>
                Cancel
                </Link>
            </form>
            </div>
        </div>
        </div>
    </div>
        </>
    );
}
export default Notice;