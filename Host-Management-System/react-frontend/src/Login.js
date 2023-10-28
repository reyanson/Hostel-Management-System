
import React, { useContext, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from "axios";
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import {Link} from 'react-router-dom';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import LinkMui from '@mui/material/Link';
import Logo from "./logo1.png";
import { IconButton, InputAdornment, FormControl } from '@mui/material';
import { Visibility, VisibilityOff } from '@mui/icons-material';

const theme = createTheme();

export default function SignIn() {

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
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
      const response = await axios.post("http://localhost:8080/api/v1/login", {
        username: username,
        password: password,
      });

      if (response.status === 200) {
        // Login was successful, navigate to the dashboard
        navigate('/dashboard');
      } else {
        setError('Login failed. Please try again.');
      }
    } catch (error) {
      // Handle other errors, for example, network errors or server issues
      setError('An error occurred. Please try again later.');
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
          <Typography color={'GrayText'} fontSize={"13px"}>
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

            <span style={{paddingRight:'210px'}}>
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