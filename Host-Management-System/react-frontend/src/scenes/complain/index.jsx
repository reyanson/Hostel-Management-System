import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import axios from 'axios';
//import { useTheme } from '@emotion/react';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

export default function ComplainTable() {

    //const theme = useTheme();

    const [complaints, setComplaints] = useState([]);

    useEffect(() => {
        loadComplaints();
    }, []);

    const loadComplaints = async () => {
        try {
            const response = await axios.get("http://localhost:8080/complaints/viewall"); 
            setComplaints(response.data);
        } catch (error) {
            console.error('Error fetching complaint data:', error);
        }
    };

    const deleteComplaint = async (cId) => {
        try {
            await axios.delete(`http://localhost:8080/complaints/delete/${cId}`);
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
                                            <th scope="col">Complaint ID</th>
                                            <th scope="col">Registration Number</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Subject</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Created At</th>
                                            <th scope="col">Updated At</th>
                                            <th scope="col">Actions</th>
                                            <th scope="col">Remark</th>
                                            <th scope="col">Options</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {complaints.map((complaint, index) => (
                                            <tr key={index}>
                                                <td>{complaint.cId}</td>
                                                <td>{complaint.regNo}</td>
                                                <td>{complaint.category}</td>
                                                <td>{complaint.subject}</td>
                                                <td>{complaint.description}</td>
                                                <td>{complaint.createdAt}</td>
                                                <td>{complaint.updatedAt}</td>
                                                <td>{complaint.action}</td>
                                                <td>{complaint.remark}</td>

                                                <td>
                                                    <Link to={`/complaint/${complaint.cId}`} className="btn btn-info btn-sm mx-2">
                                                        View
                                                    </Link>
                                                    <button
                                                        onClick={() => {
                                                            if (window.confirm('Are you sure you want to delete this complaint?')) {
                                                                deleteComplaint(complaint.cId);
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
