const express = require('express')
const cors = require('cors')

const pool = require('./db').pool

const app = express()

// Middleware

app.use(cors())
app.use(express.json())

// Routes

app.get('/artists', async (req, res) => {
  try {
    const response = await pool.query('SELECT *  FROM "Artist";')
    res.json(response.rows)
  } catch (e) {
    res.status(500).end(e.toString())
  }
})

app.post('/artists', async (req, res) => {
  try {
    const response = await pool.query(
      `INSERT INTO "Artist" ("ArtistId", "Name") VALUES(nextval('artist_artist_id_seq'), $1) RETURNING *;`,
      ['test']
    )
    res.json(response.rows[0])
  } catch (e) {
    res.status(500).end(e.toString())
  }
})

const port = process.env.PORT || 5000

app.listen(port, () => {
  console.log(`Server started on port ${port}`)
})
