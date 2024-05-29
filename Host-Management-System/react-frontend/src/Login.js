
// import React, { useState } from 'react';
// import { useNavigate } from 'react-router-dom';
// import axios from "axios";
// import Avatar from '@mui/material/Avatar';
// import Button from '@mui/material/Button';
// import CssBaseline from '@mui/material/CssBaseline';
// import TextField from '@mui/material/TextField';
// import FormControlLabel from '@mui/material/FormControlLabel';
// import Checkbox from '@mui/material/Checkbox';
// import {Link} from 'react-router-dom';
// import Grid from '@mui/material/Grid';
// import Box from '@mui/material/Box';
// import Typography from '@mui/material/Typography';
// import Container from '@mui/material/Container';
// import { createTheme, ThemeProvider } from '@mui/material/styles';
// import LinkMui from '@mui/material/Link';
// import Logo from "./logo1.png";
// import { IconButton, InputAdornment } from '@mui/material';
// import { Visibility, VisibilityOff } from '@mui/icons-material';
// import hostelImage from "./hostelimage.png";


import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import {Link} from 'react-router-dom';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import LinkMui from '@mui/material/Link';
import Logo from './logo1.png';
import { IconButton, InputAdornment } from '@mui/material';
import { Visibility, VisibilityOff } from '@mui/icons-material';

const theme = createTheme();

export default function SignIn() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();
  const [error, setError] = useState('');
  const [showPassword, setShowPassword] = useState(false);

  const handleClickShowPassword = () => {
    setShowPassword(!showPassword);
  };

  const handleMouseDownPassword = (event) => {
    event.preventDefault();
  };

  async function login(event) {
    event.preventDefault();

    try {
      // Send a POST request to the login API
      const response = await axios.post('http://192.168.8.115:8080/api/v1/login', {
        username: username,
        password: password,
      });

      if (response.status === 200) {
        // Check if you have a session token and user role in the response
        console.log(response.data);
        const sessionToken = response.data.username; // Adjust this based on your response structure
        const userRole = response.data.occasion; // Adjust this based on your response structure

        if (sessionToken) {
          // Store the session token and user role in a secure way, such as browser cookies or local storage
          localStorage.setItem('sessionToken', sessionToken);
          localStorage.setItem('userRole', userRole);

          // Perform role-based redirection
          if (userRole === 'warden' || userRole === 'dean' || userRole === 'subwarden') {
            navigate('/home');
            console.log(userRole);
          } else {
            navigate('/');
          }
        } else {
          window.alert('No valid session token received.');
          // Handle the case where the session token is not received
        }
      } else {
        window.alert('Incorrect username or password. Please try again!');
        // Handle the case where login failed
      }
    } catch (error) {
      window.alert('An error occurred. Please try again later');
      // Handle other errors, for example, network errors or server issues
    }
  }

  return (
    <ThemeProvider theme={theme}>
      <Container component="main" maxWidth="xs">
        <CssBaseline />
        <Box
          sx={{
            marginTop: 8,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
          }}
        >
          <Avatar alt="image" src={Logo} variant="square" sx={{ width: 140, height: 140 }} />
          <Typography component="h4" variant="h5" sx={{ mt: '10px' }}>
            Sign in to your Account
          </Typography>
          <Typography color={'GrayText'} fontSize={'13px'}>
            Welcome back! Please enter your details
          </Typography>
          <Box component="form" noValidate sx={{ mt: 1 }}>
            <TextField
              margin="normal"
              required
              fullWidth
              id="username"
              label="Username"
              name="username"
              autoComplete="email"
              autoFocus
              value={username}
              onChange={(event) => {
                setUsername(event.target.value);
              }}
            />
            <TextField
              margin="normal"
              required
              fullWidth
              name="password"
              label="Password"
              type={showPassword ? 'text' : 'password'}
              id="password"
              autoComplete="current-password"
              value={password}
              onChange={(event) => {
                setPassword(event.target.value);
              }}
              InputProps={{
                endAdornment: (
                  <InputAdornment position="end">
                    <IconButton
                      aria-label="toggle password visibility"
                      onClick={handleClickShowPassword}
                      onMouseDown={handleMouseDownPassword}
                      edge="end"
                    >
                      {showPassword ? <VisibilityOff /> : <Visibility />}
                    </IconButton>
                  </InputAdornment>
                ),
              }}
            />

            <span style={{ paddingRight: '210px' }}>
              <FormControlLabel
                control={<Checkbox value="remember" color="primary" />}
                label="Remember me"
              />
            </span>

            <Grid container>
              <Grid item xs>
                <LinkMui to variant="body2" display="flex" justifyContent="flex-end" sx={{ mt: '-30px' }}>
                  <Link to={`/forgot`}>Forgot password?</Link>
                </LinkMui>
              </Grid>
            </Grid>
            <Button
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 3, mb: 2, backgroundColor: '#162054' }}
              onClick={login}
            >
              Sign In
            </Button>
          </Box>
          {error && (
            <Typography color="error" align="center">
              {error}
            </Typography>
          )}
        </Box>
      </Container>
    </ThemeProvider>
  );
}




// const theme = createTheme();

// export default function SignIn() {

//   const [username, setUsername] = useState("");
//   const [password, setPassword] = useState("");
//   const navigate = useNavigate();
//   const [error, setError] = useState('');
//   const [showPassword, setShowPassword] = useState(false);
//   //const [loggedInUsername, setLoggedInUsername] = useState('');

//   const handleClickShowPassword = () => {
//     setShowPassword(!showPassword);
//   };

//   const handleMouseDownPassword = (event) => {
//     event.preventDefault();
//   };

//   async function login(event) {
//     event.preventDefault();

