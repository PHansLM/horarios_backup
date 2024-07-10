const { Pool  } = require('pg');
const pool = new Pool({
    user: process.env.DB_USER || "postgres",
    host: process.env.DB_HOST || '34.176.17.5',
    database: process.env.DB_DATABASE || "postgres",
    password: process.env.DB_PASSWORD || "cafecito123",
    port: process.env.DB_PORT || "5432",
});

pool.connect((err, client, release) => {
    if (err) {
        console.error('Error al conectar a la base de datos:', err);
    } else {
        console.log('Conexión exitosa a la base de datos');
        release();
    }
});

module.exports = pool;