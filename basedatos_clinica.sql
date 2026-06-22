-- parte 1: creacion base de datos y tablas.
CREATE DATABASE clinica;
USE clinica;
CREATE TABLE ESPECIALIDAD (
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_especialidad VARCHAR(50) NOT NULL,
    costo_base INT NOT NULL
);
CREATE TABLE MEDICO (
    rut_medico VARCHAR(12) PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_institucional VARCHAR(100),
    telefono VARCHAR(20)
);
CREATE TABLE MEDICO_ESPECIALIDAD (
    rut_medico VARCHAR(12),
    id_especialidad INT,
    PRIMARY KEY (rut_medico, id_especialidad),
    FOREIGN KEY (rut_medico) REFERENCES MEDICO(rut_medico),
    FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD(id_especialidad)
);

CREATE TABLE PACIENTE (
    rut_paciente VARCHAR(12) PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(150),
    telefono_principal VARCHAR(20),
    correo VARCHAR(100)
);
CREATE TABLE DISPONIBILIDAD (
    id_disponibilidad INT PRIMARY KEY AUTO_INCREMENT,
    rut_medico VARCHAR(12),
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(20) DEFAULT 'Disponible',
    FOREIGN KEY (rut_medico) REFERENCES MEDICO(rut_medico)
);
CREATE TABLE CITA (
    id_cita INT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    estado VARCHAR(20) NOT NULL, 
    rut_paciente VARCHAR(12),
    rut_medico VARCHAR(12),
    id_especialidad INT, 
    FOREIGN KEY (rut_paciente) REFERENCES PACIENTE(rut_paciente),
    FOREIGN KEY (rut_medico) REFERENCES MEDICO(rut_medico),
    FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD(id_especialidad)
);
CREATE TABLE PAGO (
    id_pago INT PRIMARY KEY,
    id_cita INT,
    monto INT NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_cita) REFERENCES CITA(id_cita)
);
CREATE TABLE HISTORIAL_MEDICO (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    rut_paciente VARCHAR(12),
    rut_medico VARCHAR(12),
    fecha_atencion DATE NOT NULL,
    diagnostico TEXT,
    tratamiento TEXT,
    FOREIGN KEY (rut_paciente) REFERENCES PACIENTE(rut_paciente),
    FOREIGN KEY (rut_medico) REFERENCES MEDICO(rut_medico)
);
-- parte 2: insercion de datos.
INSERT INTO ESPECIALIDAD (nombre_especialidad, costo_base) VALUES 
('Medicina General', 25000), ('Cardiología', 50000), ('Dermatología', 40000), ('Pediatría', 35000), ('Neurología', 55000),
('Ginecología', 45000), ('Traumatología', 48000), ('Oftalmología', 42000), ('Psiquiatría', 60000), ('Urología', 50000),
('Endocrinología', 45000), ('Gastroenterología', 46000), ('Otorrinolaringología', 40000), ('Broncopulmonar', 48000), ('Nutriología', 35000),
('Reumatología', 52000), ('Oncología', 65000), ('Geriatría', 40000), ('Infectología', 50000), ('Nefrología', 55000);

