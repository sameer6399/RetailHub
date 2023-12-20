import * as React from "react";
import { DataGrid } from "@mui/x-data-grid";
import {
  Box,
  Button,
  Chip,
  Grid,
  IconButton,
  LinearProgress,
  Switch,
} from "@mui/material";
import FailIcon from "@mui/icons-material/Close";
import DoneIcon from "@mui/icons-material/Done";
import getOrderDetailsWithNames from "../services/getOrderDetailsWithNamesService";
import updateVendorOrder from "../services/updateVendorOrder";
import Tooltip from "@mui/material/Tooltip";

export default function FinancesIncome() {
  const [gridValues, setgridValues] = React.useState([]);
  const [cnt, setCnt] = React.useState(0);

  const handleChange = (event) => {
    setgridValues(event.target.checked);
  };

  React.useEffect(() => {
    (async () => {
      let response = await getOrderDetailsWithNames();
      await setgridValues(response);
    })();
  }, [cnt]);

  function getOrderStatus(reference_id) {
    return gridValues.filter((order) => {
      order.reference_id = reference_id;
    });
  }

  const convertIDbasedListToArray = (data, nameOfEntity) => {
    let resultantArray = [];
    [...data].forEach((row, i) => {
      resultantArray.push(row[nameOfEntity]);
    });
    return resultantArray;
  };

  const convertToCustomFormat = (isoDateTime) => {
    const dateObj = new Date(isoDateTime);

    const estOffset = -5 * 60 * 60 * 1000;
    dateObj.setTime(dateObj.getTime() + estOffset);

    const day = dateObj.getDate().toString().padStart(2, "0");
    const month = (dateObj.getMonth() + 1).toString().padStart(2, "0");
    const year = dateObj.getFullYear();
    const hours = dateObj.getHours() % 12 || 12;
    const minutes = dateObj.getMinutes().toString().padStart(2, "0");
    const ampm = dateObj.getHours() >= 12 ? "PM" : "AM";

    const customFormat = `${day}/${month}/${year}, ${hours}:${minutes} ${ampm}`;
    return customFormat;
  };

  async function handleApproveClick(params, jobStatus, sendStatus) {
    if (jobStatus === "Pending") {
      let response = await updateVendorOrder({
        reference_id: params.row.reference_id,
        status: sendStatus,
      });
      setCnt(cnt + 1);
    } else {
      let status = jobStatus === "Success" ? "accepted" : "rejected";
      alert("Order has been already " + status + "!");
    }
  }

  const columns = [
    {
      field: "id",
      headerName: "Ref. No",
      width: 100,
      headerAlign: "center",
      align: "center",
    },
    {
      field: "vendorName",
      headerName: "Vendor Name",
      width: 160,
      headerAlign: "center",
      align: "center",
    },
    {
      field: "item",
      headerName: "Item Name",
      width: 220,
      headerAlign: "center",
      align: "center",
    },
    {
      field: "itemCount",
      headerName: "Item Count",
      width: 120,
      headerAlign: "center",
      align: "center",
    },
    {
      field: "totalCost",
      headerName: "Total Cost",
      width: 120,
      headerAlign: "center",
      align: "center",
    },

    {
      field: "dateTime",
      headerName: "Date and Time",
      type: "number",
      headerAlign: "center",
      align: "center",
      width: 200,
    },
    {
      field: "jobStatus",
      headerName: "Order Status",
      align: "center",
      headerAlign: "center",
      description: "This column is not sortable.",
      sortable: false,
      width: 180,
      renderCell: (params) => {
        //const jobStatus = this.state.execution_status[params.id - 1];
        const jobStatus = params.row.status;
        //["completed", "failed", "pending"];
        //const random = Math.floor(Math.random() * job_statuses.length);
        // const jobStatus = job_statuses[random];
        return (
          <Grid container direction="row" justifyContent="center" spacing={2}>
            {jobStatus === "Success" ? (
              <Chip
                icon={
                  <DoneIcon fontSize="small" style={{ color: "#388e3c" }} />
                }
                variant="outlined"
                size="small"
                style={{ borderColor: "#388e3c", color: "#388e3c" }}
                label="Success"
              />
            ) : jobStatus === "Failed" ? (
              <Chip
                icon={
                  <FailIcon fontSize="small" style={{ color: "#d32f2f" }} />
                }
                variant="outlined"
                size="small"
                style={{
                  borderColor: "#d32f2f",
                  color: "#d32f2f",
                  paddingLeft: "5px",
                }}
                label="Failed"
              />
            ) : (
              <Chip
                icon={
                  <Box sx={{ width: "20%", padding: 0 }}>
                    <LinearProgress />
                  </Box>
                }
                variant="outlined"
                size="small"
                style={{
                  borderColor: "#0076ce",
                  color: "#0076ce",
                  paddingLeft: "5px",
                  width: "50%",
                }}
                label="Pending"
              />
            )}
          </Grid>
        );
      },
    },
    {
      field: "actions",
      headerName: "Actions",
      headerAlign: "center",
      align: "center",
      description: "This column is not sortable.",
      sortable: false,
      width: 180,
      renderCell: (params) => {
        const jobStatus = params.row.status;
        const onClick = (e) => {
          const actions = gridValues[params.id - 1].status;
        };

        return (
          <Grid container direction="row" justifyContent="center" spacing={0}>
            <Grid item>
              <Tooltip
                title={
                  jobStatus === "Success"
                    ? "Order has been already added to inventory"
                    : "Accept order and add to inventory"
                }
              >
                <IconButton
                  aria-label="done"
                  size="large"
                  style={{
                    color: jobStatus !== "Pending" ? "#afafaf" : "#4caf50",
                  }}
                  onClick={() =>
                    handleApproveClick(params, jobStatus, "Success")
                  }
                >
                  <DoneIcon fontSize="inherit" />
                </IconButton>
              </Tooltip>
            </Grid>
            <Grid item>
              <Tooltip
                title={
                  jobStatus === "Success"
                    ? "Order has been already added to inventory"
                    : "Reject order"
                }
              >
                <IconButton
                  aria-label="fail"
                  size="large"
                  style={{
                    color: jobStatus !== "Pending" ? "#afafaf" : "#d32f2f",
                  }}
                  onClick={() =>
                    handleApproveClick(params, jobStatus, "Failed")
                  }
                >
                  <FailIcon fontSize="inherit" />
                </IconButton>
              </Tooltip>
            </Grid>
          </Grid>

          //getOrderDetailsWithNames
        );
      },
    },
  ];

  const rows = gridValues.map((row, index) => ({
    id: index,
    srno: index + 1,
    reference_id: row.reference_id,
    vendorName: row.vendor_name,
    item: row.item_name,
    itemCount: row.purchase_qty,
    totalCost: row.item_total_cost,
    dateTime: row.purchase_date,
    status: row.status,
  }));

  return (
    <div style={{ width: "100%", borderColor: "primary" }}>
      <DataGrid
        rows={rows}
        columns={columns}
        autoHeight={true}
        // onRowClick={handleRowClick}
        initialState={{
          pagination: {
            paginationModel: { page: 0, pageSize: 10 },
          },
        }}
        pageSizeOptions={[5, 10]}
        disableSelectionOnClick
      />
    </div>
  );
}
