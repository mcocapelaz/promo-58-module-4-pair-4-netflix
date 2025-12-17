const express = require("express");
const cors = require("cors");
require("dotenv").config();
const mySql = require("mysql2/promise");

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

const dataConnection = {
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT,
  database: "netflix",
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
};

const createConnection = async () => {
  const connection = await mySql.createConnection(dataConnection);
  await connection.connect();
  return connection;
};

server.get("/apis/netflix-v1/empty.json", async (req, res) => {
  const queryMovies = "SELECT * FROM movies";
  const connection = await createConnection();
  const [result] = await connection.query(queryMovies);
  await connection.end();
  res.json(result);
});