INSERT INTO MEDICO VALUES
('10111111-1', 'Dr. Juan Pérez', 'juan@clinica.cl', '+569111'), ('10222222-2', 'Dra. Ana Silva', 'ana@clinica.cl', '+569222'),
('10333333-3', 'Dr. Carlos López', 'carlos@clinica.cl', '+569333'), ('10444444-4', 'Dra. Laura Diaz', 'laura@clinica.cl', '+569444'),
('10555555-5', 'Dr. Pedro Gomez', 'pedro@clinica.cl', '+569555'), ('10666666-6', 'Dra. Sofia Torres', 'sofia@clinica.cl', '+569666'),
('10777777-7', 'Dr. Luis Rojas', 'luis@clinica.cl', '+569777'), ('10888888-8', 'Dra. Elena Ruiz', 'elena@clinica.cl', '+569888'),
('10999999-9', 'Dr. Jorge Soto', 'jorge@clinica.cl', '+569999'), ('11000000-0', 'Dra. Paula Vega', 'paula@clinica.cl', '+569000'),
('11111111-K', 'Dr. Andres Castro', 'andres@clinica.cl', '+569121'), ('11222222-K', 'Dra. Cata Morales', 'cata@clinica.cl', '+569131'),
('11333333-K', 'Dr. Rick Flores', 'rick@clinica.cl', '+569141'), ('11444444-K', 'Dra. Carmen Nuñez', 'carmen@clinica.cl', '+569151'),
('11555555-K', 'Dr. Gabo Bravo', 'gabo@clinica.cl', '+569161'), ('11666666-K', 'Dra. Dani Herrera', 'dani@clinica.cl', '+569171'),
('11777777-K', 'Dr. Hector Sal', 'hector@clinica.cl', '+569181'), ('11888888-K', 'Dra. Isa Pizarro', 'isa@clinica.cl', '+569191'),
('11999999-K', 'Dr. Manuel Var', 'manu@clinica.cl', '+569202'), ('12000000-K', 'Dra. Cami Fuentes', 'cami@clinica.cl', '+569212');
INSERT INTO MEDICO_ESPECIALIDAD VALUES 
('10111111-1', 1), ('10222222-2', 2), ('10333333-3', 2), ('10444444-4', 4), ('10555555-5', 5),
('10666666-6', 6), ('10777777-7', 7), ('10888888-8', 8), ('10999999-9', 9), ('11000000-0', 10),
('11111111-K', 11), ('11222222-K', 12), ('11333333-K', 13), ('11444444-K', 14), ('11555555-K', 15),
('11666666-K', 16), ('11777777-K', 17), ('11888888-K', 18), ('11999999-K', 19), ('12000000-K', 20);
INSERT INTO PACIENTE VALUES
('50111111-1', 'Roberto Gonzalez', '1985-03-12', 'Av. 1', '+569111', 'rob@mail.com'),
('50222222-2', 'Fernanda Muñoz', '1992-07-25', 'Av. 2', '+569222', 'fer@mail.com'),
('50333333-3', 'Javier Martinez', '1978-11-05', 'Av. 3', '+569333', 'jav@mail.com'),
('50444444-4', 'Catalina Sepulveda', '2000-01-30', 'Av. 4', '+569444', 'cata@mail.com'),
('50555555-5', 'Diego Romero', '1995-09-18', 'Av. 5', '+569555', 'die@mail.com'),
('50666666-6', 'Valentina Araya', '1988-12-12', 'Av. 6', '+569666', 'vale@mail.com'),
('50777777-7', 'Francisco Vidal', '1960-05-20', 'Av. 7', '+569777', 'fran@mail.com'),
('50888888-8', 'Natalia Espinoza', '2005-08-15', 'Av. 8', '+569888', 'nat@mail.com'),
('50999999-9', 'Matias Saavedra', '1999-04-04', 'Av. 9', '+569999', 'mat@mail.com'),
('51000000-0', 'Constanza Castillo', '1991-02-28', 'Av. 10', '+569000', 'con@mail.com'),
('51111111-K', 'Ignacio Parra', '1982-10-10', 'Av. 11', '+569123', 'ign@mail.com'),
('51222222-K', 'Patricia Lagos', '1975-06-15', 'Av. 12', '+569234', 'pat@mail.com'),
('51333333-K', 'Felipe Jara', '1998-11-22', 'Av. 13', '+569345', 'fel@mail.com'),
('51444444-K', 'Daniela Carrasco', '2010-03-08', 'Av. 14', '+569456', 'dan@mail.com'),
('51555555-K', 'Sebastian Riquelme', '1980-09-09', 'Av. 15', '+569567', 'seb@mail.com'),
('51666666-K', 'Barbara Navarro', '1994-01-17', 'Av. 16', '+569678', 'bar@mail.com'),
('51777777-K', 'Victor Maldonado', '1955-12-31', 'Av. 17', '+569789', 'vic@mail.com'),
('51888888-K', 'Loreto Sanchez', '1989-07-07', 'Av. 18', '+569890', 'lor@mail.com'),
('51999999-K', 'Gonzalo Tapia', '2002-05-25', 'Av. 19', '+569901', 'gon@mail.com'),
('52000000-K', 'Andrea Peña', '1996-11-11', 'Av. 20', '+569012', 'and@mail.com');
INSERT INTO DISPONIBILIDAD (rut_medico, fecha, hora_inicio, hora_fin, estado) VALUES
('10111111-1', '2024-11-25', '09:00', '13:00', 'Disponible'), ('10111111-1', '2024-11-26', '15:00', '19:00', 'Disponible'),
('10222222-2', '2024-11-25', '08:00', '12:00', 'Disponible'), ('10222222-2', '2024-11-27', '14:00', '18:00', 'Disponible'),
('10333333-3', '2024-11-25', '10:00', '14:00', 'Ocupado'), ('10333333-3', '2024-11-28', '09:00', '13:00', 'Disponible'),
('10444444-4', '2024-11-29', '11:00', '15:00', 'Disponible'), ('10555555-5', '2024-11-30', '09:00', '12:00', 'Disponible'),
('10666666-6', '2024-12-01', '10:00', '16:00', 'Disponible'), ('10777777-7', '2024-12-01', '08:00', '12:00', 'Ocupado'),
('10888888-8', '2024-12-02', '09:00', '13:00', 'Disponible'), ('10999999-9', '2024-12-02', '14:00', '18:00', 'Disponible'),
('11000000-0', '2024-12-03', '08:30', '12:30', 'Disponible'), ('11111111-K', '2024-12-03', '15:30', '19:30', 'Disponible'),
('11222222-K', '2024-12-04', '09:00', '13:00', 'Disponible'), ('11333333-K', '2024-12-04', '14:00', '18:00', 'Disponible'),
('11444444-K', '2024-12-05', '10:00', '14:00', 'Disponible'), ('11555555-K', '2024-12-05', '16:00', '20:00', 'Disponible'),
('11666666-K', '2024-12-06', '08:00', '12:00', 'Disponible'), ('11777777-K', '2024-12-06', '13:00', '17:00', 'Disponible');
INSERT INTO CITA VALUES
(100, '2024-11-01 10:00:00', 'Completada', '50111111-1', '10111111-1', 1),
(101, '2024-11-02 11:00:00', 'Completada', '50222222-2', '10222222-2', 2),
(102, '2024-11-03 09:00:00', 'Cancelada', '50333333-3', '10333333-3', 2),
(103, '2024-11-04 12:00:00', 'Completada', '50444444-4', '10444444-4', 4),
(104, '2024-11-05 15:00:00', 'Agendada', '50555555-5', '10555555-5', 5),
(105, '2024-11-06 10:00:00', 'Cancelada', '50666666-6', '10666666-6', 6),
(106, '2024-11-07 16:00:00', 'Completada', '50777777-7', '10777777-7', 7),
(107, '2024-11-08 14:00:00', 'Agendada', '50888888-8', '10888888-8', 8),
(108, '2024-11-09 11:00:00', 'Completada', '50999999-9', '10999999-9', 9),
(109, '2024-11-10 09:30:00', 'Completada', '51000000-0', '11000000-0', 10),
(110, '2024-11-11 10:00:00', 'Cancelada', '51111111-K', '11111111-K', 11),
(111, '2024-11-12 12:30:00', 'Completada', '51222222-K', '11222222-K', 12),
(112, '2024-11-13 15:00:00', 'Agendada', '51333333-K', '11333333-K', 13),
(113, '2024-11-14 08:00:00', 'Completada', '51444444-K', '11444444-K', 14),
(114, '2024-11-15 17:00:00', 'Completada', '51555555-K', '11555555-K', 15),
(115, '2024-11-16 11:00:00', 'Cancelada', '51666666-K', '11666666-K', 16),
(116, '2024-11-17 13:00:00', 'Agendada', '51777777-K', '11777777-K', 17),
(117, '2024-11-18 10:00:00', 'Completada', '51888888-K', '11888888-K', 18),
(118, '2024-11-19 09:00:00', 'Completada', '51999999-K', '11999999-K', 19),
(119, '2024-11-20 14:00:00', 'Agendada', '52000000-K', '12000000-K', 20);
INSERT INTO PAGO VALUES
(1, 100, 25000, '2024-11-01', 'Efectivo'), (2, 101, 50000, '2024-11-02', 'Debito'),
(3, 102, 40000, '2024-11-03', 'Credito'), (4, 103, 35000, '2024-11-04', 'Debito'),
(5, 104, 55000, '2024-11-05', 'Webpay'), (6, 105, 45000, '2024-11-06', 'Transferencia'),
(7, 106, 48000, '2024-11-07', 'Efectivo'), (8, 107, 42000, '2024-11-08', 'Credito'),
(9, 108, 60000, '2024-11-09', 'Debito'), (10, 109, 50000, '2024-11-10', 'Webpay'),
(11, 110, 45000, '2024-11-11', 'Transferencia'), (12, 111, 46000, '2024-11-12', 'Efectivo'),
(13, 112, 40000, '2024-11-13', 'Credito'), (14, 113, 48000, '2024-11-14', 'Debito'),
(15, 114, 35000, '2024-11-15', 'Webpay'), (16, 115, 52000, '2024-11-16', 'Transferencia'),
(17, 116, 65000, '2024-11-17', 'Efectivo'), (18, 117, 40000, '2024-11-18', 'Credito'),
(19, 118, 50000, '2024-11-19', 'Debito'), (20, 119, 55000, '2024-11-20', 'Webpay');
INSERT INTO HISTORIAL_MEDICO (rut_paciente, rut_medico, fecha_atencion, diagnostico, tratamiento) VALUES
('50111111-1', '10111111-1', '2024-11-01', 'Resfriado Común', 'Paracetamol y reposo por 3 días'),
('50222222-2', '10222222-2', '2024-11-02', 'Hipertensión leve', 'Losartán 50mg cada 12 horas'),
('50333333-3', '10333333-3', '2024-11-03', 'Dermatitis de contacto', 'Crema corticoide tópica'),
('50444444-4', '10444444-4', '2024-11-04', 'Bronquitis aguda', 'Salbutamol inhalador SOS'),
('50555555-5', '10555555-5', '2024-11-05', 'Migraña tensional', 'Ibuprofeno 400mg y relajación'),
('50666666-6', '10666666-6', '2024-11-06', 'Control Ginecologico', 'Todo normal, control en 1 año'),
('50777777-7', '10777777-7', '2024-11-07', 'Esguince de tobillo', 'Hielo local e inmovilización'),
('50888888-8', '10888888-8', '2024-11-08', 'Miopía leve', 'Receta de lentes ópticos'),
('50999999-9', '10999999-9', '2024-11-09', 'Ansiedad generalizada', 'Terapia cognitivo conductual'),
('51000000-0', '11000000-0', '2024-11-10', 'Infección urinaria', 'Ciprofloxacino 500mg por 5 días'),
('51111111-K', '11111111-K', '2024-11-11', 'Diabetes Tipo 2', 'Metformina 850mg y dieta'),
('51222222-K', '11222222-K', '2024-11-12', 'Gastritis', 'Omeprazol en ayunas'),
('51333333-K', '11333333-K', '2024-11-13', 'Otitis media', 'Amoxicilina 500mg cada 8 horas'),
('51444444-K', '11444444-K', '2024-11-14', 'Asma bronquial', 'Budesonida inhalador diario'),
('51555555-K', '11555555-K', '2024-11-15', 'Sobrepeso', 'Pauta nutricional hipocalórica'),
('51666666-K', '11666666-K', '2024-11-16', 'Artritis reumatoide', 'Control de dolor con AINES'),
('51777777-K', '11777777-K', '2024-11-17', 'Chequeo oncológico', 'Exámenes preventivos solicitados'),
('51888888-K', '11888888-K', '2024-11-18', 'Control geriátrico', 'Ajuste de medicación habitual'),
('51999999-K', '11999999-K', '2024-11-19', 'Influenza', 'Reposo absoluto y líquidos'),
('52000000-K', '12000000-K', '2024-11-20', 'Insuficiencia renal', 'Control estricto de presión arterial');

