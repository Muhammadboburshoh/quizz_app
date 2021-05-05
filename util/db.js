const { Pool } = require('pg')

const pool = new Pool({
  host: 'localhost',
  user: 'muhammadbobur',
  database: 'quiz_app',
  password: '1111',
  port: 5432
})

const rows = async (SQL, ...params) => {

  const connect = await pool.connect()

  try {
    const { rows } = await connect.query(SQL, params)
    return rows
  }
  catch(e) {
    throw e
  }
  finally {
    connect.release()
  }
}

module.exports.rows = rows