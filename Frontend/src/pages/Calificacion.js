import axios from "axios";
import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import Cookies from "universal-cookie";
import {
  Button,
  Card,
  CardHeader,
  Container,
  Row,
  Col,
  CardBody,
  Modal,
} from "reactstrap";
import TablaCalificacion from "../components/ModalCalifi/TablaCalificacion";
import ModalCalificacion from "../components/ModalCalifi/ModalCalificacion";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";

function Calificacion() {
  const [mostrarModal, setMostrarModal] = useState(false);
  const [editar, setEditar] = useState(null);

  const cookies = new Cookies();
  const navigate = useNavigate();

  const [calificacion, setCalificacion] = useState([]);

  const irMenu = () => {
    navigate("/Menu");
  };

  const obtenerCalificacion = async () => {
    try {
      const token = cookies.get("token");
      console.log(token);
      const response = await axios.get(
        "https://localhost:7045/api/Calificacion/ListaCalificacionesActivas",
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      console.log(response);

      if (response.data.mensaje === "ok") {
        const data = await response.data;
        console.log(data.response);

        setCalificacion(data.response);
      } else {
        console.log("Error en la petición");
      }
    } catch (error) {
      // Handle the error here
      console.error(error);
    }
  };

  useEffect(() => {
    obtenerCalificacion();
    if (!cookies.get("id")) {
      navigate("/");
    }
  }, []);

  const guardarCalificacion = async (calificacion) => {
    try {
      const token = cookies.get("token");
      const UsuarioInserto = cookies.get("NombreUsuario");
      const FechaInserto = new Date().toISOString();
      const response = await axios.post(
        "https://localhost:7045/api/Calificacion/CrearCalificacion",
        {
          ...calificacion,
          UsuarioInserto: UsuarioInserto,
          UsuarioModifico: UsuarioInserto,
          FechaInserto: FechaInserto,
          FechaModifico: FechaInserto,
          Estado: "1",
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
          body: JSON.stringify(calificacion),
        }
      );

      console.log(response.data);
      if (response.data.mensaje === "agregado") {
        setMostrarModal(!mostrarModal);
        obtenerCalificacion();
      } else {
        console.log("Error en la petición");
      }
    } catch (error) {
      // Handle the error here
      console.error(error);
    }
  };

  const EdiatarCalificacion = async (calificacion) => {
    try {
      const token = cookies.get("token");
      const UsuarioInserto = cookies.get("NombreUsuario");
      const FechaInserto = new Date().toISOString();
      const response = await axios.put(
        "https://localhost:7045/api/Calificacion/EditarCalificacion",
        {
          ...calificacion,
          UsuarioModifico: UsuarioInserto,
          FechaModifico: FechaInserto,
          Estado: "0",
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
          body: JSON.stringify(calificacion),
        }
      );

      console.log(response.data.mensaje);
      if (response.data.mensaje === "Editado") {
        setMostrarModal(!mostrarModal);
        obtenerCalificacion();
      } else {
        console.log("Error en la petición");
      }
    } catch (error) {
      // Handle the error here
      console.error(error);
    }
  };

  const EliminarCalificacion = async (calificacion) => {
    try {
      var respuesta = window.confirm(
        "¿Estás seguro de eliminar la calificación?"
      );

      if (!respuesta) {
        return;
      }
      const token = cookies.get("token");
      const UsuarioInserto = cookies.get("NombreUsuario");
      const FechaInserto = new Date().toISOString();
      console.log(calificacion);
      const objetoAEnviar = {
        IdCalificacion: calificacion,
        Estado: "0",
      };
      const response = await axios.put(
        "https://localhost:7045/api/Calificacion/EliminarCalificacion",
        objetoAEnviar,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      console.log(response.data.mensaje);
      if (response.data.mensaje === "Elimina") {
        setMostrarModal(false);
        obtenerCalificacion();
      } else {
        console.log("Error en la petición");
      }
    } catch (error) {
      console.error(error);
    }
  };

  return (
    //<div>
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
          <button className="btn btn-danger" onClick={irMenu}>
            Menú
          </button>
        </Toolbar>
      </AppBar>

      <Container>
        <Row className="mt-5">
          <Col sm="12">
            <Card>
              <CardHeader>
                <h5>Calificacion</h5>
              </CardHeader>
              <CardBody>
                <Button
                  size={"sm"}
                  color={"success"}
                  onClick={() => setMostrarModal(!mostrarModal)}
                >
                  Nueva Calificacion
                </Button>
                <hr></hr>
                <TablaCalificacion
                  data={calificacion}
                  setEditar={setEditar}
                  mostrarModal={mostrarModal}
                  setMostrarModal={setMostrarModal}
                  EliminarCalificacion={EliminarCalificacion}
                />
              </CardBody>
            </Card>
          </Col>
        </Row>
        <ModalCalificacion
          mostrarModal={mostrarModal}
          setMostrarModal={setMostrarModal}
          guardarCalificacion={guardarCalificacion}
          editar={editar}
          setEditar={setEditar}
          editarCalificacion={EdiatarCalificacion}
        />
      </Container>
    </div>
  );
}

export default Calificacion;
