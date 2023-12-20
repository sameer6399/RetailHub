const dbService = require("../services/databaseConnectionService");

module.exports.getPasswordForUsername = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetPasswordByUsername(?)",
      procedureParams: [req.body.username],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0][0].Password);
  } catch (e) {
    console.log("Error while fetching password for given username", e);
  }
};

module.exports.getAllDetailsForUsername = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetStaffDetailsByUsername(?)",
      procedureParams: [req.body.username],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0][0]);
  } catch (e) {
    console.log("Error while fetching employee details", e);
  }
};

module.exports.getItemCategories = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetItemCategories()",
      procedureParams: [],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while fetching item categories", e);
  }
};

module.exports.getAllVendorsDetails = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetVendorsByChainID(?)",
      procedureParams: [req.body.chain_id],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while fetching all vendor details", e);
  }
};

module.exports.getAllStores = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetAllChains()",
      procedureParams: [],
    };
    let result = await dbService.callProcedure(requestParams);
    console.log(result);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while fetching all store details", e);
  }
};

module.exports.insertItemCategory = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL InsertItemCategory(?,?,?)",
      procedureParams: [
        req.body.categoryName,
        req.body.categoryDescription,
        req.body.categoryIcon,
      ],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while inserting new item category", e);
  }
};

module.exports.insertTimesheet = async (req, res) => {
  let result;
  try {
    let requestParams = {
      procedureCall: "CALL InsertTimesheet(?,?)",
      procedureParams: [req.body.staff_id, req.body.hours_worked],
    };
    result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    res.send({ sqlMessage: e.sqlMessage });
    console.log("Error while inserting new item category", e);
  }
};

module.exports.getItemsByCategoryAndStoreId = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetItemsByCategoryAndChainId(?,?)",
      procedureParams: [req.body.storeId, req.body.categoryId],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while calling GetItemsByCategoryAndChainId", e);
  }
};

module.exports.updateInventoryItemDetails = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL UpdateItemDetails(?,?,?,?)",
      procedureParams: [
        req.body.item_id,
        Number(req.body.margin_percentage),
        Number(req.body.quantity),
        req.body.description,
      ],
    };
    console.log("==>", [
      req.body.item_id,
      Number(req.body.margin_percentage),
      Number(req.body.quantity),
      req.body.description,
    ]);
    let result = await dbService.callProcedure(requestParams);
    res.send(result);
  } catch (e) {
    console.log("Error while calling updateInventoryItemDetails", e);
  }
};

module.exports.deleteInventoryItem = async (req, res) => {
  try {
    console.log("Inside delete inventory item");
    let requestParams = {
      procedureCall: "CALL DeleteItem(?)",
      procedureParams: [req.body.item_id],
    };
    let result = await dbService.callProcedure(requestParams);
    console.log(result);
    res.send(result);
  } catch (e) {
    console.log("Error while calling deleteInventoryItem", e);
  }
};

module.exports.signupUser = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL UpdateCredentials(?,?,?)",
      procedureParams: [
        req.body.employeeId,
        req.body.username,
        req.body.password,
      ],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result);
  } catch (e) {
    res.send(e);
    // console.log("Error while calling InsertCredentials", e);
  }
};

module.exports.getAllEmployeesDetails = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetStaffByChainID(?)",
      procedureParams: [req.body.chain_id],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while calling getAllEmployeesDetails", e);
  }
};

module.exports.addNewEmployee = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL InsertStaffMembers(?,?,?,?,?,?,?,?,?)",
      procedureParams: [
        req.body.employeeName,
        req.body.employeePosition,
        req.body.email,
        req.body.phoneNumber,
        req.body.streetNo,
        req.body.streetName,
        req.body.town,
        req.body.zipCode,
        req.body.storeId,
      ],
    };
    await dbService.callProcedure(requestParams);
  } catch (e) {
    console.log("Error while calling addNewEmployee", e);
  }
};

module.exports.getEmployeeTimesheet = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetLast30DaysTimesheet(?)",
      procedureParams: [req.body.staff_id],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while calling getEmployeeTimesheet", e);
  }
};

module.exports.deleteItemCategory = async (req, res) => {
  let result;
  try {
    let requestParams = {
      procedureCall: "CALL DeleteCategoryById(?)",
      procedureParams: [req.body.category_id],
    };
    result = await dbService.callProcedure(requestParams);
    res.send(result);
  } catch (e) {
    console.log("Error while calling deleteItemCategory", e);
    let response = {
      code: "ER_SIGNAL_EXCEPTION",
      errno: 1644,
      sqlState: "45000",
      sqlMessage:
        "Cannot delete category with items. Remove items from the category first.",
      sql: "CALL DeleteCategoryById(2)",
    };
    res.send(response);
  }
};

module.exports.updateItemCategory = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL UpdateItemCategory(?,?,?,?)",
      procedureParams: [
        req.body.category_id,
        req.body.category_name,
        req.body.category_description,
        req.body.category_icon,
      ],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    console.log("Error while update item category", e);
  }
};

module.exports.insertOrderFromJson = async (req, res) => {
  try {
    const { storeId, vendorId, itemId, price, count } = req.body;

    if (!storeId || !vendorId || !itemId || !price || !count) {
      return res
        .status(400)
        .json({ success: false, message: "Missing required parameters." });
    }

    let requestParams = {
      procedureCall: "CALL InsertOrderFromJson(?,?,?,?,?)",
      procedureParams: [storeId, vendorId, itemId, price, count],
    };

    await dbService.callProcedure(requestParams);
    res
      .status(200)
      .json({ success: true, message: "Order inserted successfully." });
  } catch (e) {
    console.error("Error while inserting order:", e);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

module.exports.insertInventoryItem = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL InsertItem(?,?,?,?)",
      procedureParams: [
        req.body.item_name,
        req.body.item_description,
        req.body.category_id,
        req.body.chain_id,
      ],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    res.send(result[0]);
    console.log("Error while calling insertInventoryItem", e);
  }
};

module.exports.getInfoCounts = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetInfoCounts(?)",
      procedureParams: [req.body.store_id],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0][0]);
  } catch (e) {
    res.send(result[0]);
    console.log("Error while calling getInfoCounts", e);
  }
};

module.exports.getOrderDetailsWithNames = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetOrderDetailsWithNames()",
      procedureParams: [],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    res.send(result[0]);
    console.log("Error while calling getInfoCounts", e);
  }
};

module.exports.getTopItemCategories = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL GetTopItemCategories(?)",
      procedureParams: [req.body.store_id],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    res.send(result[0]);
    console.log("Error while calling getTopItemCategories", e);
  }
};

module.exports.updateVendorOrder = async (req, res) => {
  try {
    let requestParams = {
      procedureCall: "CALL UpdateVendorOrder(?,?)",
      procedureParams: [req.body.reference_id, req.body.status],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    res.send(result[0]);
    console.log("Error while calling updateVendorOrder", e);
  }
};

module.exports.getTop10Vendors = async (req, res) => {
  console.log("getTop10Vendors", req);
  try {
    let requestParams = {
      procedureCall: "CALL GetTopVendorsForChain(?)",
      procedureParams: [req.body.chain_id],
    };
    let result = await dbService.callProcedure(requestParams);
    res.send(result[0]);
  } catch (e) {
    res.send(result[0]);
    console.log("Error while calling getTop10Vendors", e);
  }
};
