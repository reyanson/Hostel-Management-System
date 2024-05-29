import React, { useState, useEffect } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

function NoticeUpdate(){

  let navigate = useNavigate();

  const { noticeId } = useParams();

  const [notice, setNotice] = useState({
    content: "",
    subject: "",
  });

  const { subject, content } = notice;

  const onInputChange = (e) => {
    setNotice({ ...notice, [e.target.name]: e.target.value });
  };

  useEffect(() => {
    loadNotice();
  }, []);

  const onSubmit = async (e) => {
    e.preventDefault();
    await axios.put(`http://192.168.8.115:8080/notices/update/${noticeId}`, notice);
    navigate("/noticetable");
  };


  // const loadNotice = async () => {
  //   const result = await axios.get(`http://localhost:8080/notices/view/${noticeId}`);
  //   setNotice(result.data);
  // };

  const loadNotice = async () => {
    try {
        const response = await axios.get(`http://192.168.8.115:8080/notices/view/${noticeId}`);
        setNotice(response.data);
    } catch (error) {
        console.error('Error fetching notice:', error);
    }
  };


    return(
        <>
         <Box display="flex">
            <Sidebar />
            <Box flex="1">
            <Topbar />

                <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 
                {/* <Box m="20px" />  */}

                <Box p={2}>
                    <Header title="Notice" subtitle="Managing all the Notices" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}></Box>
                      <div className="container">
                        <div className="row">
                          <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
                            <h2 className="text-center m-4">Update Notice</h2>

                            <form onSubmit={(e) => onSubmit(e)}>
                              <div className="mb-3">
                                <label htmlFor="Subject" className="form-label">
                                  Subject
                                </label>
                                <input
                                  type={"text"}
                                  className="form-control"
                                  name="subject"
                                  value={subject}
                                  onChange={(e) => onInputChange(e)}
                                />
                              </div>
                              <div className="mb-3">
                                <label htmlFor="Content" className="form-label">
                                Content
                                </label>
                                <textarea
                                  className="form-control"
                                  name="content"
                                  value={content}
                                  onChange={(e) => onInputChange(e)}
                                ></textarea>
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
        </>
    );
}

export default NoticeUpdate;