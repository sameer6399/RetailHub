import * as React from "react";
import { DataGrid } from "@mui/x-data-grid";
import { Box, Button, Chip, Grid, LinearProgress } from "@mui/material";
import DoneIcon from "@mui/icons-material/Done";
import FailIcon from "@mui/icons-material/Close";
import getAllVendorsDetails from "../services/getAllVendorsDetails";
import ShoppingBasketTwoToneIcon from "@mui/icons-material/ShoppingBasketTwoTone";

const columns = [
  {
    field: "id",
    headerName: "ID",
    width: 120,
    headerAlign: "center",
    align: "center",
  },
  {
    field: "vendorName",
    headerName: "Vendor Name",
    width: 150,
    headerAlign: "center",
    align: "center",
  },
  {
    field: "vendorEmail",
    headerName: "Vendor Email",
    width: 240,
    headerAlign: "center",
    align: "center",
  },

  {
    field: "poc",
    headerName: "POC Name",
    width: 160,
    headerAlign: "center",
    align: "center",
  },
  {
    field: "phoneNo",
    headerName: "Phone Number",
    headerAlign: "center",
    align: "center",
    width: 200,
  },
  {
    field: "address",
    headerName: "Vendor Address",
    headerAlign: "center",
    align: "center",
    width: 300,
  },
];

export default function VendorData() {
  const [vendorDetails, setVendorDetails] = React.useState([]);

  React.useEffect(() => {
    (async () => {
      try {
        let userDetails = JSON.parse(localStorage.getItem("userdetails"));
        const response = await getAllVendorsDetails({
          chain_id: userDetails.chain_id,
        });
        setVendorDetails(response);
      } catch (err) {
        console.log("Error while calling API");
      }
    })();
  }, []);

  const rows = vendorDetails.map((data) => ({
    id: data.vendor_id,
    vendorName: data.vendor_name,
    vendorEmail: data.email,
    phoneNo: data.point_of_contact_phone_number,
    poc: data.point_of_contact_name,
    address:
      data.street_no +
      " " +
      data.street_name +
      ", " +
      data.town +
      ", " +
      data.state +
      ", " +
      data.zip_code,
  }));

  return (
    <div style={{ width: "100%", borderColor: "primary" }}>
      <DataGrid
        components={{
          NoRowsOverlay: () => (
            <Grid
              container
              justifyContent="center"
              spacing={2}
              style={{ height: "250px" }}
              alignItems="center"
              padding={2}
            >
              <Grid item xs={12} sm={12}>
                <ShoppingBasketTwoToneIcon
                  color="#D3D3D3"
                  style={{ fontSize: 60 }}
                />
                <br />
                <br />
                <span
                  style={{
                    fontSize: 15,
                    fontWeight: 300,
                  }}
                >
                  To add items to the vendor order, fill the adjacent form.
                </span>
              </Grid>
            </Grid>
          ),
        }}
        rows={rows}
        columns={columns}
        autoHeight={true}
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
