import { Button, TextField } from "@mui/material";
import "../styles/login.css";
import Paper from "@mui/material/Paper";
import React, { useState } from "react";
import getPassword from "../services/getPasswordService";
import { Link, useNavigate } from "react-router-dom";
import SignupOverlay from "../components/SignupOverlay";
import getAllDetailsForUsername from "../services/getAllDetailsForUsernameService";
import Checkbox from "@mui/material/Checkbox";
import Select from "@mui/material/Select";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import getAllStores from "../services/getAllStores";

function Login() {
  const navigate = useNavigate();
  const [invalidMsg, setMsg] = useState("Invalid username or password!");
  const [invalidCredentials, setInvalidCredentials] = useState(false);
  const [singupOpenState, setSingupOpenState] = useState(false);
  const [loginAsOwner, setLoginAsOwner] = useState(false);
  const [stores, setStores] = useState({});
  const [selectedStoreID, setSelectedStoreID] = useState(null);

  React.useEffect(() => {
    (async () => {
      const response = await getAllStores();
      setStores(response);
    })();
  }, []);

  const handleLogin = async () => {
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    if (
      username === undefined ||
      username == "" ||
      password === undefined ||
      password == ""
    ) {
      setMsg("Please enter username and password!");
      setInvalidCredentials(true);
    } else {
      fetchPassword(username).then(async (dbPassword) => {
        if (password == dbPassword) {
          setInvalidCredentials(false);
          let details = await getAllDetailsForUsername({ username: username });
          if (details.role_type === "Employee") {
            navigate("/timesheet");
            localStorage.setItem("userdetails", JSON.stringify(details));
          } else {
            if (details.role_type === "Owner") {
              if (selectedStoreID == null) {
                setMsg("Please select storeID from the above dropdown!");
                setInvalidCredentials(true);
                return;
              } else {
                details.chain_id = selectedStoreID;
              }
            }
            navigate("/home");
            localStorage.setItem("userdetails", JSON.stringify(details));
          }
        } else {
          setMsg("Invalid username or password!");
          setInvalidCredentials(true);
        }
      });
    }
  };

  async function fetchPassword(username) {
    try {
      const response = await getPassword({ username: username });
      return response;
    } catch (err) {
      console.log("Error while calling API");
    }
  }

  function handleSignup() {
    setSingupOpenState(true);
  }

  function handleOwnerCheckboxChange(isChecked) {
    setSelectedStoreID(null);
    setLoginAsOwner(isChecked);
  }

  return (
    <div>
      {singupOpenState && (
        <SignupOverlay
          setSingupOpenState={(flag) => setSingupOpenState(flag)}
        />
      )}
      <div className="login-card-container">
        <Paper className="login-card" elevation={3}>
          <div className="card-title">RetailHub</div>
          <div className="login-textfield">
            <TextField id="username" label="Username" size="small" required />
          </div>
          <div className="login-textfield">
            <TextField
              id="password"
              label="Password"
              size="small"
              type="password"
              required
            />
          </div>
          {loginAsOwner && (
            <FormControl fullWidth>
              <InputLabel
                id="demo-simple-select-label"
                sx={{ lineHeight: "14px" }}
              >
                Store
              </InputLabel>
              <Select
                labelId="demo-simple-select-label"
                id="store-select"
                label="Store"
                size="small"
                onChange={(e) => {
                  setSelectedStoreID(e.target.value);
                }}
              >
                {stores.map((store) => {
                  return (
                    <MenuItem value={store.chain_id}>
                      {store.chain_id} - {store.street_name}
                    </MenuItem>
                  );
                })}
              </Select>
            </FormControl>
          )}

          <div className="login-as-owner">
            <Checkbox
              onChange={(e) => handleOwnerCheckboxChange(e.target.checked)}
            />{" "}
            Login as owner
          </div>

          <div className="login-btn-container">
            <Button
              variant="contained"
              className="login-btn"
              onClick={handleLogin}
            >
              Login
            </Button>
          </div>
          <div className="signup-txt">
            New user? Signup{" "}
            <span className="signup-open" onClick={handleSignup}>
              here
            </span>
          </div>
          <div
            className="invalid-msg"
            style={{ display: invalidCredentials ? "block" : "none" }}
          >
            {invalidMsg}
          </div>
        </Paper>
      </div>
    </div>
  );
}

export default Login;
