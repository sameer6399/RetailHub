import Grid from "@mui/material/Unstable_Grid2";
import Paper from "@mui/material/Paper";
import "../../styles/inventory.css";
import React, { useState } from "react";
import getItemCategories from "../../services/getItemCategories";
import DataSaverOnIcon from "@mui/icons-material/DataSaverOn";
import CategoryView from "../CategoryView";
import AddCategoryOverlay from "../AddCategoryOverlay";
import { Stack, Alert } from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import deleteItemCategory from "../../services/deleteItemCategoryService";
import EditCategoryOverlay from "../EditCategoryOverlay";
function Inventory() {
  const [categories, setCategories] = useState([]);
  const [cnt, setCnt] = useState(0);
  const [openAddCategoryOverlay, setOpenAddCategoryOverlay] = useState(false);
  const [openEditCategoryOverlay, setOpenEditCategoryOverlay] = useState(false);
  const [openCategoryView, setOpenCategoryView] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState({});
  const [selectedCategoryID, setSelectedCategoryID] = useState(0);
  const [errorCnt, setErrorCnt] = useState(0);
  const [alertType, setAlertType] = useState("error");
  const [alertMessage, setAlertMessage] = useState("");
  const [alertVisible, setAlertVisible] = useState(false);

  React.useEffect(() => {
    (async () => {
      try {
        const response = await getItemCategories({});
        setCategories(response);
      } catch (err) {
        console.log("Error while calling API");
      }
    })();
  }, [cnt]);

  React.useEffect(() => {
    if (alertMessage?.length !== 0) setAlertVisible(true);

    setTimeout(() => {
      setAlertVisible(false);
    }, 5000);
  }, [errorCnt]);

  function handleOpenCategoryView(category) {
    setOpenCategoryView(true);
    setSelectedCategory(category.category);
  }

  async function handleCategoryDelete(e, category) {
    e.stopPropagation();

    let response = await deleteItemCategory({
      category_id: category.category_id,
    });

    if (response?.sqlMessage?.length > 0) {
      setAlertType("error");
      setAlertMessage(response.sqlMessage);
    } else {
      setAlertType("info");
      setAlertMessage("Category has been delete successfully!");
      let updatedCategories = categories.filter(
        (item) => item.category_id !== category.category_id
      );
      setCategories(updatedCategories);
    }
    setErrorCnt(errorCnt + 1);
  }

  function handleCategoryEdit(e, category) {
    e.stopPropagation();
    setSelectedCategoryID(category.category_id);
    setOpenEditCategoryOverlay(true);
    setTimeout(() => {
      const categoryDescriptionEle = document.getElementById(
        "category-description"
      );
      const categoryNameEle = document.getElementById("category-name");
      const categoryEmojiEle = document.getElementById("emoji");
      categoryNameEle.value = category.category_name;
      categoryEmojiEle.value = category.emoji;
      categoryDescriptionEle.value = category.category_description;
      categoryDescriptionEle.focus();
      categoryEmojiEle.focus();
      categoryNameEle.focus();
    }, 0);
  }

  return (
    <div className="inventory-container">
      {alertVisible && (
        <Alert
          severity={alertType}
          sx={{ marginBottom: "10px", marginTop: "10px" }}
        >
          {alertMessage}
        </Alert>
      )}

      {openCategoryView ? (
        <CategoryView
          selectedCategory={selectedCategory}
          setOpenCategoryView={(flag) => setOpenCategoryView(flag)}
        />
      ) : (
        <>
          {openAddCategoryOverlay && (
            <AddCategoryOverlay
              categories={categories}
              setCnt={setCnt}
              setOpenAddCategoryOverlay={(flag) => {
                setOpenAddCategoryOverlay(flag);
              }}
            />
          )}

          {openEditCategoryOverlay && (
            <EditCategoryOverlay
              selectedCategoryID={selectedCategoryID}
              categories={categories}
              setCnt={setCnt}
              setOpenAddCategoryOverlay={(flag) => {
                setOpenEditCategoryOverlay(flag);
              }}
            />
          )}
          <Grid container spacing={3}>
            <Grid key="add-category" className="">
              <Paper
                elevation={1}
                className="paper-inventory"
                onClick={() => setOpenAddCategoryOverlay(true)}
              >
                <Stack direction={"row"}>
                  <DataSaverOnIcon
                    style={{
                      color: "#2563eb",
                      fontSize: "50px",
                      marginTop: "35px",
                    }}
                  />
                  <p className="add-category-txt">Add Category</p>
                </Stack>
              </Paper>
            </Grid>
            {categories.map((category) => {
              return (
                <Grid
                  key={category.category_name}
                  className="grid-item-container"
                >
                  <Paper
                    elevation={1}
                    className="paper-inventory"
                    onClick={() => handleOpenCategoryView({ category })}
                  >
                    <span className="action-icons">
                      <DeleteIcon
                        id={"delete-icon-" + category.category_id}
                        className="delete-icon2"
                        onClick={(e) => handleCategoryDelete(e, category)}
                      />
                      <EditIcon
                        id={"delete-icon-" + category.category_id}
                        className="edit-icon2"
                        onClick={(e) => handleCategoryEdit(e, category)}
                      />
                    </span>

                    <p className="grid-content">
                      <span className="category-icon">{category.emoji}</span>
                      {category.category_name}
                    </p>
                  </Paper>
                </Grid>
              );
            })}
          </Grid>
        </>
      )}
    </div>
  );
}

export default Inventory;