//     try {
//       // const response = await axios.post("http://localhost:8080/api/v1/login", {
//         const response = await axios.post("http://192.168.8.115:8080/api/v1/login", {
//         username: username,
//         password: password,
//       });

//       if (response.status === 200) {
//         sessionStorage.setItem('loggedInUsername', response.data.username);
//         navigate('/home');
//       } else {
//         window.alert("Incorrect username or password. Please try again!");
//         // setError('Login failed. Please try again.');
//       }
    
//     } catch (error) {
//       // Handle other errors, for example, network errors or server issues
//       window.alert("An error occurred. Please try again later");
//       // setError('An error occurred. Please try again later.');
//     }
//   }

//   return (
//     <ThemeProvider theme={theme}>
//       <Container component="main" maxWidth="xs">
//         <CssBaseline />
//         <Box
//           sx={{
//             marginTop: 8,
//             display: 'flex',
//             flexDirection: 'column',
//             alignItems: 'center',
//           }}
//         >
//           <Avatar alt="image" src={Logo} variant="square" sx={{ width: 140, height: 140 }} />
//           <Typography component="h4" variant="h5" sx={{ mt: '10px' }}>
//             Sign in to your Account
//           </Typography>
//           <Typography color={'GrayText'} fontSize={"13px"}>
//             Welcome back! Please enter your details
//           </Typography>
//           <Box component="form" noValidate sx={{ mt: 1 }}>
//             <TextField
//               margin="normal"
//               required
//               fullWidth
//               id="username"
//               label="Username"
//               name="username"
//               autoComplete="email"
//               autoFocus
//               value={username}
//               onChange={(event) => {
//                 setUsername(event.target.value);
//               }}
//             />
//             <TextField
//               margin="normal"
//               required
//               fullWidth
//               name="password"
//               label="Password"
//               type={showPassword ? 'text' : 'password'}
//               id="password"
//               autoComplete="current-password"
//               value={password}
//               onChange={(event) => {
//                 setPassword(event.target.value);
//               }}
//               InputProps={{
//                 endAdornment: (
//                   <InputAdornment position="end">
//                     <IconButton
//                       aria-label="toggle password visibility"
//                       onClick={handleClickShowPassword}
//                       onMouseDown={handleMouseDownPassword}
//                       edge="end"
//                     >
//                       {showPassword ? <VisibilityOff /> : <Visibility />}
//                     </IconButton>
//                   </InputAdornment>
//                 ),
//               }}
//             />

//             <span style={{paddingRight:'210px'}}>
//             <FormControlLabel
              
//               control={<Checkbox value="remember" color="primary" />}
//               label="Remember me"
              
//             />
//             </span>

//             <Grid container>
//               <Grid item xs>
//                 <LinkMui to variant="body2" display="flex" justifyContent="flex-end" sx={{ mt: '-30px' }}>
//                   <Link to={`/forgot`}>Forgot password?</Link>
//                 </LinkMui>
//               </Grid>
//             </Grid>
//             <Button
//               type="submit"
//               fullWidth
//               variant="contained"
//               sx={{ mt: 3, mb: 2, backgroundColor: '#162054' }}
//               onClick={login}
//             >
//               Sign In
//             </Button>
//           </Box>
//           {error && (
//             <Typography color="error" align="center">
//               {error}
//             </Typography>
//           )}
//         </Box>
//       </Container>
//     </ThemeProvider>
//   );
// }





// import hostelImage from "./hostelimage.png"; // Import your image here

// const theme = createTheme();

// const backgroundStyle = {
//   backgroundImage: `url(${hostelImage})`, // Use the imported image
//   backgroundSize: 'cover',
//   filter: 'blur(2px)', // Add blur effect
//   position: 'absolute',
//   top: 0,
//   left: 0,
//   right: 0,
//   bottom: 0,
//   zIndex: -1,
// };

// export default function SignIn() {
//   const [username, setUsername] = useState("");
//   const [password, setPassword] = useState("");
//   const navigate = useNavigate();
//   const [error, setError] = useState('');
//   const [showPassword, setShowPassword] = useState(false);

//   const handleClickShowPassword = () => {
//     setShowPassword(!showPassword);
//   };

//   const handleMouseDownPassword = (event) => {
//     event.preventDefault();
//   };

//   async function login(event) {
//     event.preventDefault();

//     try {
//       const response = await axios.post("http://192.168.8.101:8080/api/v1/login", {
//         username: username,
//         password: password,
//       });

//       if (response.status === 200) {
//         sessionStorage.setItem('loggedInUsername', response.data.username);
//         navigate('/home');
//       } else {
//         setError('Login failed. Please try again.');
//       }

//     } catch (error) {
//       // Handle other errors, for example, network errors or server issues
//       setError('An error occurred. Please try again later.');
//     }
//   }

//   return (
//     <ThemeProvider theme={theme}>
//       <Container component="main" maxWidth="xs">
//         <CssBaseline />
//         <Box
//           sx={{
//             position: 'relative',
//             marginTop: 8,
//             display: 'flex',
//             flexDirection: 'column',
//             alignItems: 'center',
//           }}
//         >
//           <div style={backgroundStyle}></div> {/* Add background image here */}
//           <Avatar alt="image" src={Logo} variant="square" sx={{ width: 140, height: 140 }} />
//           <Typography component="h4" variant="h5" sx={{ mt: '10px' }}>
//             Sign in to your Account
//           </Typography>
//           <Typography color={'GrayText'} fontSize={"13px"}>
//             Welcome back! Please enter your details
//           </Typography>
//           <Box component="form" noValidate sx={{ mt: 1 }}>
//             {/* ... rest of your form code ... */}
//           </Box>
//           {error && (
//             <Typography color="error" align="center">
//               {error}
//             </Typography>
//           )}
//         </Box>
//       </Container>
//     </ThemeProvider>
//   );
// }