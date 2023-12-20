import { Divider, Stack, Typography } from "@mui/material";
import "../styles/side_navigation.css";
import logo from "../assets/Vista Logos/logo-transparent-png.png";
import DashboardIcon from "@mui/icons-material/Dashboard";
import InventoryIcon from "@mui/icons-material/Inventory";
import WorkspacePremiumIcon from "@mui/icons-material/WorkspacePremium";
import AnalyticsIcon from "@mui/icons-material/Analytics";
import PeopleAltIcon from "@mui/icons-material/PeopleAlt";
import PowerSettingsNewIcon from "@mui/icons-material/PowerSettingsNew";

function highlightSelectedNavItem(selectedElement) {
  document.querySelectorAll("#nav-items")[0].childNodes.forEach((element) => {
    element.firstChild.style.color = "#8f8f93";
    element.lastChild.style.color = "#8f8f93";
    element.style.background = "none";
  });
  selectedElement.firstChild.style.color = "white";
  selectedElement.lastChild.style.color = "white";
  selectedElement.style.background = "#74747461";
}

function onPageLoadNavigationHighlight() {
  switch (window.location.pathname) {
    case "/home":
    case "/home/":
    case "/home/dashboard":
      highlightSelectedNavItem(document.getElementById("nav-dashboard"));
      break;
    case "/home/inventory":
      highlightSelectedNavItem(document.getElementById("nav-inventory"));
      break;
    case "/home/vendors":
      highlightSelectedNavItem(document.getElementById("nav-vendors"));
      break;
    case "/home/finances":
      highlightSelectedNavItem(document.getElementById("nav-finances"));
      break;
    case "/home/employees":
      highlightSelectedNavItem(document.getElementById("nav-employees"));
      break;
    default:
      console.log("path did not match");
  }
}

function SideNavigation({ navigate }) {
  setTimeout(() => {
    onPageLoadNavigationHighlight();
  }, 500);

  const handleNavigation = (path) => {
    highlightSelectedNavItem(document.getElementById("nav-" + path));
    navigate(path);
  };

  const handleLogout = () => {
    localStorage.removeItem("userdetails");
    navigate("/");
  };

  return (
    <div className="side-nav">
      <Stack direction={"column"}>
        <img className="logo" src={logo} alt="logo" />
        <Divider color="#505050" />

        <div id="nav-items">
          <Stack
            id="nav-dashboard"
            direction={"row"}
            className="nav-item"
            onClick={() => handleNavigation("dashboard")}
          >
            <DashboardIcon
              style={{ color: "#8f8f93", fontSize: "20px", marginTop: "4px" }}
            />
            <Typography
              sx={{ color: "#8f8f93", fontSize: "20px", marginLeft: "16px" }}
            >
              Dashboard
            </Typography>
          </Stack>
          <Stack
            id="nav-inventory"
            direction={"row"}
            className="nav-item"
            onClick={() => handleNavigation("inventory")}
          >
            <InventoryIcon
              style={{ color: "#8f8f93", fontSize: "20px", marginTop: "4px" }}
            />
            <Typography
              sx={{ color: "#8f8f93", fontSize: "20px", marginLeft: "16px" }}
            >
              Inventory
            </Typography>
          </Stack>
          <Stack
            id="nav-vendors"
            direction={"row"}
            className="nav-item"
            onClick={() => handleNavigation("vendors")}
          >
            <WorkspacePremiumIcon
              style={{ color: "#8f8f93", fontSize: "20px", marginTop: "4px" }}
            />
            <Typography
              sx={{ color: "#8f8f93", fontSize: "20px", marginLeft: "16px" }}
            >
              Vendors
            </Typography>
          </Stack>
          <Stack
            id="nav-finances"
            direction={"row"}
            className="nav-item"
            onClick={() => handleNavigation("finances")}
          >
            <AnalyticsIcon
              style={{ color: "#8f8f93", fontSize: "20px", marginTop: "4px" }}
            />
            <Typography
              sx={{ color: "#8f8f93", fontSize: "20px", marginLeft: "16px" }}
            >
              Finances
            </Typography>
          </Stack>
          <Stack
            id="nav-employees"
            direction={"row"}
            className="nav-item"
            onClick={() => handleNavigation("employees")}
          >
            <PeopleAltIcon
              style={{ color: "#8f8f93", fontSize: "20px", marginTop: "4px" }}
            />
            <Typography
              sx={{ color: "#8f8f93", fontSize: "20px", marginLeft: "16px" }}
            >
              Employees
            </Typography>
          </Stack>
        </div>
      </Stack>
      <div id="logout" className="logout-div" onClick={handleLogout}>
        <PowerSettingsNewIcon />
        <span className="logout-txt">Logout</span>
      </div>
    </div>
  );
}

export default SideNavigation;
