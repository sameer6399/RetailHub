import { Avatar, Typography } from "@mui/material";
import akshayAvtar from "../assets/akshay.png";
import "../styles/top-panel.css";

function TopPanel() {
  let userDetails = JSON.parse(localStorage.getItem("userdetails"));
  return (
    <div className="top-panel">
      <div className="hello-text">
        Hello, {userDetails?.staff_name.split(" ")[0]} 👋
      </div>
      <Avatar
        alt="Akshay Chavan"
        src={akshayAvtar}
        sx={{ width: 45, height: 45 }}
        style={{ marginLeft: "auto", marginRight: "40px" }}
      />
    </div>
  );
}

export default TopPanel;
