import React, { useEffect, useState } from 'react';
import { Link, Route } from 'react-router-dom'; // Import Route
import Sidebar from '../../scenes/global/Sidebar';
import Topbar from '../../scenes/global/Topbar';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import axios from 'axios';

// Modify your Students component
export default function Students() {
    const [students, setStudents] = useState([]);

    useEffect(() => {
        loadStudents();
    }, []);

    const loadStudents = async () => {
        try {
            const response = await axios.get("http://localhost:8080/student/viewall");
            setStudents(response.data);
        } catch (error) {
            console.error('Error fetching student data:', error);
        }
    };

    return (
        <>
            
            <Box height={30} />
            <Header title="Students" subtitle="Managing the Team Members" />
            <Box sx={{ display: 'flex' }}>
            
                <Box mt={-10} ml={-20} component="main" sx={{ flexGrow: 1, p: 3 }}>
                    {/* Use Route to display student data when the URL matches */}
                    {/* <Route path="/manage-students"> */}
                        <div className='container mt-5'>
                            <div className='py-4'>
                                <table className="table border shadow">
                                    <thead>
                                        <tr>
                                            <th scope="col">Registration Number</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">NIC</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {
                                            students.map((student, index) => (
                                                <tr key={index}>
                                                    <th scope="row">{student.regNo}</th>
                                                    <td>{student.firstName} {student.lastName}</td>
                                                    <td>{student.email}</td>
                                                    <td>{student.nic}</td>
                                                    <td>{student.address}</td>
                                                    <td>{student.phoneNo}</td>
                                                    <td>
                                                        <Link
                                                            className='btn btn-primary mx-2'
                                                            to={`/viewstudent/${student.reg_no}`}
                                                        >
                                                            View
                                                        </Link>
                                                        <Link
                                                            className='btn btn-outline-primary mx-2'
                                                            to={`/updateStudent/${student.reg_no}`}
                                                        >
                                                            Edit
                                                        </Link>
                                                    </td>
                                                </tr>
                                            ))
                                        }
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    {/* </Route> */}
                </Box>
            </Box>
        </>
    );
}





// import React from 'react'
// import axios from 'axios';
// import { useEffect, useState } from 'react';
// import { Link, useParams } from 'react-router-dom';
// import Sidebar from "../../scenes/global/Sidebar";
// import Topbar from "../../scenes/global/Topbar";
// import Box from '@mui/material/Box';
// import swal from 'sweetalert';
// import {tokens} from "../../theme";
// import Header from '../../Components/Header';
// import { useTheme } from '@emotion/react';

// export default function Students() {

//     const theme = useTheme();
//     const colors = tokens(theme.palette.mode);

//     const [students,setStudents]=useState([]);

//     // useEffect(()=>{
//     //     loadStudents();
//     // });

//     useEffect(() => {
//         // Make an API call to fetch student details from your backend
//         fetch('/api/students') // Replace with your actual API endpoint
//           .then((response) => response.json())
//           .then((data) => setStudents(data));
//       }, []);

//     const loadStudents=async()=>{
//         const result = await axios.get("http://localhost:3000/student")
//         setStudents(result.data);
//     };

//     // const deleteStudent = async (id)=>{
//     //     await axios.delete(`http://localhost:3000/student/delete/${id}`)
//     //     loadStudents();
//     // }

//     return (
//         <>
//         <Topbar/>
//         <Sidebar/>
//         <Box height={30} /> 
//             <Header title="Students" subtitle="Managing the Team Members" />
//             <Box sx={{ display: 'flex' }}> 
//                 <Sidebar/>
//                 <Box mt={-10} ml={-20} component="main" sx={{ flexGrow: 1, p: 3 }} > 

//         <div className='container mt-5'>
//             <div className='py-4'>
//                         <table className="table border shadow">
//                 <thead>
//                     <tr>
//                     <th scope="col">Registration Number</th>
//                     <th scope="col">Name</th>
//                     <th scope="col">Email</th>
//                     <th scope="col">NIC</th>
//                     <th scope="col">Address</th>
//                     <th scope="col">Phone Number</th>
//                     <th scope="col">Action</th>
//                     </tr>
//                 </thead>
//                 <tbody>               

//                     {
//                         students.map((student,index)=>(
//                             <tr>        
//                                 <th scope="row" key={index}>{index+1}</th>
//                                 <td>{student.reg_no} </td>
//                                 <td>{student.first_name}</td>
//                                 <td>{student.email}</td>
//                                 <td>{student.nic}</td>
//                                 <td>{student.address}</td>
//                                 <td>{student.phone_no}</td>
//                                 <td>
//                                     <Link className='btn btn-primary mx-2'
//                                         to={`/viewstudent/${student.reg_no}`}
                                    
//                                     >View</Link>
//                                     <Link className='btn btn-outline-primary mx-2' 
//                                         to={`/updateStudent/${student.reg_no}`}
                                    
//                                     >Edit</Link>
                                    
//                                     {/* <Link
//                                         className='btn btn-danger mx-2'
//                                         onClick={() => {
//                                             swal({
//                                             title: "Are you sure? you want to delete this member?",
//                                             icon: "warning",
//                                             buttons: true,
//                                             dangerMode: true,
//                                             }).then((willDelete) => {
//                                             if (willDelete) {
//                                                 // Call the deleteUser function here when user confirms
//                                                 deleteStudent(student.userId);
//                                                 swal(student.firstname+" has been deleted!", {
//                                                 icon: "success",
//                                                 });
//                                             } 
//                                             });
//                                         }}
//                                         >
//                                         Delete
//                                     </Link> */}

//                                 </td>
//                             </tr>
//                         )) //create new array
//                     } 
                                
//                 </tbody>
//                 </table>
//             </div>
//         </div>

//         </Box>
//         </Box>
//         </>
//     )
// }
