import * as React from "react";
import {
  Box,
  Button,
  Card,
  CardContent,
  CardHeader,
  Grid,
  Paper,
  Stack,
  Typography,
} from "@mui/material";

import bagIcon from "../../assets/headers/ic_glass_bag.png";
import buyIcon from "../../assets/headers/ic_glass_buy.png";
import msgIcon from "../../assets/headers/ic_glass_message.png";
import userIcon from "../../assets/headers/ic_glass_users.png";
import "../../styles/dashboard.css";
import {
  BarChart,
  Bar,
  PieChart,
  Pie,
  LineChart,
  Line,
  AreaChart,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
  Cell,
} from "recharts";
import { Link } from "react-router-dom";
import getInfoCounts from "../../services/getInfoCountsService";
import getTopItemCategories from "../../services/getTopItemCategoriesService";
import getTop10Vendors from "../../services/getTop10VendorsService";

const dataArea = [
  { name: "January", uv: 400, pv: 240, amt: 240 },
  { name: "February", uv: 300, pv: 139, amt: 221 },
  { name: "March", uv: 200, pv: 980, amt: 229 },
  { name: "April", uv: 278, pv: 390, amt: 200 },
  { name: "May", uv: 189, pv: 480, amt: 218 },
  { name: "June", uv: 239, pv: 380, amt: 250 },
  { name: "July", uv: 349, pv: 430, amt: 210 },
];

let dataPie = [
  { name: "Category A", value: 400, color: "#8884d8" },
  { name: "Category B", value: 300, color: "#81c99c" },
  { name: "Category C", value: 200, color: "#edb852" },
  { name: "Category H", value: 120, color: "#e91e63" },
];

// const dataBar = [
//   { category: "Category A", value1: 150, value2: 200, value3: 120 },
//   { category: "Category B", value1: 250, value2: 100, value3: 180 },
//   { category: "Category C", value1: 100, value2: 300, value3: 150 },
//   { category: "Category D", value1: 200, value2: 150, value3: 220 },
//   { category: "Category E", value1: 180, value2: 120, value3: 250 },
// ];

let dataBar = [
  { category: "A", value1: 150 },
  { category: "B", value1: 250 },
  { category: "C", value1: 100 },
  { category: "D", value1: 200 },
  { category: "E", value1: 180 },
  { category: "F", value1: 150 },
  { category: "G", value1: 250 },
  { category: "H", value1: 100 },
  { category: "I", value1: 200 },
  { category: "J", value1: 180 },
];

const dataLine = [
  { month: "Jan", users: 100, sessions: 220, revenue: 350 },
  { month: "Feb", users: 150, sessions: 300, revenue: 400 },
  { month: "Mar", users: 200, sessions: 400, revenue: 500 },
  { month: "Apr", users: 250, sessions: 500, revenue: 600 },
  { month: "May", users: 300, sessions: 600, revenue: 700 },
];

