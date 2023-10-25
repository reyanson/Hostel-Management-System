export default function Registration(){
    return(
        <div className="container">
      <div className="row">
        <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
          <h2 className="text-center m-4">Attendance Marking</h2>

          {/* <form onSubmit={(e) => onSubmit(e)}>
            <div className="mb-3">
              <label htmlFor="Userid" className="form-label">
                User Id
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter team leader id"
                name="u_id"
                //value={u_id}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Mtitle" className="form-label">
                Meeting Title/Type
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter meeting title"
                name="meeting_title"
                //value={meeting_title}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Aid" className="form-label">
                Attendees Id
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter attendees id"
                name="attendees_id"
                value={attendees_id}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Status" className="form-label">
                Status
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter attendees status"
                name="attendance_status"
                value={attendance_status}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Date" className="form-label">
                Meeting Date
              </label>
              <input
                type={"date"}
                className="form-control"
                placeholder="Select the date"
                name="meeting_date"
                value={meeting_date}
                required
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Remark" className="form-label">
                Remark
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter the remark"
                name="remark"
                value={remark}
                onChange={(e) => onInputChange(e)}
              />
            </div>
            <button type="submit" className="btn btn-outline-primary">
              Marking
            </button>
            <Link className="btn btn-outline-danger mx-2" to="/">
              Cancel
            </Link>
          </form> */}
        </div>
      </div>
    </div>
    );
}