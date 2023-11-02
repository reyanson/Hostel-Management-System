import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import React, { useState } from "react";
import { Box } from '@mui/material';
import Header from './Header';
import Topbar from '../scenes/global/Topbar';
import Sidebar from '../scenes/global/Sidebar';

function Notice() {
  let navigate = useNavigate();

  const [notice, setNotice] = useState({
    content: "",
    subject: "",
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

  return (
    <>
      <Box display="flex">
        <Sidebar />
        <Box flex="1">
          <Topbar />
          <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 
                {/* <Box m="20px" />  */}

                <Box p={2}>
                    <Header title="Notice" subtitle="Creating Notices" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}>
                    <div className='container mt-5'>
                                
                        <div className='py-4'>
                            <div className="col-md-8 offset-md-2 border rounded p-4 mt-2 shadow">
                            <h2 className="text-center m-4">Notice Upload</h2>
                            <form onSubmit={(e) => onSubmit(e)}>
                                <div className="mb-3">
                                <label htmlFor="Content" className="form-label">
                                    Notice Content
                                </label>
                                <input
                                    type="text"
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
                                    type="text"
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
                                <Link className="btn btn-outline-danger mx-2" to="/notice_table" style={{ marginLeft: 50 }}>
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

export default Notice;

// import { Link, useNavigate } from "react-router-dom";
// import axios from "axios";
// import React, { useState } from "react";
// import Box from '@mui/material/Box';
// import Header from './Header';
// import Topbar from '../scenes/global/Topbar';
// import Sidebar from '../scenes/global/Sidebar';

// function Notice(){
//     let navigate = useNavigate();

//     const [notice, setNotice] = useState({
//         content: "",
//         subject:"",
//       });

//       const { content, subject } = notice;

//       const onInputChange = (e) => {
//         setNotice({ ...notice, [e.target.name]: e.target.value });
//       };
    
//       const onSubmit = async (e) => {
//         e.preventDefault();
//         await axios.post("http://localhost:8080/notices/add", notice);
//         navigate("/notice_alert");
//       };

//     return(
//         <>
//             <Box display="flex">
//             <Sidebar />
//             <Box flex="1">
//             <Topbar />

//                 <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 
//                 {/* <Box m="20px" />  */}

//                 <Box p={2}>
//                     <Header title="Notice" subtitle="Managing all the notices" />
//                 </Box>  

//                 <Box sx={{ display: 'flex' }}>            
//                     <Box mt={-6} ml={4}>
//                             <div className='container mt-5'>
//                                 <div className='py-4'>
//                                     {/* <div className="row"> */}
//                                         <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
//                                         <h2 className="text-center m-4">Notice Upload</h2>
//                                         <form onSubmit={(e) => onSubmit(e)}>
//                                             <div className="mb-3">
//                                             <label htmlFor="Content" className="form-label">
//                                                 Notice Content
//                                             </label>
//                                             <input
//                                                 type={"text"}
//                                                 className="form-control"
//                                                 name="content"
//                                                 value={content}
//                                                 required
//                                                 onChange={(e) => onInputChange(e)}
//                                             />
//                                             </div>
//                                             <div className="mb-3">
//                                             <label htmlFor="Content" className="form-label">
//                                                 Subject
//                                             </label>
//                                             <input
//                                                 type={"text"}
//                                                 className="form-control"
//                                                 name="subject"
//                                                 value={subject}
//                                                 required
//                                                 onChange={(e) => onInputChange(e)}
//                                             />
//                                             </div>
//                                             <button type="submit" className="btn btn-outline-primary">
//                                             Upload 
//                                             </button>
//                                             <Link className="btn btn-outline-danger mx-2" to="/notice_table" style={{marginLeft:50}}>
//                                             Cancel
//                                             </Link>
//                                         </form>
//                                         </div>
//                                     </div>
//                                     </div>
//                             {/* </div>                        */}
//                     </Box>
//             </Box>
//             </Box>
//             </Box>
          
//         </>
//     );
// }
// export default Notice;