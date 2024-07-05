const { Pool  } = require('pg');
const pool = new Pool({
    user: 'postgres',          // Reemplaza 'tu_usuario' con tu usuario de PostgreSQL
    host: 'localhost',           // O la dirección de tu servidor PostgreSQL
    database: 'base_horarios',// Reemplaza 'tu_base_de_datos' con el nombre de tu base de datos
    password: 'hans2003',   // Reemplaza 'tu_contraseña' con tu contraseña de PostgreSQL
    port: 5432, 
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