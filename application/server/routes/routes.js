const controller = require("../controllers/controller");

module.exports = (app) => {
  // app.get("/fetchData", controller.fetchData);
  app.post("/getPassword", controller.getPasswordForUsername);
  app.post("/getAllDetailsForUsername", controller.getAllDetailsForUsername);
  app.get("/getItemCategories", controller.getItemCategories);
  app.post("/insertItemCategory", controller.insertItemCategory);
  app.post("/insertTimesheet", controller.insertTimesheet);
  app.post(
    "/getItemsByCategoryAndStoreId",
    controller.getItemsByCategoryAndStoreId
  );

  app.post(
    "/updateInventoryItemDetails",
    controller.updateInventoryItemDetails
  );

  app.post("/deleteInventoryItem", controller.deleteInventoryItem);
  app.post("/signupUser", controller.signupUser);
  app.post("/getAllEmployeesDetails", controller.getAllEmployeesDetails);
  app.post("/addNewEmployee", controller.addNewEmployee);
  app.post("/getAllVendorsDetails", controller.getAllVendorsDetails);
  app.get("/getAllStores", controller.getAllStores);
  app.post("/getEmployeeTimesheet", controller.getEmployeeTimesheet);
  app.post("/deleteItemCategory", controller.deleteItemCategory);
  app.post("/updateItemCategory", controller.updateItemCategory);
  app.post("/insertOrderFromJson", controller.insertOrderFromJson);
  app.post("/insertInventoryItem", controller.insertInventoryItem);
  app.post("/getInfoCounts", controller.getInfoCounts);
  app.get("/getOrderDetailsWithNames", controller.getOrderDetailsWithNames);
  app.post("/updateVendorOrder", controller.updateVendorOrder);
  app.post("/getTopItemCategories", controller.getTopItemCategories);
  app.post("/getTop10Vendors", controller.getTop10Vendors);
};