function Dashboard() {
  const [infoCounts, setInfoCounts] = React.useState({});
  const [topItemCategories, setTopItemCategories] = React.useState({});
  const [pieChartData, setPieChartData] = React.useState(dataPie);
  const [barGraphData, setBarGraphData] = React.useState(dataBar);

  React.useEffect(() => {
    (async () => {
      let userDetails = JSON.parse(localStorage.getItem("userdetails"));
      let response = await getInfoCounts({ store_id: userDetails.chain_id });
      setInfoCounts(response);

      let topCategories = await getTopItemCategories({
        store_id: userDetails.chain_id,
      });
      setTopItemCategories(topCategories);

      let colors = ["#8884d8", "#81c99c", "#edb852", "#e91e63"];

      dataPie = topCategories.map((item, i) => {
        return {
          name: item.category_name,
          value: item.total_quantity,
          color: colors[i],
        };
      });
      setPieChartData(dataPie);

      let topVendors = await getTop10Vendors({
        chain_id: userDetails.chain_id,
      });

      dataBar = topVendors.map((vendor) => {
        return {
          category: vendor.vendor_name,
          value1: Number(vendor.total_quantity_supplied),
        };
      });

      setBarGraphData(dataBar);
    })();
  }, []);

  let cardMetrics = [
    {
      title: "Categories",
      metrics: infoCounts?.total_categories + "",
      emoji: bagIcon,
    },
    {
      title: "Customers",
      metrics: infoCounts?.total_customers + "",
      emoji: userIcon,
    },
    {
      title: "Stores",
      metrics: infoCounts?.total_stores + "",
      emoji: buyIcon,
    },
    {
      title: "Pending Orders",
      metrics: infoCounts?.pending_orders_count + "",
      emoji: msgIcon,
    },
    {
      title: "Employees",
      metrics: infoCounts?.total_employees + "",
      emoji: buyIcon,
    },
    {
      title: "Vendors",
      metrics: infoCounts?.total_vendors + "",
      emoji: bagIcon,
    },
  ];

  return (
    <Grid
      container
      justifyContent="space-evenly"
      spacing={2}
      style={{
        paddingTop: "20px",
        paddingLeft: 70,
        paddingBottom: "40px",
        paddingRight: 40,
      }}
      className="dashboard-container"
    >
      <Grid item xs={4.5}>
        <Grid container>
          <Grid item xs={12} sm={12}>
            <Typography
              align="left"
              style={{
                fontSize: 40,
                paddingTop: "30px",
                paddingBottom: "20px",
              }}
              variant="h2"
            >
              Welcome to, RetailHuB
            </Typography>
          </Grid>
          <Grid item xs={12} style={{ alignItems: "left" }}>
            <Typography
              align="left"
              style={{
                fontSize: "15px",
                color: "#707070",
              }}
            >
              Explore a state-of-the-art store management solution that
              transforms the way you handle purchase orders. Our platform
              seamlessly integrates intuitive controls for selecting categories,
              specifying items, and managing pricing and quantities.
            </Typography>
            <br />
            <Link to="/home/inventory">
              <Button
                to="/inventory"
                variant="contained"
                color="primary"
                size="small"
              >
                Get Started
              </Button>
            </Link>
          </Grid>
        </Grid>
      </Grid>
      <Grid item xs={1}></Grid>
      <Grid item xs={6.5}>
        <Grid
          container
          justifyContent="space-evenly"
          spacing={2}
          style={{ paddingTop: 25 }}
        >
          {cardMetrics.map((card) => {
            return (
              <Grid item xs={12} sm={4}>
                <Paper
                  component={Stack}
                  spacing={3}
                  direction="row"
                  className="paper2"
                  sx={{
                    px: 3,
                    py: 5,
                    borderRadius: 2,
                    padding: 2,
                  }}
                >
                  {<img alt="icon" src={card.emoji} /> && (
                    <Box sx={{ width: 64, height: 64 }}>
                      {<img alt="icon" src={card.emoji} />}
                    </Box>
                  )}

                  <Stack spacing={0.5}>
                    <Typography variant="h4">
                      {card.metrics?.includes("undefined") ? "" : card.metrics}
                    </Typography>

                    <Typography
                      variant="subtitle2"
                      sx={{ color: "text.disabled" }}
                    >
                      {card.title}
                    </Typography>
                  </Stack>
                </Paper>
              </Grid>
            );
          })}
        </Grid>
      </Grid>

      <Grid item xs={12}>
        <Grid
          container
          justifyContent="space-evenly"
          spacing={2}
          style={{
            paddingTop: "40px",
            paddingBottom: "40px",
          }}
        >
          <Grid item xs={8}>
            <Card>
              <CardHeader title="Top 10 Vendors" />

              <CardContent style={{ paddingRight: 20 }}>
                <ResponsiveContainer width="100%" height={300}>
                  <BarChart
                    data={barGraphData}
                    margin={{ top: 20, right: 30, left: 20, bottom: 5 }}
                  >
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="category" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Bar dataKey="value1" fill="#8884d8" name="Top Vendors" />
                  </BarChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>
          </Grid>
          <Grid item xs={4}>
            {" "}
            <Card>
              <CardHeader title="Top Categories" />

              <CardContent style={{ paddingRight: 20 }}>
                <ResponsiveContainer width="100%" height={300}>
                  <PieChart>
                    <Pie
                      dataKey="value"
                      data={pieChartData}
                      cx="50%"
                      cy="50%"
                      outerRadius={80}
                      label
                      isAnimationActive={false} // Disable animation for better visibility
                    >
                      {pieChartData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={entry.color} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend />
                  </PieChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>
          </Grid>
          <Grid item xs={4}>
            <Card>
              <CardHeader
                title="Monthly Performance"
                subheader="User metrics, Sessions, and Revenue"
              />

              <CardContent style={{ paddingRight: 20 }}>
                <ResponsiveContainer width="100%" height={300}>
                  <LineChart data={dataLine}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="month" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Line type="monotone" dataKey="users" stroke="#8884d8" />
                    <Line type="monotone" dataKey="sessions" stroke="#82ca9d" />
                    <Line type="monotone" dataKey="revenue" stroke="#ffc658" />
                  </LineChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>
          </Grid>
          <Grid item xs={8}>
            {" "}
            <Card>
              <CardHeader title="Monthly Sales Area Chart" />

              <CardContent style={{ paddingRight: 20 }}>
                <ResponsiveContainer width="100%" height={325}>
                  <AreaChart data={dataArea}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="name" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Area
                      type="monotone"
                      dataKey="uv"
                      stackId="1"
                      stroke="#5f4b8b"
                      fill="#8884d8"
                    />
                    <Area
                      type="monotone"
                      dataKey="pv"
                      stackId="1"
                      stroke="#00C49F"
                      fill="#81c99c"
                    />
                    <Area
                      type="monotone"
                      dataKey="amt"
                      stackId="1"
                      stroke="#FFBB28"
                      fill="#edb852"
                    />
                  </AreaChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
  );
}

export default Dashboard;
