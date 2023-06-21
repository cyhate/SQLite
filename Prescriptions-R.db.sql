BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Doctors" (
	"SSN"	TEXT,
	"Names"	TEXT NOT NULL,
	"Specialty"	TEXT NOT NULL,
	"YearsOfExperience"	INTEGER NOT NULL,
	PRIMARY KEY("SSN")
);
CREATE TABLE IF NOT EXISTS "PharmaceuticalCompany" (
	"Name"	TEXT,
	"TelephoneNumber"	INTEGER NOT NULL,
	PRIMARY KEY("Name")
);
CREATE TABLE IF NOT EXISTS "DoctorsPatients" (
	"id"	INTEGER,
	"Patientsid"	INTEGER NOT NULL,
	FOREIGN KEY("Patientsid") REFERENCES "DoctorsPatients"("SSN ") ON DELETE CASCADE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Patients" (
	"SSN "	TEXT,
	"Names"	TEXT NOT NULL,
	"Address"	TEXT NOT NULL,
	"Ages"	INTEGER NOT NULL,
	"doctorid"	INTEGER NOT NULL,
	FOREIGN KEY("doctorid") REFERENCES "Doctors"("SSN"),
	PRIMARY KEY("SSN ")
);
CREATE TABLE IF NOT EXISTS "Medicines" (
	"Name"	TEXT,
	"Type"	TEXT NOT NULL,
	"PharmaceuticalCompanyid"	INTEGER NOT NULL,
	"Pharmachysid"	INTEGER,
	FOREIGN KEY("PharmaceuticalCompanyid") REFERENCES "PharmaceuticalCompany"("Name") ON DELETE CASCADE,
	FOREIGN KEY("Pharmachysid") REFERENCES "Pharmachys"("Name") ON DELETE CASCADE,
	PRIMARY KEY("Name")
);
CREATE TABLE IF NOT EXISTS "Pharmachys" (
	"Name"	INTEGER,
	PRIMARY KEY("Name")
);
CREATE TABLE IF NOT EXISTS "PharmacysMedicines" (
	"pharmacyid"	INTEGER NOT NULL,
	"medicinesid"	INTEGER NOT NULL,
	"id"	INTEGER,
	"Price"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("medicinesid") REFERENCES "Medicines"("Name") ON DELETE CASCADE,
	FOREIGN KEY("pharmacyid") REFERENCES "Pharmachys"("Name") ON DELETE CASCADE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
COMMIT;
