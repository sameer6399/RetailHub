import { Button, Stack, TextField } from "@mui/material";
import Backdrop from "@mui/material/Backdrop";
import Paper from "@mui/material/Paper";
import React, { useState } from "react";
import CloseIcon from "@mui/icons-material/Close";
import "../styles/login.css";
import signupUser from "../services/signupUserService";

function SignupOverlay(props) {
  const [errorMsg, setErrorMsg] = useState("");

  function closeOverlay() {
    props.setSingupOpenState(false);
  }

  async function handleSignupClick() {
    let username = document.getElementById("signup-username").value;
    let password = document.getElementById("signup-password").value;
    let id = document.getElementById("signup-employee-id").value;
    if (username === "" || password === "" || id === "") {
      setErrorMsg("Please enter all the details!");
    } else {
      let params = {
        username: username,
        password: password,
        employeeId: Number(id),
      };
      let response = await signupUser(params);
      if (response.sqlMessage != "") {
        setErrorMsg(response.sqlMessage);
      }
      if (response.affectedRows == 1) {
        closeOverlay();
        alert("Signed up successfully!\nUse the credentials to login");
      }
    }
  }

  return (
    <Backdrop
      sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={true}
    >
      <Paper elevation={3} className="signup-form-container">
        <div className="overlay-title">
          Signup
          <CloseIcon style={{ float: "right" }} onClick={closeOverlay} />
        </div>
        <hr className="hr" />
        <Stack
          className="overlay-content-body"
          direction={"column"}
          spacing={3}
        >
          <TextField
            required
            id="signup-username"
            label="Username"
            size="small"
          />
          <TextField
            required
            id="signup-password"
            label="Password"
            size="small"
            type="password"
          />
          <TextField
            required
            id="signup-employee-id"
            label="Employee ID (contact Manager)"
            size="small"
            type="number"
          />
        </Stack>
        <div className="error-msg">{errorMsg}</div>
        <Stack direction={"row"} spacing={3} className="signup-buttons">
          <Button variant="outlined" onClick={closeOverlay}>
            Cancel
          </Button>
          <Button variant="contained" onClick={handleSignupClick}>
            Signup
          </Button>
        </Stack>
      </Paper>
    </Backdrop>
  );
}

export default SignupOverlay;
