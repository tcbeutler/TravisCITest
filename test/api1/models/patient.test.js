var expect = require('chai').expect;

describe('patient', function(){
    var patient = require('../../../apps/api1/models/patient');

    describe('object attribute', function() {
        it('"href" should exist as empty string', function(){
            expect(patient).to.have.property('href')
                .that.is.a('string')
                .that.is.empty;
        });
        it('"total" should exist with a value of "1"', function(){
            expect(patient).to.have.property('total')
                .that.is.a('string')
                .that.is.equal('1');
        });
        it('"returned" should exist with a value of "1"', function(){
            expect(patient).to.have.property('returned')
                .that.is.a('string')
                .that.is.equal('1');
        });
        it('"results" should exist as an array with a length of "1"', function(){
            expect(patient).to.have.property('results')
                .that.is.an('array')
                .with.length(1);
        });
        it('"results[0].href" should exist as an empty string', function(){
            expect(patient.results[0]).to.have.property('href')
                .that.is.a('string')
                .that.is.empty;
        });
        it('"results[0].patientId" should exist as an empty string', function(){
            expect(patient.results[0]).to.have.property('patientId')
                .that.is.a('string')
                .that.is.empty;
        });
    });
});