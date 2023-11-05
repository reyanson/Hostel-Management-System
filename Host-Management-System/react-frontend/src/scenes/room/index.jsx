import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import axios from 'axios';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

export default function RoomTable() {


    const [rooms, setRooms] = useState([]);

    useEffect(() => {
        loadRooms();
    }, []);

    const loadRooms = async () => {
        try {
            const response = await axios.get("http://192.168.8.101:8080/rooms/viewall"); 
            setRooms(response.data);
        } catch (error) {
            console.error('Error fetching Room data:', error);
        }
    };

    const deleteRooms = async (regNo) => {
        try {
            await axios.delete(`http://192.168.8.101:8080/rooms/delete/${regNo}`);
            loadRooms();
        } catch (error) {
            console.error('Error deleting Room Record:', error);
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
                    <Header title="Rooms" subtitle="Managing all the Rooms" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}>
                        <div className='container mt-5'>
                            <div className='py-4'>
                                <table className="table border shadow">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-center">Room Number</th>
                                            <th scope="col" class="text-center">Floor</th>
                                            <th scope="col" class="text-center">Registration Number</th>
                                            <th scope="col" class="text-center">Created At</th>
                                            <th scope="col" class="text-center">Updated At</th>
                                            <th scope="col" colspan="2" class="text-center">Actions</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        {rooms.map((room, index) => (
                                            <tr key={index}>
                                                <td>{room.roomNum}</td>
                                                <td>{room.floor}</td>
                                                <td>{room.regNo}</td>                                             
                                                <td>{room.createdAt}</td>
                                                <td>{room.updatedAt}</td>
                                                <td>{room.action}</td>
                                                <td>
                                                    <Link to={`/room/${room.roomId}`} className="btn btn-info btn-sm mx-2">
                                                        View
                                                    </Link>
                                                    <Link to={`/room/${room.roomId}`} className="btn btn-info btn-sm mx-2">
                                                        Edit
                                                    </Link>
                                                    <button
                                                        onClick={() => {
                                                            if (window.confirm('Are you sure you want to delete this Student Data?')) {
                                                                deleteRooms(room.regNo);
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
