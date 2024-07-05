const xlsx = require('xlsx');

// Funciones de utilidad

const formatTimeToHHMM = (timeStr) => {
  const hours = timeStr.slice(0, -2).padStart(2, '0');
  const minutes = timeStr.slice(-2).padStart(2, '0');
  return `${hours}:${minutes}`;
};

const getDiaInt = (dia) => {
  const dias = { "LU": 1, "MA": 2, "MI": 3, "JU": 4, "VI": 5, "SA": 6, "DO": 7 };
  return dias[dia] || null;
};

const getIdPeriodo = (hora_entrada) => {
  const periodos = {
    '06:45': 1, '08:15': 2, '09:45': 3, '11:15': 4, '12:45': 5,
    '14:15': 6, '15:45': 7, '17:15': 8, '18:45': 9, '20:15': 10
  };
  return periodos[hora_entrada] || null;
};

// Funciones principales

const agregarClase = (clase, clases) => {
  const exist = clases.some(c =>
    c.id_periodo === clase.id_periodo && c.aula === clase.aula && c.dia === clase.dia
  );
  if (!exist) clases.push(clase);
};

const getHorarioNivel = (letra, niveles) => {
  let nivel = niveles.find(n => n.letra === letra);
  if (!nivel) {
    nivel = { letra, materias: [] };
    niveles.push(nivel);
  }
  return nivel;
};

const getHorarioMateria = (registro, horario_nivel) => {
  const codigo_materia = registro[1];
  let materia = horario_nivel.materias.find(m => m.codigo_materia === codigo_materia);
  if (!materia) {
    materia = { nombre_materia: registro[2], codigo_materia, grupos: [] };
    horario_nivel.materias.push(materia);
  }
  return materia;
};

const getHorarioGrupo = (registro, horario_materia) => {
  const grupo = registro[3];
  let horario_grupo = horario_materia.grupos.find(g => g.numero_grupo === grupo);
  if (!horario_grupo) {
    horario_grupo = { numero_grupo: grupo, nombre_docente: registro[7], clases: [] };
    horario_materia.grupos.push(horario_grupo);
  }
  return horario_grupo;
};

const guardar_horario = (element, niveles) => {
  const clase = {
    id_periodo: getIdPeriodo(formatTimeToHHMM(element[5].split('-')[0])),
    aula: element[5].split('(')[1].replace(')', ''),
    dia: getDiaInt(element[4])
  };

  const nivel = element[0];
  const horario_nivel = getHorarioNivel(nivel, niveles);
  const horario_materia = getHorarioMateria(element, horario_nivel);
  const horario_grupo = getHorarioGrupo(element, horario_materia);
  agregarClase(clase, horario_grupo.clases);
};

const guardar = (data, niveles) => {
  data.slice(3)
    .forEach(
      element => guardar_horario(element, niveles)
    );
};

// MAIN

const convertir = (path) => {
  try {
    const workbook = xlsx.readFile(path);
    const codigo_carrera = path.split('\\')[1].split('.')[0]
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const jsonData = xlsx.utils.sheet_to_json(worksheet, { header: 1 });
    const carrera = jsonData[1][0].slice(10);

    const jsonHorario = {
      carrera,
      codigo_carrera,
      niveles: []
    };

    guardar(jsonData, jsonHorario.niveles);

    return jsonHorario;
  }catch(err) {
    throw new Error("Error al convertir xlsx")
  }
  
};

module.exports = convertir;