--parte 3 consultas sql 
UPDATE PACIENTE SET telefono_principal = '+56999999999' WHERE rut_paciente = '50111111-1';
UPDATE MEDICO SET correo_institucional = 'nuevo.mail@clinica.cl' WHERE rut_medico = '10111111-1';
UPDATE CITA SET estado = 'Cancelada' WHERE id_cita = 119;
INSERT INTO ESPECIALIDAD (nombre_especialidad, costo_base) VALUES ('Especialidad Borrar', 10000);
INSERT INTO MEDICO VALUES ('999-9', 'Dr. Borrar', 'x@x.cl', '000');
DELETE FROM ESPECIALIDAD WHERE nombre_especialidad = 'Especialidad Borrar';
DELETE FROM MEDICO WHERE rut_medico = '999-9';

-- 1. Mostrar todos los pacientes con su nombre completo, edad y RUT.
SELECT nombre_completo, rut_paciente, TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad 
FROM PACIENTE;

-- 2. Listar todas las especialidades médicas disponibles sin repeticiones.
SELECT DISTINCT nombre_especialidad 
FROM ESPECIALIDAD;

-- 3. Mostrar todos los médicos que tienen la especialidad 'Cardiología'.
SELECT M.nombre_completo, E.nombre_especialidad
FROM MEDICO M
JOIN MEDICO_ESPECIALIDAD ME ON M.rut_medico = ME.rut_medico
JOIN ESPECIALIDAD E ON ME.id_especialidad = E.id_especialidad
WHERE E.nombre_especialidad = 'Cardiología';

