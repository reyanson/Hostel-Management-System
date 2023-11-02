import {Box} from "@mui/material";
import Topbar from '../global/Topbar';
import Sidebar from '../global/Sidebar';
import Header from '../../Components/Header';
import Studentlist from '../students/';
// import Team from '../global/team';
// import Invoices from '../global/invoices';
// import Contacts from '../global/contacts';
// import Form from '../global/fomr';


function Dashboard() {
    return (
      <Box display="flex">
        <Sidebar />
        <Box flex="1">
          <Topbar />
          <Box p={2}>
            <Header title="DASHBOARD" subtitle="Welcome to your dashboard" />
            {/* <Studentlist /> */}
          </Box>
        </Box>
      </Box>
    );
  }
    

export default Dashboard;