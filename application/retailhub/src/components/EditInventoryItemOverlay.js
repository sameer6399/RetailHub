import { Button, Stack, TextField } from "@mui/material";
import Backdrop from "@mui/material/Backdrop";
import Paper from "@mui/material/Paper";
import React, { useState } from "react";
import CloseIcon from "@mui/icons-material/Close";
import "../styles/inventory.css";
import updateInventoryItemDetails from "../services/updateInventoryItemDetails";

function setTextfieldValues(margin, quantity, description) {
  document.getElementById("edit-margin").value = margin;
  document.getElementById("edit-quantity").value = quantity;
  document.getElementById("edit-item-description").value = description;
}

function EditInventoryItemOverlay(props) {
  const [errorMsg, setErrorMsg] = useState("");

  setTimeout(() => {
    setTextfieldValues(
      props.selectedItem.margin,
      props.selectedItem.quantity,
      props.selectedItem["item-description"]
    );
  }, 50);

  function handleEditSave() {
    // let price = document.getElementById("edit-price").value;
    let quantity = document.getElementById("edit-quantity").value;
    let margin = document.getElementById("edit-margin").value;
    let description = document.getElementById("edit-item-description").value;
    // if (price === undefined || price == "" || Number(price) < 0) {
    //   setErrorMsg("Please enter valid value for price!");
    // } else
    if (quantity === undefined || quantity == "" || Number(quantity) < 0) {
      setErrorMsg("Please enter valid value for quantity!");
    } else if (description === undefined || description == "") {
      setErrorMsg("Please enter valid value for description!");
    } else if (Number(margin) < 0 || Number(margin) > 100) {
      setErrorMsg("Please enter valid value for margin percentage!");
    } else {
      setErrorMsg("");
      //   IN item_id_param INT,
      // IN margin_percentage DECIMAL(5, 2),
      // IN new_quantity INT,
      // IN new_description VARCHAR(64)
      let params = {
        item_id: props.selectedItem.id,
        margin_percentage: margin,
        quantity: quantity,
        description: description,
      };
      updateInventoryItemDetails(params);
      setTimeout(props.fetchInventoryItems, 300);
      closeOverlay();
    }
  }

  function closeOverlay() {
    props.setEditState(false);
  }

  return (
    <Backdrop
      sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={true}
    >
      <Paper elevation={3} className="edit-inventory-item-overlay-container">
        <div className="overlay-title">
          Edit Inventory Item Details
          <CloseIcon style={{ float: "right" }} onClick={closeOverlay} />
        </div>
        <hr className="hr" />
        <Stack
          className="overlay-content-body"
          direction={"column"}
          spacing={3}
        >
          <TextField
            id="edit-margin"
            label="Margin %"
            size="small" /*value={price}*/
          />
          <TextField
            id="edit-quantity"
            label="Quantity"
            size="small"
            // value={quantity}
          />
          <TextField
            required
            id="edit-item-description"
            label="Item Description"
            multiline
            rows={3}
            // value={description}
          />
        </Stack>
        <div className="error-msg">{errorMsg}</div>
        <Stack direction={"row"} spacing={3} className="buttons">
          <Button variant="outlined" onClick={closeOverlay}>
            Cancel
          </Button>
          <Button variant="contained" onClick={handleEditSave}>
            Save
          </Button>
        </Stack>
      </Paper>
    </Backdrop>
  );
}

export default EditInventoryItemOverlay;
