CREATE TABLE IF NOT EXISTS admistrador (
    admin_id int(11) NOT NULL AUTO_INCREMENT,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    email longtext COLLATE utf8_unicode_ci NOT NULL,,
    password longtext COLLATE utf8_unicode_ci NOT NULL,
    nivel longtext COLLATE utf8_unicode_ci NOT NULL,
    autentificacion longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (admin_id)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS docente (
    docente_id int(11) NOT NULL AUTO_INCREMENT,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    sexo longtext COLLATE utf8_unicode_ci NOT NULL,
    direccion longtext COLLATE utf8_unicode_ci NOT NULL,
    celular longtext COLLATE utf8_unicode_ci NOT NULL,
    email longtext COLLATE utf8_unicode_ci NOT NULL,
    password longtext COLLATE utf8_unicode_ci NOT NULL,
    autentificacion longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (docente_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS clase (
    clase_id int(11) NOT NULL AUTO_INCREMENT,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    codigo_clase longtext COLLATE utf8_unicode_ci NOT NULL,
    docente_id int(11) NOT NULL,
    PRIMARY KEY (clase_id),
    FOREIGN KEY (docente_id) REFERENCES docente (docente_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS curso (
    curso_id int(11) NOT NULL AUTO_INCREMENT,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    paralelo longtext COLLATE utf8_unicode_ci NOT NULL,
    clase_id int(11) NOT NULL,
    docente_id int(11) NOT NULL,
    PRIMARY KEY (curso_id),
    FOREIGN KEY (clase_id) REFERENCES clase (clase_id),
    FOREIGN KEY (docente_id) REFERENCES docente (docente_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS apoderado (
    apoderado_id int(11) NOT NULL AUTO_INCREMENT,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    email longtext COLLATE utf8_unicode_ci NOT NULL,
    password longtext COLLATE utf8_unicode_ci NOT NULL,
    celular longtext COLLATE utf8_unicode_ci NOT NULL,
    direccion longtext COLLATE utf8_unicode_ci NOT NULL,
    profesion longtext COLLATE utf8_unicode_ci NOT NULL,
    autentificacion longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (apoderado_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS estudiante (
    estudiante_id int(11) NOT NULL AUTO_INCREMENT,
    estudiante_codigo longtext COLLATE utf8_unicode_ci NOT NULL,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    sexo longtext COLLATE utf8_unicode_ci NOT NULL,
    direccion longtext COLLATE utf8_unicode_ci NOT NULL,
    celular longtext COLLATE utf8_unicode_ci NOT NULL,
    email longtext COLLATE utf8_unicode_ci NOT NULL,
    password longtext COLLATE utf8_unicode_ci NOT NULL,
    apoderado_id int(11) NOT NULL,
    autentificacion longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (estudiante_id),
    FOREIGN KEY (apoderado_id) REFERENCES apoderado (apoderado_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE sujeto (
    sujeto_id int(11) NOT NULL AUTO_INCREMENT,
    nombre longtext COLLATE utf8_unicode_ci NOT NULL,
    clase_id int(11) NOT NULL,
    docente_id int(11) DEFAULT NULL,
    ano longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (sujeto_id),
    FOREIGN KEY (clase_id) REFERENCES clase (clase_id),
    FOREIGN KEY (docente_id) REFERENCES docente (docente_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS clase_horario (
    clase_horario_id int(11) NOT NULL AUTO_INCREMENT,
    clase_id int(11) NOT NULL,
    curso_id int(11) NOT NULL,
    sujeto_id int(11) NOT NULL,
    inicio_clase varchar(11) COLLATE utf8_unicode_ci NOT NULL,
    fin_clase varchar(11) COLLATE utf8_unicode_ci NOT NULL,
    dia longtext COLLATE utf8_unicode_ci NOT NULL,
    ano longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (clase_horario_id),
    FOREIGN KEY (clase_id) REFERENCES clase (clase_id),
    FOREIGN KEY (curso_id) REFERENCES curso (curso_id),
    FOREIGN KEY (sujeto_id) REFERENCES sujeto (sujeto_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS asistencia (
    asistencia_id int(11) NOT NULL AUTO_INCREMENT,
    tiempo_trans longtext COLLATE utf8_unicode_ci NOT NULL,
    ano longtext COLLATE utf8_unicode_ci NOT NULL,
    clase_id int(11) NOT NULL,
    curso_id int(11) NOT NULL,
    estudiante_id int(11) NOT NULL,
    clase_horario_id int(11) NOT NULL,
    estado int(11) NOT NUll DEFAULT '0' COMMENT '0(undefined) 1(present) 2(absent)',
    PRIMARY KEY (asistencia_id),
    FOREIGN KEY (clase_id) REFERENCES clase (clase_id),
    FOREIGN KEY (curso_id) REFERENCES curso (curso_id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiante (estudiante_id),
    FOREIGN KEY (clase_horario_id) REFERENCES clase_horario (clase_horario_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS rfid_estudiante (
  estudiante_id int(11) NOT NULL,
  rfid_serial varchar(11) DEFAULT NULL,
  FOREIGN KEY (estudiante_id) REFERENCES estudiante (estudiante_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE inscribirse (
    inscribirse_id int(11) NOT NULL,
    codigo_inscribirse longtext COLLATE utf8_unicode_ci NOT NULL,
    estudiante_id int(11) NOT NULL,
    clase_id int(11) NOT NULL,
    curso_id int(11) NOT NULL,
    inscribirse int(11) NOT NULL,
    fecha_agregacion longtext COLLATE utf8_unicode_ci NOT NULL,
    ano longtext COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (inscribirse_id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiante (estudiante_id),
    FOREIGN KEY (clase_id) REFERENCES clase (clase_id),
    FOREIGN KEY (curso_id) REFERENCES curso (curso_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
