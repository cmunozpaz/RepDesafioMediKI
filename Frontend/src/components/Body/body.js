import React from "react";
import Calificacion from "../../pages/Calificacion";
import { Route, Routes } from "react-router-dom";
import Login from "../../pages/Login";

const Body = () => {
  return (
    <div>
      <Routes>
        <Route path="/" exact Component={Login}></Route>
        <Route path="/Calificacion" exact Component={Calificacion}></Route>
      </Routes>
    </div>
  );
};

export default Body;
