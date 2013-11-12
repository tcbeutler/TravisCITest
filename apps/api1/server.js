var express = require('express');
var app = express();
var patientHandler = require('./handlers/patientHandler');
var routes = require('./routes');

var handlers = {
    patient: new patientHandler()
};

function start() {
    routes.setup(app, handlers);
    var port = process.env.PORT || 3000;
    app.listen(port);
    console.log('Server listening on port %d.', port);
}

exports.start = start;

