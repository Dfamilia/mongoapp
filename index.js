import express from "express";
import mongoose from "mongoose";

const Animal = mongoose.model(
  "Animal",
  new mongoose.Schema({
    tipo: String,
    estado: String,
  })
);

const app = express();

mongoose.connect(
  /* 
  En esta URL pasan muchas cosas, como cuales:
  
  1- Tiene user(nico) y pass (password)
  2- Indica a que maquina o contenedor debe conectarse con su puerto (localhost:27017)(monguito)
  3- Indica el nombre de la BD que se utilizara (miapp)
  4- Indica que accedera con una autorizacion de Admin (admin) 
  */
  "mongodb://nico:password@monguito:27017/miapp?authSource=admin"
);

app.get("/", async (_req, res) => {
  console.log("listando datos...");
  const animales = await Animal.find();
  return res.send(animales);
});
app.get("/crear", async (_req, res) => {
  console.log("creando data...");
  await Animal.create({ tipo: "Chanchito", estado: "Feliz" });
  return res.send("ok");
});

app.listen(3000, () => console.log("listening..."));
