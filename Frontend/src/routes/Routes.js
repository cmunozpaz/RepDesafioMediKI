import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Menu from "../pages/Menu";
import Login from "../pages/Login";
import Calificacion from "../pages/Calificacion";
import Body from "../components/Body/body";
import Footer from "../components/Footer/footer";
import Header from "../components/Header/header";

function App() {
  return (
    <BrowserRouter>
      {/* <Header />
      <Menu />
      <Body />
      <Footer /> */}
      <Routes>
        <Route exact path="/" Component={Login} />
        <Route exact path="/menu" Component={Menu} />
        <Route exact path="/calificacion" Component={Calificacion} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
