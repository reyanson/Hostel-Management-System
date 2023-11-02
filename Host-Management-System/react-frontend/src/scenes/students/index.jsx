import React from 'react'
import axios from 'axios';
import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import Sidebar from "../../scenes/global/Sidebar";
import Topbar from "../../scenes/global/Topbar";
import Box from '@mui/material/Box';
import swal from 'sweetalert';
import {tokens} from "../../theme";
import Header from '../../Components/Header';
import { useTheme } from '@emotion/react';

export default function Students() {
    // if(sessionStorage.getItem("jwtToken")===null){
    //     window.location.href = '/';
    // }
     //storing user info

    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    const [students,setStudents]=useState([]);
    const {id} = useParams()

    useEffect(()=>{
        loadStudents();
    });

    const loadStudents=async()=>{
        const result = await axios.get("http://localhost:3000/student")
        setStudents(result.data);
    };

    const deleteStudent = async (id)=>{
        await axios.delete(`http://localhost:3000/student/delete/${id}`)
        loadStudents();
    }

    return (
        <>
        <Topbar/>
        <Sidebar/>
        <Box height={30} /> 
            <Header title="Students" subtitle="Managing the Team Members" />
            <Box sx={{ display: 'flex' }}> 
                <Sidebar/>
                <Box mt={-10} ml={-20} component="main" sx={{ flexGrow: 1, p: 3 }} > 

        <div className='container mt-5'>
            <div className='py-4'>
                        <table className="table border shadow">
                <thead>
                    <tr>
                    <th scope="col">Registration Number</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">NIC</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>               

                    {
                        students.map((student,index)=>(
                            <tr>        
                                <th scope="row" key={index}>{index+1}</th>
                                <td>{student.reg_no} </td>
                                <td>{student.first_name}</td>
                                <td>{student.email}</td>
                                <td>{student.nic}</td>
                                <td>{student.address}</td>
                                <td>{student.phone_no}</td>
                                <td>
                                    <Link className='btn btn-primary mx-2'
                                        to={`/viewstudent/${student.reg_no}`}
                                    
                                    >View</Link>
                                    <Link className='btn btn-outline-primary mx-2' 
                                        to={`/updateStudent/${student.reg_no}`}
                                    
                                    >Edit</Link>
                                    
                                    <Link
                                        className='btn btn-danger mx-2'
                                        onClick={() => {
                                            swal({
                                            title: "Are you sure? you want to delete this member?",
                                            icon: "warning",
                                            buttons: true,
                                            dangerMode: true,
                                            }).then((willDelete) => {
                                            if (willDelete) {
                                                // Call the deleteUser function here when user confirms
                                                deleteStudent(student.userId);
                                                swal(student.firstname+" has been deleted!", {
                                                icon: "success",
                                                });
                                            } 
                                            });
                                        }}
                                        >
                                        Delete
                                    </Link>

                                </td>
                            </tr>
                        )) //create new array
                    } 
                                
                </tbody>
                </table>
            </div>
        </div>

        </Box>
        </Box>
        </>
    )
}
