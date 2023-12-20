import { BrowserRouter, Route, Routes } from "react-router-dom";
import Login from "./pages/Login";
import Home from "./pages/Home";
import React, { useState } from "react";
import Timesheet from "./components/Timesheet";
function App() {
  return (
    <div>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Login />} exact />
          <Route path="login" element={<Login />} />
          <Route path="home/*" element={<Home />} />
          <Route path="timesheet" element={<Timesheet />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
