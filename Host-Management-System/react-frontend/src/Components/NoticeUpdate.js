import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

function NoticeUpdate(){

  const { noticeId } = useParams(); // Get the noticeId from the URL params
  const [notice, setNotice] = useState({});
  const [updatedNotice, setUpdatedNotice] = useState({
    date: '',
    subject: '',
    content:'',
    // Add other fields as needed for your notice
  });

  useEffect(() => {
    // Fetch the specific notice by noticeId
    axios.get(`http://localhost:8080/notices/${noticeId}`)
      .then(response => {
        setNotice(response.data);
      })
      .catch(error => {
        console.error('Error fetching notice:', error);
      });
  }, [noticeId]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setUpdatedNotice({
      ...updatedNotice,
      [name]: value,
    });
  };

  const updateNotice = async () => {
    try {
      // Send a PUT request to update the notice
      await axios.put(`http://localhost:8080/notices/${noticeId}`, updatedNotice);
      // Optionally, you can redirect the user to the notices page or show a success message.
    } catch (error) {
      console.error('Error updating notice:', error);
    }
  };


    return(
        <>
          <div>
      <h2>Update Notice</h2>
      <form>
        <div>
          <label>Date:</label>
          <input
            type="text"
            name="date"
            value={updatedNotice.date}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label>Subject:</label>
          <input
            type="text"
            name="subject"
            value={updatedNotice.subject}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label>Subject:</label>
          <input
            type="text"
            name="content"
            value={updatedNotice.content}
            onChange={handleInputChange}
          />
        </div>
        {/* Add other form fields as needed for your notice */}
        <button type="button" onClick={updateNotice}>Update Notice</button>
      </form>
    </div>
        </>
    );
}

export default NoticeUpdate();