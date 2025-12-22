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

server.get("/apis/movies", async (req, res) => {
  const connection = await createConnection();
  console.log('Salta el endpòint del servidor');
  console.log('Params en el servidor', req.query.genre);
  let movies;

  if (req.query.genre !== "") {
    const queryMoviesGenre = `SELECT * FROM movies WHERE genre = ? ORDER BY title ${req.query.sort}`;
    [movies] = await connection.query(queryMoviesGenre, [req.query.genre]);
  } else {
    const queryMovies = `SELECT * FROM movies  ORDER BY title ${req.query.sort}`;
    [movies] = await connection.query(queryMovies);
  }
  await connection.end();
  res.json(movies);
});
