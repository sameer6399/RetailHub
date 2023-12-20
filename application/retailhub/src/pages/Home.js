import Dashboard from "../components/nav-components/Dashboard";
import Inventory from "../components/nav-components/Inventory";
import Vendors from "../components/nav-components/Vendors";
import Finances from "../components/nav-components/Finances";
import Employees from "../components/nav-components/Employees";
import SideNavigation from "../components/SideNavigation";
import "../styles/home.css";
import { Route, Routes, useNavigate } from "react-router-dom";
import { Stack } from "@mui/material";
import TopPanel from "../components/TopPanel";

function Home(props) {
  const navigate = useNavigate();
  const userDetails = localStorage.getItem("userdetails");
  if (
    userDetails === undefined ||
    userDetails == null ||
    userDetails.length == 0
  ) {
    window.location.href = "/login";
  }
  return (
    <Stack direction={"row"}>
      <SideNavigation navigate={navigate} />
      <div style={{ height: "100vh", overflowY: "scroll" }}>
        <div style={{ width: "calc(100vw - 300px)" }}>
          <TopPanel />
        </div>
        <div style={{ marginTop: "17px" }}>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/inventory" element={<Inventory />} />
            <Route path="/vendors" element={<Vendors />} />
            <Route path="/finances" element={<Finances />} />
            <Route path="/employees" element={<Employees />} />
          </Routes>
        </div>
      </div>
    </Stack>
  );
}

export default Home;
