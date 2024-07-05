const { Router } = require('express');
const multer = require('multer');
const router = Router();
const convertir = require('../controllers/convertirXlsxAJson.js');
const { registrarHorario } = require('../controllers/controller.horario.js');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/'); // Guardar los archivos en la carpeta
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname); // usa el nombre original del archivo
    }
});
const upload = multer({ storage });

router.route('/')
    .post(upload.single('file'), async (req, res) => {
        try {
         
            const horarioJson = convertir(req.file.path);
            const { message } = await registrarHorario(horarioJson);
            return res.json({ message });
        } catch (e) {
            console.error(e);
            const { message } = e;
            res.json({ message });
        }
    });

module.exports = router;
