// import * as React from 'react';
import React, { useContext } from 'react';
//import {  useState } from "react";
//import { useNavigate } from 'react-router-dom';
//import axios from "axios";
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
//import {Link} from 'react-router-dom';
//import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';
//import LinkMui from '@mui/material/Link';
import Logo from "./logo1.png";
//import { IconButton, InputAdornment, FormControl } from '@mui/material';
//import { Visibility, VisibilityOff } from '@mui/icons-material';

const theme = createTheme();

export default function SignIn() {

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

          <Avatar alt="Aiesec-image" src={Logo} variant="square" sx={{ width: 140 ,height:140}}  />
          
          <Typography  component="h4" variant="h5"  sx={{ mt:'10px'}}>
            Sign in to your Account
          </Typography>
          <Typography  color={'GrayText'}  fontSize={"13px"}  >
            Welcome back! please enter your details
          </Typography>
          
          <Box component="form" noValidate sx={{ mt: 1 }}>
            <TextField
              margin="normal"
              required
              fullWidth
              id="email"
              label="Username"
              name="email"
              autoComplete="email"
              autoFocus

            />

            <TextField
              margin="normal"
              required
              fullWidth
              name="password"
              label="Password"
              //type={showPassword ? 'text' : 'password'}
              id="password"
              autoComplete="current-password"

            />

            <FormControlLabel
              control={<Checkbox value="remember" color="primary" />}
              label="Remember me"
            />
            
            {/* <Grid container >
            <Grid item xs >            
                <LinkMui to variant="body2"  display="flex" justifyContent="flex-end" sx={{ mt: '-30px' }} > 
                <Link to={`/forgot`} >Forgot password?</Link>
                </LinkMui>
              </Grid>
            </Grid> */}
  
            <Button
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 3, mb: 2 , backgroundColor: '#162054'}}
              //onClick={login}
            >
              Sign In
            </Button>
          </Box>
        </Box>
        
      </Container>
    </ThemeProvider>
  );
}