import { Button, Stack, TextField } from "@mui/material";
import Backdrop from "@mui/material/Backdrop";
import Paper from "@mui/material/Paper";
import React, { useState } from "react";
import CloseIcon from "@mui/icons-material/Close";
import "../styles/inventory.css";
import updateInventoryItemDetails from "../services/updateInventoryItemDetails";
import insertInventoryItem from "../services/insertInventoryItemService";

function AddInventoryItemOverlay(props) {
  const [errorMsg, setErrorMsg] = useState("");

  function handleAddItem() {
    let userDetails = JSON.parse(localStorage.getItem("userdetails"));
    let itemName = document.getElementById("insert-item-name").value;
    let description = document.getElementById("insert-item-description").value;
    if (itemName === undefined || itemName == "") {
      setErrorMsg("Please enter valid value for Item Name!");
    } else if (description === undefined || description == "") {
      setErrorMsg("Please enter valid value for description!");
    } else {
      setErrorMsg("");
      //   IN item_name_param VARCHAR(64),
      // IN item_description_param VARCHAR(64),
      // IN category_id_param INT,
      // IN chain_id_param INT

      let params = {
        item_name: itemName,
        item_description: description,
        category_id: props.category_id,
        chain_id: userDetails.chain_id,
      };
      insertInventoryItem(params);
      setTimeout(props.fetchInventoryItems, 300);
      closeOverlay();
    }
  }

  function closeOverlay() {
    props.setAddState(false);
  }

  return (
    <Backdrop
      sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={true}
    >
      <Paper elevation={3} className="add-inventory-item-overlay-container">
        <div className="overlay-title">
          Add Inventory Item
          <CloseIcon style={{ float: "right" }} onClick={closeOverlay} />
        </div>
        <hr className="hr" />
        <Stack
          className="overlay-content-body"
          direction={"column"}
          spacing={3}
        >
          <TextField
            id="insert-item-name"
            label="Item Name"
            size="small"
            required
          />
          <TextField
            id="insert-item-description"
            label="Description"
            size="small"
            required
          />
        </Stack>
        <div className="error-msg">{errorMsg}</div>
        <Stack direction={"row"} spacing={3} className="buttons">
          <Button variant="outlined" onClick={closeOverlay}>
            Cancel
          </Button>
          <Button variant="contained" onClick={handleAddItem}>
            Save
          </Button>
        </Stack>
      </Paper>
    </Backdrop>
  );
}

export default AddInventoryItemOverlay;
