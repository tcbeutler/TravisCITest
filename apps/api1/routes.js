function setup(app, handlers) {
    app.get('/api/patients/:patientId', handlers.patient.getPatient);
}

exports.setup = setup;