-- 4. Contar cuántos médicos hay por cada especialidad.
SELECT E.nombre_especialidad, COUNT(ME.rut_medico) as cantidad_medicos
FROM ESPECIALIDAD E
JOIN MEDICO_ESPECIALIDAD ME ON E.id_especialidad = ME.id_especialidad
GROUP BY E.nombre_especialidad;

-- 5. Mostrar los horarios disponibles para un médico específico.
SELECT fecha, hora_inicio, hora_fin, estado
FROM DISPONIBILIDAD 
WHERE rut_medico = '10111111-1' AND estado = 'Disponible';

-- 6. Mostrar todas las citas que están en estado 'Cancelada'.
SELECT * FROM CITA WHERE estado = 'Cancelada';

-- 7. Contar cuántas citas ha tenido cada paciente.
SELECT P.nombre_completo, COUNT(C.id_cita) as total_citas
FROM PACIENTE P
LEFT JOIN CITA C ON P.rut_paciente = C.rut_paciente
GROUP BY P.rut_paciente, P.nombre_completo;

-- 8. Listar todos los pacientes que han cancelado al menos una cita.
SELECT nombre_completo, rut_paciente
FROM PACIENTE
WHERE rut_paciente IN (
    SELECT rut_paciente
    FROM CITA
    WHERE estado = 'Cancelada'
);
-- 9. Listar todos los métodos de pago utilizados sin repeticiones.
SELECT DISTINCT metodo_pago FROM PAGO;

