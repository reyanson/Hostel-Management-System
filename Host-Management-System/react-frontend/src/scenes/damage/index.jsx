import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Box from '@mui/material/Box';
import Header from '../../Components/Header';
import axios from 'axios';
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';

export default function DamageTable() {


    const [damages, setDamages] = useState([]);

    useEffect(() => {
        loadDamages();
    }, []);

    const loadDamages = async () => {
        try {
            const response = await axios.get("http://192.168.8.115:8080/damages/viewall"); 
            setDamages(response.data);
        } catch (error) {
            console.error('Error fetching damage datas:', error);
        }
    };

    const deleteDamages = async (damageId) => {
        try {
            await axios.delete(`http://192.168.8.115:8080/damages/delete/${damageId}`);
            loadDamages();
        } catch (error) {
            console.error('Error deleting damage:', error);
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
                    <Header title="Damages" subtitle="Managing all the Damages" />
                </Box>  

                <Box sx={{ display: 'flex' }}>            
                    <Box mt={-6} ml={4}>
                        <div className='container mt-5'>
                            <div className='py-4'>
                                <table className="table border shadow">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-center">Damage ID</th>
                                            <th scope="col" class="text-center">Asset ID </th>
                                            <th scope="col" class="text-center">Room Number</th>
                                            <th scope="col" class="text-center">Floor</th>
                                            <th scope="col" class="text-center">Description</th>
                                            <th scope="col" colspan="2" class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {damages.map((damage, index) => (
                                            <tr key={index}>
                                                <td>{damage.damageId}</td>
                                                <td>{damage.assetId}</td>
                                                <td>{damage.roomNo}</td>
                                                <td>{damage.floor}</td>
                                                <td>{damage.description}</td>

                                                <td>
                                                    <Link to={`/damage/${damage.damageId}`} className="btn btn-info btn-sm mx-2">
                                                        View
                                                    </Link>
                                                    <button
                                                        onClick={() => {
                                                            if (window.confirm('Are you sure you want to delete this damage?')) {
                                                                deleteDamages(damage.damageId);
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
