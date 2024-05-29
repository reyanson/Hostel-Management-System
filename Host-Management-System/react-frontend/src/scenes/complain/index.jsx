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
            const response = await axios.get("http://192.168.8.115:8080/complains/viewall"); 
            setComplaints(response.data);
        } catch (error) {
            console.error('Error fetching complaint data:', error);
        }
    };

    const deleteComplaint = async (cId) => {
        try {
            await axios.delete(`http://192.168.8.115:8080/complains/delete?complainId=${cId}`);
            loadComplaints();
        } catch (error) {
            console.error('Error deleting complaint:', error);
        }
    };

    const acceptComplaint = async (cId) => {
        try {
            await axios.put(`http://192.168.8.115:8080/complains/put?complainId=${cId}`);
            loadComplaints();
        } catch (error) {
            console.error('Error accepting complaint:', error);
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
                                            <th scope="col" class="text-center">Register NO</th>
                                            <th scope="col" class="text-center">Full Name</th>
                                            <th scope="col" class="text-center">Type</th>
                                            <th scope="col" class="text-center">Asset Name</th>
                                            <th scope="col" class="text-center">Room NO</th>
                                            <th scope="col" class="text-center">Subject</th>
                                            <th scope="col" class="text-center">Description</th>
                                            <th scope="col" class="text-center">Created Date</th>
                                            <th scope="col" class="text-center">Updated Date</th> 
                                            <th scope="col" class="text-center">Action Status</th>   
                                            <th scope="col" class="text-center">Accepted By</th>                                         
                                            <th scope="col" colspan="2" class="text-center">Actions</th>
     
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {complaints.map((complains, index) => (
                                            <tr key={index}>
                                                {/* <td>{complains.cId}</td> */}
                                                <td>{complains.reg_no}</td>
                                                <td>{complains.name}</td>
                                                <td>{complains.type}</td>
                                                <td>{complains.asset_name}</td>
                                                <td>{complains.room_no}</td>
                                                <td>{complains.subject}</td>
                                                <td>{complains.description}</td>
                                                <td>{complains.created_date}</td>
                                                <td>{complains.updated_date}</td>
                                                <td>{complains.action_status}</td>
                                                <td>{complains.accepted_by}</td>
                                               
                                                <td>
                                                    {/* <Link to={`/complains/${complains.cId}`} className="btn btn-info btn-sm mx-2">
                                                        View
                                                    </Link> */}

                                                    <button
                                                        onClick={() => {
                                                            if (window.confirm('Are you sure you want to Accept this complaint?')) {
                                                                acceptComplaint(complains.cId);
                                                            }
                                                        }}
                                                        className="btn btn-info btn-sm mx-2"
                                                    >
                                                        Accept
                                                    </button>
                                                
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
