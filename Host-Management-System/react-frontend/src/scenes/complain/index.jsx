import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import axios from 'axios';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

export default function AssetTable() {


    const [complaints, setComplaints] = useState([]);

    useEffect(() => {
        loadComplaints();
    }, []);

    const loadComplaints = async () => {
        try {
            const response = await axios.get("http://localhost:8080/complains/viewall"); 
            setComplaints(response.data);
        } catch (error) {
            console.error('Error fetching complaint data:', error);
        }
    };

    const deleteComplaint = async (cId) => {
        try {
            await axios.delete(`http://localhost:8080/complains/delete/{complainId}`);
            loadComplaints();
        } catch (error) {
            console.error('Error deleting complaint:', error);
        }
    };

    return (
        <>
            <Box display="flex">
            <Sidebar />
            <Box flex="1">
            <Topbar />

                <Box m="20px" mt={-8} component="main" sx={{ flexGrow: 1, p: 3 }} /> 

                <Box p={2}>
                    <Header title="Complaints" subtitle="Managing all the Complaints" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}>
                        <div className='container mt-5'>
                            <div className='py-4'>
                                <table className="table border shadow">
                                    <thead>
                                        <tr>
                                            {/* <th scope="col">Complaint ID</th> */}
                                            <th scope="col">Registration Number</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Subject</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Created At</th>
                                           
                                            <th scope="col">Actions</th>
     
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {complaints.map((complains, index) => (
                                            <tr key={index}>
                                                {/* <td>{complains.cId}</td> */}
                                                <td>{complains.regNo}</td>
                                                <td>{complains.category}</td>
                                                <td>{complains.subject}</td>
                                                <td>{complains.description}</td>
                                                <td>{complains.createdAt}</td>
                                               
                                            

                                                <td>
                                                    <Link to={`/complains/${complains.cId}`} className="btn btn-info btn-sm mx-2">
                                                        View
                                                    </Link>
                                                    <button
                                                        onClick={() => {
                                                            if (window.confirm('Are you sure you want to delete this complaint?')) {
                                                                deleteComplaint(complains.cId);
                                                            }
                                                        }}
                                                        className="btn btn-danger btn-sm mx-2"
                                                    >
                                                        Delete
                                                    </button>

                                                    
                                                </td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </Box>
                </Box>
            </Box>
            </Box>
        </>
    );
}
