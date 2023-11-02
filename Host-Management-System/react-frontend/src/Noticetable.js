import React, { useEffect, useState } from 'react';
import axios from 'axios';

function Noticetable() {
  const [data, setData] = useState([]);

  useEffect(() => {
    // Fetch data from your API or database
    axios.get("http://localhost:8080/notices/all")
      .then(response => {
        setData(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return (
    <div>
      <h1>Notice</h1>
      <table style={{ border: '1px solid black', borderCollapse: 'collapse' }}>
        <thead>
          <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Subject</th>
          </tr>
        </thead>
        <tbody>
          {data.map(item => (
             <tr key={item.id}>
              <td style={{ border: '1px solid black' }}>{item.noticeId}</td>
              <td style={{ border: '1px solid black' }}>{item.date}</td>
              <td style={{ border: '1px solid black' }}>{item.subject}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Noticetable;