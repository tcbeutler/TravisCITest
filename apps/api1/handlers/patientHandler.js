var patient = require('../models/patient');

var patientHandler = function() {
    this.getPatient = handleGetPatientRequest;
};

function handleGetPatientRequest(req, res) {
    console.log(req.route.params['patientId']);

    patient.href = req.url;
    patient.results[0].href = req.url;
    patient.results[0].patientId = req.route.params['patientId'];

    res.json(200, patient);
}

module.exports = patientHandler;