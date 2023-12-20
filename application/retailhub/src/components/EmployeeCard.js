import Paper from "@mui/material/Paper";
import Avatar from "@mui/material/Avatar";
import { Stack } from "@mui/material";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import "../styles/employees.css";
import React, { useState } from "react";

function EmployeeCard(props) {
  function stringToColor(string) {
    let hash = 0;
    let i;

    /* eslint-disable no-bitwise */
    for (i = 0; i < string.length; i += 1) {
      hash = string.charCodeAt(i) + ((hash << 5) - hash);
    }

    let color = "#";

    for (i = 0; i < 3; i += 1) {
      const value = (hash >> (i * 8)) & 0xff;
      color += `00${value.toString(16)}`.slice(-2);
    }
    /* eslint-enable no-bitwise */

    return color;
  }

  function handleExpand() {
    let accordion = document.getElementById(
      "accordion" + props.details.staff_id
    );
    accordion.classList.toggle("expanded");

    let ele = document.getElementById("expand-icon" + props.details.staff_id);
    if (
      ele.style.transform == undefined ||
      ele.style.transform == "" ||
      ele.style.transform == "rotate(0deg)"
    ) {
      // expanded
      ele.style.transform = "rotate(180deg)";
    } else {
      // shrinked
      ele.style.transform = "rotate(0deg)";
    }
  }

  function stringAvatar(name) {
    name = name + "N A";
    return {
      sx: {
        bgcolor: stringToColor(name),
      },
      children: `${name.split(" ")[0][0]}${name.split(" ")[1][0]}`,
    };
  }
  return (
    <>
      <Paper elevation={1} className="employee-card">
        <Stack direction={"row"}>
          <Avatar
            {...stringAvatar(props.details.staff_name)}
            className="employee-avatar"
          />
          <ExpandMoreIcon
            id={"expand-icon" + props.details.staff_id}
            className="expand-icon"
            onClick={handleExpand}
          />
        </Stack>
        <div className="employee-name-div">{props.details.staff_name}</div>
        <div className="working-since-div">
          Working here since{" "}
          {new Date(props.details.joining_date).getFullYear()}
        </div>
        <div id={"accordion" + props.details.staff_id} className="accordion">
          <hr className="divider" />
          <div className="employee-details-container">
            <div>
              <strong>Employee ID:&nbsp;</strong> {props.details?.staff_id}
            </div>
            <div>
              <strong>Position:</strong> Manager
            </div>
            <div>
              <strong>Email:&nbsp;</strong>
              {props.details?.staff_email}
            </div>
            <div>
              <strong>Phone no.:&nbsp;</strong> {props.details.phone_number}
            </div>
            <div>
              <strong>Address:&nbsp;</strong> {props.details.street_no}{" "}
              {props.details.street_name}, {props.details.town}, Zip -{" "}
              {props.details.zip_code}
            </div>
          </div>
        </div>
      </Paper>
    </>
  );
}

export default EmployeeCard;
