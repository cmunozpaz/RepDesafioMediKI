import React, { useEffect } from "react";
import Cookies from "universal-cookie";
import "../css/Menu.css";
import { useNavigate } from "react-router-dom";
import Producto from "./Calificacion";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";

function Menu() {
  const cookies = new Cookies();
  const navigate = useNavigate();

  // Método para borrar cookies y redirigir al login
  const cerrarSesion = () => {
    console.log("ID Cookie: ", cookies.get("id"));
    cookies.remove("id", { path: "/" });
    cookies.remove("token", { path: "/" });
    cookies.remove("NombreUsuario", { path: "/" });
    navigate("/");
  };

  useEffect(() => {
    if (!cookies.get("id")) {
      navigate("/");
    }
  }, []);

  const mostrarProductos = () => {
    navigate("/Calificacion");
  };

  return (
    <div>
      <AppBar position="static">
        <Toolbar style={{ justifyContent: "space-between" }}>
          <img
            src={
              "https://img.icons8.com/?size=100&id=nUBuSZYwsEYo&format=png&color=000000"
            }
            alt="Logo"
            height="100"
          />
          <Typography variant="h6" component="div"></Typography>
          <button className="btn btn-danger" onClick={cerrarSesion}>
            Cerrar Sesión
          </button>
        </Toolbar>
      </AppBar>
      <div className="containerMenu">
        <br />

        {/* <h5>ID: {cookies.get("id")}</h5> */}
        <br />

        <button className="btn btn-danger" onClick={mostrarProductos}>
          Calificacion
        </button>
      </div>
    </div>
  );
}

export default Menu;
