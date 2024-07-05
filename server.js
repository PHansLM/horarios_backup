const express = require('express');
const pool = require('./db.js');

const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const PORT = process.env.PORT || 5000;

const routerUpload = require('./routes/upload.js');
const { registrarHorario } = require('./controllers/controller.horario.js');


const connectionString = "MAS - IPSP";
//Middlewares
app.use(cors());




app.use('/api/upload', routerUpload)

app.get('/get-carreras', async (req,res) => {
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
    registrarHorario(req.body)
});


app.listen(PORT, () => {
    console.log(`Servidor backend iniciado en el puerto ${PORT}`);
});
