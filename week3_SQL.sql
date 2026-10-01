--Week three homework based on in class activity 

--Creates a table to store patient information: each patient has an id, name, age, gender, 
--and city they're from
CREATE TABLE PATIENTS (
	--unique id for each patient indicated by primary key
    --integere means whole numbers 
  	patient_id INTEGER PRIMARY KEY, 
  	--patient's name, age, gender and city stored in a column 
    name TEXT NOT NULL, --contains letters and words; patient name must be provided 
    age INTEGER, --whole numbers 
    gender TEXT,
    city TEXT
    );
    
    --Adds patient records to the patient table 
    INSERT INTO PATIENTS (patient_id, name, age, gender, city) VALUES 
    (1, 'John Doe', 45, 'M', 'Boston'),
    (2, 'Jane Smith', 32, 'F', 'Cambridge'),
	(3, 'Mike Johnson', 58, 'M', 'Boston'),
	(4, 'Sarah Williams', 41, 'F', 'Somerville'),
	(5, 'David Brown', 29, 'M', 'Boston'),
	(6, 'Emily Davis', 67, 'F', 'Cambridge');
    
    --selects all patients from the table from Boston
    SELECT * FROM PATIENTS;
    WHERE city = 'Boston';
    
    --selects all patients whose age is less than 40
    SELECT * FROM PATIENTS;
    WHERE age < 40; 

	--calculates the average age of the patients 
	SELECT avg(age) FROM PATIENTS;
    
    --counts the total number of patients 
    SELECT count(*) FROM PATIENTS; -- * is everything
    
    --finds the youngest patient's name 
    SELECT min(age) FROM PATIENTS;
    
    --finds the oldest patient's age
    SELECT max(age) FROM PATIENTS; 
    
    --calculates the average age for each city
    --grousp the results by city and sorts by average age from highest to lowest 
    SELECT city, avg(age) average_age
    FROM PATIENTS 
    GROUP BY city
    ORDER BY average_age DESC;
    
    --counts the number of different cities in the table 
    SELECT COUNT(DISTINCT city) FROM PATIENTS;

--in class activity from previous homework 
--creating table that stores information on creatine use 
    CREATE TABLE CREATINE (
    --unique id for patient 
	patient_id INTEGER PRIMARY KEY, 
    --patients age, creatine takeage, creatine start date, muslce mass at the start and after six months,
    --how often they strength train and their protein intake in columns. 
    age INTEGER, --whole numbers 
    take_creatine TEXT, --text
    creatine_start_date TEXT, --text 
    muscle_mass_start INTEGER, --lbs whole number
    muscle_mass_6_months INTEGER, --lbs whole number 
    strength_training_days_per_week INTEGER, --whole number 
    protein_intake INTEGER --grams whole number 
    );
    
    --adds creatine information for patient 
    INSERT INTO CREATINE (patient_id, age,  take_creatine, creatine_start_date, muscle_mass_start, muscle_mass_6_months, strength_training_days_per_week, protein_intake) VALUES 
    (1, 45, 'yes', 'March 3rd 2012', 3, 4, 5, 50);
    
    --selects all information from the creatine table 
    select * from CREATINE;
    

    --IN THIS COMMAND WE ARE SELECTING SPECIFIC FIELDS ONLY such as patient id and creatine usage
    SELECT patient_id, take_creatine 
    FROM CREATINE;
    
    -- Create Visits table
CREATE TABLE Visits (
  --unique id for each visit 
    visit_id INTEGER PRIMARY KEY,
  --id of the patient who had the visit 
    patient_id INTEGER,
  --date of the patients visit 
    visit_date TEXT,
  --patients diagnosis
    diagnosis TEXT,
  -- cost of the visit 
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) --link patient id to the patient table 
);

-- Insert sample data into Visits
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

--selects all information from the visits table 
SELECT * fROM Visits; 

--combines visit information with patient information 
--Shows the visit ID, patient ID, visit date, and patient name
--p for patients data and v for visits data 
SELECT visit_id, p.patient_id, visit_date, name
FROM Visits v LEFT JOIN PATIENTS p

on v.patient_id = p.patient_id
; 
