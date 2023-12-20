import { Button, Stack, TextField } from "@mui/material";
import Backdrop from "@mui/material/Backdrop";
import Paper from "@mui/material/Paper";
import React, { useState } from "react";
import CloseIcon from "@mui/icons-material/Close";
import "../styles/employees.css";
import addNewEmployee from "../services/addNewEmployeeService";

function AddEmployeeOverlay(props) {
  const [errorMsg, setErrorMsg] = useState("");

  function closeOverlay() {
    props.setAddEmployeeOverlayOpen(false);
  }

  async function handleAddEmployee() {
    let employeeName = document.getElementById("insert-employeename").value;
    let position = document.getElementById("insert-position").value;
    let phone_number = document.getElementById("insert-phoneno").value;
    let email = document.getElementById("insert-email").value;
    let street_no = document.getElementById("insert-streeno").value;
    let street_name = document.getElementById("insert-streetname").value;
    let town = document.getElementById("insert-town").value;
    let zip = document.getElementById("insert-zip").value;
    let storeid = document.getElementById("insert-storeid").value;

    if (
      employeeName == "" ||
      position == "" ||
      phone_number == "" ||
      street_no == "" ||
      email == "" ||
      street_name == "" ||
      town == "" ||
      zip == "" ||
      storeid == ""
    ) {
      setErrorMsg("Enter all the details correctly!");
    } else {
      setErrorMsg("");
      let params = {
        employeeName: employeeName,
        employeePosition: position,
        email: email,
        phoneNumber: phone_number,
        streetNo: street_no,
        streetName: street_name,
        town: town,
        zipCode: zip,
        storeId: storeid,
      };
      addNewEmployee(params);
      closeOverlay();
      alert("Employee has been added successfully!");
    }
  }

  return (
    <Backdrop
      sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={true}
    >
      <Paper elevation={3} className="add-employee-overlay-container">
        <div className="overlay-title">
          Add new employee
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
            id="insert-employeename"
            label="Employee Name"
            size="small"
          />
          <TextField
            required
            id="insert-position"
            label="Position"
            size="small"
          />
          <TextField required id="insert-email" label="Email" size="small" />
          <TextField
            required
            id="insert-phoneno"
            label="Phone Number"
            size="small"
            type="number"
          />
          <TextField
            required
            id="insert-streeno"
            label="Street Number"
            size="small"
            type="number"
          />
          <TextField
            required
            id="insert-streetname"
            label="Street Name"
            size="small"
          />
          <TextField required id="insert-town" label="Town" size="small" />
          <TextField
            required
            id="insert-zip"
            label="Zip Code"
            size="small"
            type="number"
          />
          <TextField
            required
            id="insert-storeid"
            label="Store ID"
            size="small"
            type="number"
          />
        </Stack>
        <div className="error-msg">{errorMsg}</div>
        <Stack direction={"row"} spacing={3} className="signup-buttons">
          <Button variant="outlined" onClick={closeOverlay}>
            Cancel
          </Button>
          <Button variant="contained" onClick={handleAddEmployee}>
            Add
          </Button>
        </Stack>
      </Paper>
    </Backdrop>
  );
}

export default AddEmployeeOverlay;
