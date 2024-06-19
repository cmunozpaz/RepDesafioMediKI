import React, { useState, useEffect } from "react";
import Cookies from "universal-cookie";
import {
  Modal,
  ModalBody,
  ModalHeader,
  Form,
  FormGroup,
  Label,
  ModalFooter,
  Button,
  Input,
} from "reactstrap";
const cookies = new Cookies();

const modeloCalificacion = {
  IdCalificacion: 0,
  IdLuchadorPersonaje: "",
  IdLuchadorReto: "",
  Punteo: "",
};

const ModalCalificacion = ({
  mostrarModal,
  setMostrarModal,
  guardarCalificacion,
  editar,
  setEditar,
  editarCalificacion,
}) => {
  const [calificacion, setCalificacion] = useState(modeloCalificacion);

  const actualizarDato = (e) => {
    console.log(e.target.name + " " + e.target.value);
    setCalificacion({ ...calificacion, [e.target.name]: e.target.value });
  };

  const enviarDatos = () => {
    if (calificacion.IdCalificacion == 0) {
      guardarCalificacion(calificacion);
    } else editarCalificacion(calificacion);

    setCalificacion(modeloCalificacion);
  };

  useEffect(() => {
    if (editar != null) {
      setCalificacion(editar);
    } else {
      setCalificacion(modeloCalificacion);
    }
  }, [editar]);

  const cerrarModal = () => {
    setMostrarModal(!mostrarModal);
    setEditar(null);
  };

  return (
    <Modal isOpen={mostrarModal}>
      <ModalHeader>
        {" "}
        {calificacion.IdCalificacion == 0
          ? "Nueva Calificacion"
          : "Ediatar Contacto"}{" "}
      </ModalHeader>
      <ModalBody>
        <Form>
          <FormGroup>
            <Label>Luchador Personaje</Label>
            <Input
              name="IdLuchadorPersonaje"
              onChange={(e) => actualizarDato(e)}
              value={calificacion.IdLuchadorPersonaje}
            />
          </FormGroup>
          <FormGroup>
            <Label>Luchador Reto</Label>
            <Input
              name="IdLuchadorReto"
              onChange={(e) => actualizarDato(e)}
              value={calificacion.IdLuchadorReto}
            />
          </FormGroup>
          <FormGroup>
            <Label>Punteo</Label>
            <Input
              name="Punteo"
              onChange={(e) => actualizarDato(e)}
              value={calificacion.Punteo}
            />
          </FormGroup>
        </Form>
      </ModalBody>
      <ModalFooter>
        <Button color="primary" onClick={enviarDatos}>
          Guardar
        </Button>
        <Button
          color="danger"
          onClick={(cerrarModal) => setMostrarModal(!mostrarModal)}
        >
          Cerrar
        </Button>
      </ModalFooter>
    </Modal>
  );
};

export default ModalCalificacion;
