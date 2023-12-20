import { Divider, Paper, Stack, Button, Alert } from "@mui/material";

import CloseIcon from "@mui/icons-material/Close";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import React, { useState } from "react";
import getItemsByCategoryAndStoreId from "../services/getItemsByCategoryAndStoreIdService";
import "../styles/inventory.css";
import InventoryTable from "./Table";
import EditInventoryItemOverlay from "./EditInventoryItemOverlay";
import deleteInventoryItem from "../services/deleteInventoryItemService";
import insertInventoryItem from "../services/insertInventoryItemService";
import AddInventoryItemOverlay from "./AddInventoryItemOverlay";

function CategoryView(props) {
  const [rows, setRows] = useState([]);
  const [selectedItem, setSelectedItem] = useState({});
  const [editState, setEditState] = useState(false);
  const [addState, setAddState] = useState(false);
  const [infoMessage, setInfoMessage] = useState("");
  const [infoAlertVisible, setInfoAlertVisible] = useState(false);

  React.useEffect(() => {
    fetchInventoryItems();
  }, []);

  React.useEffect(() => {
    if (infoMessage.length !== 0) setInfoAlertVisible(true);

    setTimeout(() => {
      setInfoAlertVisible(false);
    }, 5000);
  }, [infoMessage]);

  async function fetchInventoryItems() {
    try {
      let userDetails = JSON.parse(localStorage.getItem("userdetails"));
      const response = await getItemsByCategoryAndStoreId({
        storeId: userDetails.chain_id,
        categoryId: props.selectedCategory.category_id,
      });

      let rowsTemp = response.map((item) => {
        return {
          id: item.item_id,
          "item-name": item.item_name,
          "vendor-name": item.vendor_name,
          "item-description": item.item_description,
          price: item.selling_price,
          margin: Number(item.margin_percentage),
          quantity: item.quantity,
          availability: item.stock_status,
        };
      });
      setRows(rowsTemp);
    } catch (err) {
      console.log("Error while calling API");
    }
  }

  function handleItemEdit(params) {
    setEditState(true);
  }

  function handleItemDelete(params) {
    deleteInventoryItem({ item_id: params.id });
    let tempRows = [...rows];
    for (let i = 0; i < rows.length; i++) {
      if (rows[i].id === params.id) {
        tempRows.splice(i, 1);
        setRows(tempRows);
        break;
      }
    }
    setInfoMessage("Deleted the item - " + params.row["item-name"]);
  }

  async function handleAddItem() {
    setAddState(true);
  }

  const columns = [
    {
      field: "item-name",
      headerName: "Item Name",
      width: 300,
      headerAlign: "left",
      align: "left",
    },
    {
      field: "vendor-name",
      headerName: "Vendor Name",
      width: 170,
      headerAlign: "left",
      align: "left",
    },
    {
      field: "item-description",
      headerName: "Item Description",
      width: 300,
      headerAlign: "left",
      align: "left",
    },
    {
      field: "price",
      headerName: "Price",
      width: 150,
      headerAlign: "right",
      align: "right",
    },
    {
      field: "margin",
      headerName: "Margin(%)",
      width: 100,
      headerAlign: "right",
      align: "right",
    },
    {
      field: "quantity",
      headerName: "Quantity",
      width: 150,
      headerAlign: "right",
      align: "right",
    },
    {
      field: "availability",
      headerName: "Availability",
      align: "center",
      headerAlign: "center",
      description: "This column is not sortable.",
      width: 170,
    },
    {
      field: "actions",
      headerName: "Actions",
      headerAlign: "center",
      align: "center",
      description: "This column is not sortable.",
      sortable: false,
      width: 200,
      renderCell: (params) => {
        return (
          <Stack direction={"row"}>
            <EditIcon className="icon" onClick={() => handleItemEdit(params)} />
            <DeleteIcon
              className="icon"
              onClick={() => handleItemDelete(params)}
            />
          </Stack>
        );
      },
    },
  ];

  return (
    <div>
      {editState && (
        <EditInventoryItemOverlay
          fetchInventoryItems={() => fetchInventoryItems()}
          selectedItem={selectedItem}
          setEditState={(flag) => setEditState(flag)}
        />
      )}
      {addState && (
        <AddInventoryItemOverlay
          fetchInventoryItems={() => fetchInventoryItems()}
          category_id={props.selectedCategory.category_id}
          setAddState={(flag) => setAddState(flag)}
        />
      )}
      <Paper elevation={1} className="category-top-pane">
        <Stack direction={"row"}>
          <p className="emoji">{props.selectedCategory.emoji}</p>
          <p className="category-title-txt">
            {props.selectedCategory.category_name}
          </p>
          <Divider
            className="category-title-divider"
            variant="middle"
            orientation="vertical"
            flexItem
          />
          <p className="category-description-txt">
            {props.selectedCategory.category_description}
          </p>
          <CloseIcon
            className="close-btn"
            onClick={() => props.setOpenCategoryView(false)}
          />
        </Stack>
      </Paper>
      <div className="table">
        {infoAlertVisible && (
          <Alert
            severity="info"
            sx={{ marginBottom: "10px", marginTop: "10px" }}
          >
            {infoMessage}
          </Alert>
        )}
        <div className="btn-add-item">
          <Button id="btn-add-item" variant="contained" onClick={handleAddItem}>
            Add Item
          </Button>
        </div>
        <InventoryTable
          setSelectedItem={(item) => {
            setSelectedItem(item);
          }}
          rows={rows}
          columns={columns}
        />
      </div>
    </div>
  );
}

export default CategoryView;
