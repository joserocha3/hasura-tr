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
    const { limit = 10, offset = 0 } = req.query

    const countResponse = await pool.query(
      'SELECT COUNT ("ArtistId") FROM "Artist";'
    )

    const queryResponse = await pool.query(
      'SELECT *  FROM "Artist" LIMIT $1 OFFSET $2;',
      [limit, offset]
    )

    res.json({
      artists: queryResponse.rows,
      totalCount: countResponse.rows[0].count,
    })
  } catch (e) {
    res.status(500).end(e.toString())
  }
})

app.post('/artists', async (req, res) => {
  try {
    const { artistName } = req.body
    const response = await pool.query(
      `INSERT INTO "Artist" ("ArtistId", "Name") VALUES(nextval('artist_artist_id_seq'), $1) RETURNING *;`,
      [artistName]
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
