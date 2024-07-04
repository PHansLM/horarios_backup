const express = require('express');
const { Pool  } = require('pg');

const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const PORT = process.env.PORT || 5000;

app.use(cors());

const connectionString ="MAS - IPSP";

const pool = new Pool({
    user: 'postgres',          // Reemplaza 'tu_usuario' con tu usuario de PostgreSQL
    host: 'localhost',           // O la dirección de tu servidor PostgreSQL
    database: 'umsshorarios',// Reemplaza 'tu_base_de_datos' con el nombre de tu base de datos
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

app.get('/get-carreras', async (res) => {
    try {
        const consulta = 'SELECT * FROM "public"."carrera"';
        const resultado = await pool.query(consulta);
        res.json(resultado.rows);
    } catch (error) {
        console.error('Error al obtener las carreras:', error);
        res.status(500).json({ error: 'Error al obtener carreras' });
    }
});

app.get('/get-materias', async (req, res) => {
    try {
        const {id_carrera} = req.query;
        if (!id_carrera) {
            return res.status(400).json({ error: 'El filtro es requerido' });
        }
        const consulta = 'SELECT * FROM "public"."materia" WHERE id_carrera = '+id_carrera+';';
        const resultado = await pool.query(consulta);
        res.json(resultado.rows);
    } catch (error) {
        console.error('Error al obtener las materias', error);
        res.status(500).json({ error: 'Error al obtener materias' });
    }
});

app.get('/get-grupos', async (req, res) => {
    try {
        const {id_materia} = req.query;
        if (!id_materia) {
            return res.status(400).json({ error: 'El filtro es requerido' });
        }
        const consulta = 'SELECT * FROM "public"."grupo" WHERE id_materia = '+id_materia+';';
        const resultado = await pool.query(consulta);
        res.json(resultado.rows);
    } catch (error) {
        console.error('Error al obtener los grupos de la materia', error);
        res.status(500).json({ error: 'Error al obtener grupos' });
    }
});

app.get('/get-clase', async (req, res) => {
    try {
        const {id_grupo} = req.query;
        if (!id_grupo) {
            return res.status(400).json({ error: 'El filtro es requerido' });
        }
        const consulta = 'SELECT * FROM "public"."clase" WHERE id_clase = '+id_grupo+';';
        const resultado = await pool.query(consulta);
        res.json(resultado.rows);
    } catch (error) {
        console.error('Error al obtener las clases del grupo', error);
        res.status(500).json({ error: 'Error al obtener las horas de clases' });
    }
});


app.use(express.json({ limit: '10mb' }));


app.post('/registrar-carrera', async (req, res) => {
    try {
        const { nombre, codigo} = req.body;
        console.log('recibido');
        console.log(nombre+' '+codigo);
        if (!nombre || !codigo ) {
            return res.status(400).json({ error: 'Todos los campos son requeridos' });
        }
        const consulta = `INSERT INTO menu (nombre_carrera, codigo_carrera) VALUES ($1, $2) RETURNING *`;
        
        const resultadoMenu = await pool.query(consulta, [nombre,codigo]);

        res.json({ message: 'Menu registrado correctamente' });
    } catch (error) {
        console.error('Error al agregar una carrera:', error);
        res.status(500).json({ error: 'Error al agregar una nuevo carrera' });
    }
});
app.use(bodyParser.json());

app.post('/registrar-horario', async (req, res) => {
    try {
        const { carrera, codigo_carrera, niveles } = req.body;
        console.log('Recibido:', carrera, codigo_carrera, niveles);
        // Comprobacion de entradas
        if (!carrera || !codigo_carrera || !niveles || !Array.isArray(niveles)) {
            return res.status(400).json({ error: 'Todos los campos son requeridos y niveles debe ser un arreglo' });
        }

        // Inicia una transacción
        await pool.query('BEGIN');

        // Inserta la carrera si no existe
        const insertCarreraQuery = `
            INSERT INTO carrera (nombre_carrera, codigo_carrera)
            VALUES ($1, $2)
            ON CONFLICT (codigo_carrera) DO NOTHING
            RETURNING id_carrera
        `;
        const resultCarrera = await pool.query(insertCarreraQuery, [carrera, codigo_carrera]);
        const id_carrera = resultCarrera.rows.length > 0 ? resultCarrera.rows[0].id_carrera : (await pool.query('SELECT id_carrera FROM carrera WHERE codigo_carrera = $1', [codigo_carrera])).rows[0].id_carrera;

        for (const nivel of niveles) {
            const { letra, materias } = nivel;

            for (const materia of materias) {
                const { nombre_materia, codigo_materia, grupos } = materia;

                // Inserta la materia si no existe
                const insertMateriaQuery = `
                    INSERT INTO materia (nombre_materia, codigo_materia, id_carrera, nivel)
                    VALUES ($1, $2, $3, $4)
                    ON CONFLICT (codigo_materia) DO NOTHING
                    RETURNING id_materia
                `;
                const resultMateria = await pool.query(insertMateriaQuery, [nombre_materia, codigo_materia, id_carrera, letra]);
                const id_materia = resultMateria.rows.length > 0 ? resultMateria.rows[0].id_materia : (await pool.query('SELECT id_materia FROM materia WHERE codigo_materia = $1', [codigo_materia])).rows[0].id_materia;

                for (const grupo of grupos) {
                    const { numero_grupo, nombre_docente, clases } = grupo;

                    // Inserta el grupo
                    const insertGrupoQuery = `
                        INSERT INTO grupo (numero_grupo, nombre_docente, id_materia)
                        VALUES ($1, $2, $3)
                        ON CONFLICT (id_materia, numero_grupo) DO UPDATE SET nombre_docente = EXCLUDED.nombre_docente
                        RETURNING id_grupo
                    `;
                    const resultGrupo = await pool.query(insertGrupoQuery, [numero_grupo, nombre_docente, id_materia]);
                    const id_grupo = resultGrupo.rows[0].id_grupo;

                    const deleteClasesQuery = `DELETE FROM clase WHERE id_grupo = $1`;
                    await pool.query(deleteClasesQuery, [id_grupo]);

                    for (const clase of clases) {
                        const { id_periodo, aula, dia } = clase;

                        const insertClaseQuery = `
                            INSERT INTO clase (id_grupo, id_periodo, aula, dia)
                            VALUES ($1, $2, $3, $4)
                        `;
                        await pool.query(insertClaseQuery, [id_grupo, id_periodo, aula, dia]);
                    }
                }
            }
        }

        // Finaliza la transacción
        await pool.query('COMMIT');

        res.json({ message: 'Horario registrado correctamente' });
        
    } catch (error) {
        console.error('Error al registrar el horario:', error);
        await pool.query('ROLLBACK');
        res.status(500).json({ error: 'Error al registrar el horario' });
    }
});

app.listen(PORT, () => {
    console.log(`Servidor backend iniciado en el puerto ${PORT}`);
  });
