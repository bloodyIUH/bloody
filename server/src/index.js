const express = require('express')

const app = express()
const routes = require('./routes')
const cors = require('cors')

app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
  res.header('Access-Control-Allow-Headers', 'Content-Type')
  next()
})

app.use(cors())

app.use(express.json())
app.use(express.urlencoded({ extended: false }))

app.use('/api', routes)

const PORT = process.env.PORT || 5000

app.listen(PORT, () => console.log(`Server started on port ${PORT}`))
