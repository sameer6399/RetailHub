import { Button, Stack, TextField } from "@mui/material";
import Backdrop from "@mui/material/Backdrop";
import Paper from "@mui/material/Paper";
import React, { useState } from "react";
import CloseIcon from "@mui/icons-material/Close";
import "../styles/inventory.css";
import insertItemCategory from "../services/insertNewItemCategoryService";
import updateItemCategory from "../services/insertNewItemCategoryService copy";

function EditCategoryOverlay(props) {
  const [errorMsg, setErrorMsg] = useState("");

  async function handleAddCategory() {
    let categoryName = document.getElementById("category-name").value;
    let categoryIcon = document.getElementById("emoji").value;
    let categoryDescription = document.getElementById(
      "category-description"
    ).value;
    if (categoryName === undefined || categoryName == "") {
      setErrorMsg("Please enter category name!");
    } else if (categoryDescription === undefined || categoryDescription == "") {
      setErrorMsg("Please enter category description!");
    } else if (
      props.categories &&
      props.categories
        .map((category) => category.category_name)
        .includes(categoryName)
    ) {
      setErrorMsg("Item category already exists!");
    } else {
      try {
        await updateItemCategory({
          category_id: props.selectedCategoryID,
          category_name: categoryName,
          category_description: categoryDescription,
          category_icon: categoryIcon,
        });
        props.setCnt(Math.random());
        closeOverlay();
      } catch (err) {
        console.log("Error while calling API");
      }
    }
  }

  function closeOverlay() {
    props.setOpenAddCategoryOverlay(false);
  }

  return (
    <Backdrop
      sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={true}
    >
      <Paper elevation={3} className="overlay-container">
        <div className="overlay-title">
          Edit new category
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
            id="category-name"
            label="Category Name"
            size="small"
          />
          <TextField id="emoji" label="Category Icon" size="small" />
          <TextField
            required
            id="category-description"
            label="Category Description"
            multiline
            rows={4}
          />
        </Stack>
        <div className="error-msg">{errorMsg}</div>
        <Stack direction={"row"} spacing={3} className="buttons">
          <Button variant="outlined" onClick={closeOverlay}>
            Cancel
          </Button>
          <Button variant="contained" onClick={handleAddCategory}>
            Save
          </Button>
        </Stack>
      </Paper>
    </Backdrop>
  );
}

export default EditCategoryOverlay;
