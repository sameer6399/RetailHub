const mysql = require("mysql2");
const fs = require("fs");

const config = {
  host: "localhost",
  user: "root",
  port: "3306",
  password: "SAMeer@6399",
  database: "RetailHub", // RetailHubMaster
  charset: "utf8mb4",
  connectTimeout: 1000000,
};

module.exports.callProcedure = async (params) => {
  return new Promise(async (resolve, reject) => {
    // Create a connection
    const connection = mysql.createConnection(config);

    try {
      // Connect to the database
      await connection.connect();
      console.log("Connected to the database!");

      // Execute the stored procedure
      connection.query(
        params.procedureCall,
        params.procedureParams,
        (err, results, fields) => {
          // Close the connection
          connection.end();

          if (err) {
            console.error("Error executing stored procedure:", err);
            reject(err);
            return;
          }

          // Process the results
          resolve(results);
        }
      );
    } catch (error) {
      console.error("Error connecting to the database:", error);
      reject(error);
    }
  });
};
