const pool = require('../db.js');
const registrarHorario = async (json) => {
    try {

        const { carrera, codigo_carrera, niveles } = json;
        console.log('Recibido:', carrera, codigo_carrera);
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
                    let resultGrupo = {}
                    try{
                        const insertGrupoQuery = `
                            INSERT INTO grupo (numero_grupo, nombre_docente, id_materia)
                            VALUES ($1, $2, $3)
                            RETURNING id_grupo
                        `;
                        resultGrupo = await pool.query(insertGrupoQuery, [numero_grupo, nombre_docente, id_materia]);
                    }catch(err){
                        const selectGrupoQuery = 'SELECT id_grupo FROM grupo WHERE numero_grupo = $1 and id_materia = $2'
                        resultGrupo = await pool.query(selectGrupoQuery, [numero_grupo, id_materia]);
                    }
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
        console.log('Finaliza la transacción')

        return {message: 'Horario registrado correctamente'}

        
    } catch (error) {
        console.error('Error al registrar el horario:', error);
        await pool.query('ROLLBACK');
        throw new Error('Error al registrar el horario')
    }
}

module.exports = {
    registrarHorario
};