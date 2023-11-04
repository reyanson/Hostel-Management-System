import React, { useState, useEffect } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';

function NoticeUpdate(){

  let navigate = useNavigate();

  const { noticeId } = useParams();

  const [notice, setNotice] = useState({
    subject: "",
    content: "",
  });

  const { subject, content } = notice;

  const onInputChange = (e) => {
    setNotice({ ...notice, [e.target.name]: e.target.value });
  };

  useEffect(() => {
    loadNotice();
  }, []);

  const onSubmit = async (e) => {
    e.preventDefault();
    await axios.put(`http://localhost:8080/notices/update/${noticeId}`, notice);
    navigate("/noticetable");
  };


  const loadNotice = async () => {
    const result = await axios.get(`http://localhost:8080/notices/view/${noticeId}`);
    setNotice(result.data);
  };


    return(
        <>
          <div className="container">
      <div className="row">
        <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
          <h2 className="text-center m-4">Update Notice</h2>

          <form onSubmit={(e) => onSubmit(e)}>
            <div className="mb-3">
              <label htmlFor="Subject" className="form-label">
                Subject
              </label>
              <input
                type={"text"}
                className="form-control"
                name="subject"
                value={subject}
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Content" className="form-label">
              Content
              </label>
              <input
                type={"text"}
                className="form-control"
                name="content"
                value={content}
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <button type="submit" className="btn btn-outline-primary">
              Submit
            </button>
            <Link className="btn btn-outline-danger mx-2" to="/noticetable">
              Cancel
            </Link>
          </form>
        </div>
      </div>
    </div>
        </>
    );
}

export default NoticeUpdate();