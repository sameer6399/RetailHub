## Application setup steps:

**Pre-requisite:**
Ensure that Node.js and React.js are installed. If not, download them from the following link: [Node.js and React.js Download](https://nodejs.org/en/download)

**Step 1: Setup the Database:**
- Use the SQL dump file provided in the zip to import the RetailHub database.
- Verify the successful import of the dump.
- If the dump is not working, add the following line after the CREATE DATABASE statement: ` SET SQL_REQUIRE_PRIMARY_KEY = 0; `


**Step 2: Setup the Application Front-end:**

i. Locate the application folder in the zip file, containing "retailhub" and "server" subfolders for frontend and backend, respectively.

ii. Open the terminal and navigate to the "retailhub" folder (frontend).

iii. Use the command: `cd folderlocation` to navigate to the specified folder location.

iv. Install front-end dependencies using: `npm install`

v. Launch the application frontend with: `npm start`

vi. Manually open the application by navigating to: [http://localhost:3000/](http://localhost:3000/)

**Step 3: Setup the Application Backend:**

i. Locate the application folder in the zip file, containing "retailhub" and "server" subfolders for frontend and backend, respectively.

ii. Open the terminal and navigate to the "server" folder (backend).

iii. Install server dependencies using: `npm install`

iv. Run the application server with: `npm start`

v. Check if the server is running on port 4000.

**Step 4: Pointing the Application Code to the Backend Server:**
- Navigate to: `application/server/services/databaseConnectionService.js`
- Open the file `databaseConnectionService.js`.
- In the `config` object on line number 7, provide the appropriate values for hostname, username, port, password, and database according to the imported database.
- Save the file and check if the server is running (refer to step 3.iv).
- Attempt to log in to the application using the provided credentials.

**NOTE:**
If the application stops working, check if the server is running. If not, restart the server (refer to step 3.iv).

**Credentials to Log In:**
1. **Login as Owner:** Username - sameer_ahire, Password - 123
2. **Login as Manager:** Username - akshaychavan7, Password - 12345
3. **Login as Employee:** Username - bob_johnson, Password - 789

**Hosted Application Information:**
- Application Front-end: [https://retailhub.netlify.app/](https://retailhub.netlify.app/)
- Application Backend: [https://retailhub-server.onrender.com/](https://retailhub-server.onrender.com/)
- Application Database: [https://console.aiven.io/](https://console.aiven.io/)

**Open the Hosted Version of the Application:**
You may access the hosted version of the application by visiting this link: [https://retailhub.netlify.app/](https://retailhub.netlify.app/)
Note that, the server might be in the idle state for the first few minutes due to it being a free server, so let the application load properly for the first time.