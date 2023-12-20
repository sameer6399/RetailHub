import getAllEmployeesDetails from "../../services/getAllEmployeesDetailsService";
import "../../styles/employees.css";
import EmployeeCard from "../EmployeeCard";
import React, { useState } from "react";
import Grid from "@mui/material/Unstable_Grid2";
import Button from "@mui/material/Button";
import ControlPointIcon from "@mui/icons-material/ControlPoint";
import AddCategoryOverlay from "../AddCategoryOverlay";
import AddEmployeeOverlay from "../AddEmployeeOverlay";

function Employees() {
  const [employees, setEmployees] = useState([]);
  const [addEmployeeOverlayOpen, setAddEmployeeOverlayOpen] = useState(false);

  React.useEffect(() => {
    (async () => {
      try {
        let userDetails = JSON.parse(localStorage.getItem("userdetails"));
        const response = await getAllEmployeesDetails({
          chain_id: userDetails.chain_id,
        });
        setEmployees(response);
      } catch (err) {
        console.log("Error while calling API");
      }
    })();
  }, [addEmployeeOverlayOpen]);

  function handleAddEmployee() {
    setAddEmployeeOverlayOpen(true);
  }

  return (
    <div className="employees-container">
      {addEmployeeOverlayOpen && (
        <AddEmployeeOverlay
          setAddEmployeeOverlayOpen={(flag) => setAddEmployeeOverlayOpen(flag)}
        />
      )}
      <Grid container spacing={2}>
        {employees.map((employee) => {
          return (
            <Grid key={employee}>
              <EmployeeCard details={employee} />
            </Grid>
          );
        })}
        <Grid>
          <ControlPointIcon
            title="Add new employee"
            className="add-employee-btn"
            onClick={handleAddEmployee}
          />
        </Grid>
      </Grid>
    </div>
  );
}

export default Employees;
