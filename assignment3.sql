CREATE SCHEMA assignment3;
USE assignment3;

-- Insurance Company table
CREATE TABLE Insurance_Company (
    idInsurance INT NOT NULL,
    InsuranceName VARCHAR(45) NOT NULL,
    PRIMARY KEY (idInsurance)
);

-- Speciality table
CREATE TABLE Speciality (
    idSpeciality INT NOT NULL,
    Speciality_Name VARCHAR(45),   
    PRIMARY KEY (idSpeciality)
);

-- Physicians table
CREATE TABLE Physicians (
    idPhysicians INT NOT NULL,
    PhysicianFN VARCHAR(45) NOT NULL,
    PhysicianLN VARCHAR(45) NOT NULL,
    PhysicianPhone INT NOT NULL,
    Physicianstatus VARCHAR(45) NOT NULL,
    PRIMARY KEY (idPhysicians)
);

-- License table
CREATE TABLE License (
    idLicense INT NOT NULL,
    Physicians_idPhysicians INT NOT NULL,
    Speciality_idSpeciality INT NOT NULL,
    PRIMARY KEY (idLicense),
    FOREIGN KEY (Physicians_idPhysicians) REFERENCES Physicians(idPhysicians),
    FOREIGN KEY (Speciality_idSpeciality) REFERENCES Speciality(idSpeciality)
);

-- Patient table
CREATE TABLE Patient (
    idPatient INT NOT NULL,
    PatientFN VARCHAR(45) NOT NULL,
    PatientLN VARCHAR(45) NOT NULL,
    PatientAddress VARCHAR(45) NOT NULL,
    PatientPhone INT NOT NULL,
    PatientDOB DATETIME,   
    PRIMARY KEY (idPatient)
);

-- Insurance Policy table
CREATE TABLE Insurance_Policy (
    idInsurancePolicy INT NOT NULL,
    Insurance_Company_idInsurance INT NOT NULL,
    Patient_idPatient INT NOT NULL,
    PRIMARY KEY (idInsurancePolicy),
    FOREIGN KEY (Insurance_Company_idInsurance) REFERENCES Insurance_Company(idInsurance),
    FOREIGN KEY (Patient_idPatient) REFERENCES Patient(idPatient)
);

-- Receptionist table
CREATE TABLE Receptionist (
    idReceptionist INT NOT NULL,
    ReceptionistFN VARCHAR(45) NOT NULL,
    ReceptionistLN VARCHAR(45) NOT NULL,
    PRIMARY KEY (idReceptionist)
);

-- Room table
CREATE TABLE Room (
    idRoom INT NOT NULL,
    RoomFloor INT NOT NULL,
    PRIMARY KEY (idRoom)
);

-- Admission table
CREATE TABLE Admission (
    idAdmission INT NOT NULL,
    AdmissionDate DATETIME NOT NULL,
    AdmissionNotes INT NOT NULL,
    Receptionist_idReceptionist INT NOT NULL,
    Patient_idPatient INT NOT NULL,
    Physicians_idPhysicians INT NOT NULL,
    PRIMARY KEY (idAdmission),
    FOREIGN KEY (Receptionist_idReceptionist) REFERENCES Receptionist(idReceptionist),
    FOREIGN KEY (Patient_idPatient) REFERENCES Patient(idPatient),
    FOREIGN KEY (Physicians_idPhysicians) REFERENCES Physicians(idPhysicians)
);

-- Admission_to_Room table
CREATE TABLE Admission_to_Room (
    idAdmission_to_Room INT NOT NULL PRIMARY KEY,   
    idAdmission INT NOT NULL,                    
    idRoom INT NOT NULL,                           
    Room_idRoom INT NOT NULL,                      
    FOREIGN KEY (idAdmission) REFERENCES Admission(idAdmission),
    FOREIGN KEY (idRoom) REFERENCES Room(idRoom)
);