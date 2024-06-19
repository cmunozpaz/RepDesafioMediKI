import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Cookies from "universal-cookie";
import axios from "axios";
import "../css/Login.css";
import { useNavigate } from "react-router-dom";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";

function Login() {
  const baseUrl = "https://localhost:7045/api/Autenticacion/Validar";
  const cookies = new Cookies();

  const navigate = useNavigate();

  const [form, setForm] = useState({
    CorreoUsuario: "",
    ClaveUsuario: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm({
      ...form,
      [name]: value,
    });
    console.log(form);
  };

  const iniciarSesion = async () => {
    try {
      const response = await axios.post(baseUrl, { ...form });
      console.log("Veo la respuesta");
      console.log(response.length);
      console.log(response);

      if (
        response.data.token !== "" &&
        Object.keys(response.data || {}).length > 0
      ) {
        const respuesta = response.data;
        cookies.set("id", respuesta.id);
        cookies.set("token", respuesta.token);
        cookies.set("NombreUsuario", respuesta.nombre);
        alert("Bienvenido: " + "  " + respuesta.correo);
        navigate("/menu");
        console.log(response);
      } else {
        alert("El usuario o la contraseña no son correctos");
      }
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    if (cookies.get("token")) {
      navigate("/menu");
    }
  }, []);

  return (
    <div
      style={{
        backgroundImage: `url("https://www.xtrafondos.com/wallpaper/3840x2160/12349-goku-y-shen-long.html#&gid=1&pid=1")`, // Reemplaza con la URL de tu imagen
        backgroundPosition: "center",
        backgroundSize: "cover",
        backgroundRepeat: "no-repeat",
      }}
    >
      <div>
        <AppBar position="static">
          <Toolbar>
            <img
              src={
                "https://img.icons8.com/?size=100&id=nUBuSZYwsEYo&format=png&color=000000"
              }
              alt="Logo"
              height="100"
            />
            <Typography variant="h6" component="div"></Typography>
          </Toolbar>
        </AppBar>
        {/* Aquí va el resto de tu código de formulario de inicio de sesión */}

        <div className="containerPrincial">
          <div className="containerLogin">
            <div className="form-agroup">
              <label>Correo: </label>
              <br />
              <input
                type="text"
                className="form-control"
                name="CorreoUsuario"
                onChange={handleChange}
              />
              <label>Clave: </label>
              <br />
              <input
                type="password"
                className="form-control"
                name="ClaveUsuario"
                onChange={handleChange}
              />
              <br />
              <button className="btn btn-primary" onClick={iniciarSesion}>
                Iniciar Sesion
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Login;