-- 10. Contar cuántas citas se han completado por cada especialidad.
SELECT E.nombre_especialidad, COUNT(C.id_cita) as citas_completadas
FROM CITA C
JOIN ESPECIALIDAD E ON C.id_especialidad = E.id_especialidad
WHERE C.estado = 'Completada'
GROUP BY E.nombre_especialidad;

-- 11. Mostrar el total recaudado en pagos por cada método de pago.
SELECT metodo_pago, SUM(monto) as total_recaudado
FROM PAGO
GROUP BY metodo_pago;

-- parte 3 programa python
USE clinica;

-- Creación de la Vista basada en la consulta 10
CREATE VIEW VISTA_RENDIMIENTO_ESPECIALIDADES AS
SELECT 
    E.nombre_especialidad, 
    COUNT(C.id_cita) as citas_completadas
FROM CITA C
JOIN ESPECIALIDAD E ON C.id_especialidad = E.id_especialidad
WHERE C.estado = 'Completada'
GROUP BY E.nombre_especialidad;

SELECT * FROM VISTA_RENDIMIENTO_ESPECIALIDADES;

USE clinica;

CREATE PROCEDURE SP_REPORTE_INGRESOS_POR_PAGO()
BEGIN
    SELECT 
        metodo_pago, 
        SUM(monto) as total_recaudado
    FROM PAGO
    GROUP BY metodo_pago
    ORDER BY total_recaudado DESC;
END //




