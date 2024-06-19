import React from "react";
import { Button, Table } from "reactstrap";
//import Producto from "../../pages/Producto";

const TablaCalificacion = ({
  data,
  setEditar,
  mostrarModal,
  setMostrarModal,
  EliminarCalificacion,
}) => {
  console.log(data);

  const enviarDatos = (calificacion) => {
    setEditar(calificacion);
    setMostrarModal(!mostrarModal);
  };

  return (
    <Table striped responsive>
      <thead>
        <tr>
          <th>IdCalificacion</th>
          <th>luchadorPersonaje</th>
          <th>luchadorReto</th>
          <th>Punteo</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        {data.length < 1 ? (
          <tr>
            <td colSpan="6">No hay calificacion</td>
          </tr>
        ) : (
          data.map((item, index) => (
            <tr key={item.id || index}>
              <td>{item.idCalificacion}</td>
              <td>{item.luchadorPersonaje}</td>
              <td>{item.luchadorReto}</td>
              <td>{item.punteo}</td>
              <td>
                <Button
                  color="primary"
                  size="sm"
                  className="me-2"
                  onClick={() => enviarDatos(item)}
                >
                  Editar
                </Button>
                <Button
                  color="danger"
                  size="sm"
                  onClick={() => EliminarCalificacion(item.idCalificacion)}
                >
                  Eliminar
                </Button>
              </td>
            </tr>
          ))
        )}
      </tbody>
    </Table>
  );
};

export default TablaCalificacion;
