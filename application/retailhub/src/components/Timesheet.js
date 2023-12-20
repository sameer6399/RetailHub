import "../styles/timesheet.css";
import TopPanel from "./TopPanel";
import { LineChart } from "@mui/x-charts/LineChart";
import {
  Stack,
  Alert,
  Grid,
  Card,
  CardHeader,
  CardContent,
} from "@mui/material";
import Paper from "@mui/material/Paper";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import insertTimesheet from "../services/insertTimesheetService";
import { React, useState, useEffect } from "react";
import getEmployeeTimesheet from "../services/getEmployeeTimesheetService";
import { ResponsiveContainer } from "recharts";

function Timesheet(props) {
  const [alertMessage, setAlertMessage] = useState("");
  const [alertVisible, setAlertVisible] = useState(false);
  const [cnt, setCnt] = useState(0);
  const [alertType, setAlertType] = useState("");
  const [timesheet, setTimesheet] = useState([]);
  const [last30HoursWorked, setLast30DaysHoursWorked] = useState([]);

  useEffect(() => {
    (async () => {
      let userDetails = JSON.parse(localStorage.getItem("userdetails"));
      let response = await getEmployeeTimesheet({
        staff_id: userDetails.staff_id,
      });
      setTimesheet(response);

      let lastMonthHours = response?.map((item) => {
        return item.hours_worked;
      });

      setLast30DaysHoursWorked(lastMonthHours);
    })();
  }, []);

  useEffect(() => {
    if (alertMessage.length !== 0) setAlertVisible(true);

    setTimeout(() => {
      setAlertVisible(false);
    }, 5000);
  }, [cnt]);

  async function handleSubmitTimesheet() {
    let userDetails = JSON.parse(localStorage.getItem("userdetails"));
    let hours = Number(document.getElementById("hours-worked-textfield").value);
    if (hours < 1 || hours > 9) {
      setCnt(cnt + 1);
      setAlertType("error");
      setAlertMessage(
        "Hours value " +
          hours +
          " is not allowed! Please make sure you enter correct value(0-9)."
      );
    } else {
      const response = await insertTimesheet({
        staff_id: userDetails.staff_id,
        hours_worked: hours,
      });
      if (response?.sqlMessage?.length > 0) {
        setAlertType("error");
        setAlertMessage(response.sqlMessage);
      } else {
        setAlertType("info");
        setAlertMessage("Timesheet logged successfully!");
      }
      setCnt(cnt + 1);
    }
  }

  return (
    <>
      <TopPanel />
      <div className="hours-worked-div">
        <strong>Hours worked:</strong>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <TextField
          id="hours-worked-textfield"
          label=""
          variant="outlined"
          size="small"
          type="number"
          sx={{ width: "100px" }}
        />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <Button variant="contained" onClick={handleSubmitTimesheet}>
          Submit
        </Button>
      </div>
      {alertVisible && (
        <Alert
          severity={alertType}
          sx={{ marginBottom: "10px", marginTop: "10px" }}
        >
          {alertMessage}
        </Alert>
      )}

      <Grid item xs={12}>
        <Grid
          container
          justifyContent="space-evenly"
          spacing={2}
          style={{
            paddingTop: "40px",
            paddingBottom: "40px",
          }}
        >
          <Grid item xs={8}>
            <Card>
              <CardHeader
                title="Timesheet Line Chart"
                subheader="Day wise representation of employee attendance"
              />

              <CardContent style={{ paddingRight: 20 }}>
                <ResponsiveContainer width="100%" height={300}>
                  {last30HoursWorked?.length > 0 && (
                    <LineChart
                      xAxis={[
                        { data: [...Array(last30HoursWorked?.length).keys()] },
                      ]}
                      series={[
                        {
                          data: last30HoursWorked?.reverse(),
                        },
                      ]}
                      width={500}
                      height={300}
                    />
                  )}
                </ResponsiveContainer>
              </CardContent>
            </Card>
          </Grid>
        </Grid>
      </Grid>
    </>
  );
}

export default Timesheet;
