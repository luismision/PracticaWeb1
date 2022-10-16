-- Insertamos en los datos en las tablas creadas previamente

INSERT INTO FEDERACION(name, deporte, pais) SELECT DISTINCT FEDERATION, SPORT, COUNTRY FROM FSDB.INSCRIPTIONS WHERE FEDERATION IS NOT NULL AND SPORT IS NOT NULL;

INSERT INTO DEPORTISTA(spic, nombre, apellido1, apellido2, apodo, edad, fecha_nac, pais_nac) SELECT DISTINCT SPIC, FIRSTNAME, SURNAME, SEC_SURNAME, NICKNAME, TRUNC((sysdate-(TO_DATE(BIRTHDATE,'YYYY-MM-DD')))/365.2422,0), TO_DATE(BIRTHDATE,'YYYY-MM-DD'), COUNTRY FROM FSDB.INSCRIPTIONS WHERE SPIC IS NOT NULL AND FIRSTNAME IS NOT NULL AND SURNAME IS NOT NULL AND BIRTHDATE IS NOT NULL AND COUNTRY IS NOT NULL;

INSERT INTO CLUB(nombre,pais, año) SELECT DISTINCT CLUB_NAME, CLUB_COUNTRY,TO_DATE(CLUB_FOUNDATION,'YYYY-MM-DD') FROM FSDB.INSCRIPTIONS WHERE CLUB_NAME IS NOT NULL AND CLUB_COUNTRY IS NOT NULL AND CLUB_FOUNDATION IS NOT NULL;

INSERT INTO FICHAFEDERATIVA(federacion, pais_fed, deporte_fed,deportista,num_fed,fecha_expedicion, fecha_expiracion, categoria) SELECT DISTINCT FEDERATION, COUNTRY, SPORT, SPIC, FED_NUMBER, TO_DATE(CARD_START_DATE,'YYYY-MM-DD'), TO_DATE(CARD_END_DATE,'YYYY-MM-DD'), CATEGORY FROM FSDB.INSCRIPTIONS WHERE SPIC IS NOT NULL AND FEDERATION IS NOT NULL AND FED_NUMBER IS NOT NULL AND CATEGORY IS NOT NULL AND COUNTRY IS NOT NULL AND CARD_END_DATE IS NOT NULL AND CARD_START_DATE IS NOT NULL;

INSERT INTO COMPETICION(nombre, categoria, federacion, deporte_fed, pais, deporte) SELECT DISTINCT COMPETITION, COMP_CATEG, FEDERATION, SPORT, COUNTRY, COMP_SPORT FROM FSDB.INSCRIPTIONS WHERE COMPETITION IS NOT NULL AND SPORT IS NOT NULL AND COMP_CATEG IS NOT NULL  AND FEDERATION IS NOT NULL AND COUNTRY IS NOT NULL  AND COUNTRY IS NOT NULL;

INSERT INTO EDICION (nombre, categoria, federacion, deporte_fed, pais, año,  edicion, premio) SELECT DISTINCT COMPETITION, COMP_CATEG, FEDERATION, SPORT, COUNTRY, MAX(YEAR), EDITION, MAX(PRIZE_WON) FROM FSDB.INSCRIPTIONS WHERE COMPETITION IS NOT NULL AND SPORT IS NOT NULL AND COMP_CATEG IS NOT NULL  AND FEDERATION IS NOT NULL AND COUNTRY IS NOT NULL AND YEAR IS NOT NULL AND COUNTRY IS NOT NULL AND EDITION IS NOT NULL GROUP BY COMPETITION, COMP_CATEG, FEDERATION, SPORT, COUNTRY,EDITION;

INSERT INTO DIVISION(nombre, federacion, pais, categoria, deporte_fed, division, año) SELECT DISTINCT COMPETITION, FEDERATION, COUNTRY, COMP_CATEG, SPORT, COMP_DIV, MAX(YEAR) FROM FSDB.INSCRIPTIONS WHERE COMPETITION IS NOT NULL AND FEDERATION IS NOT NULL AND COUNTRY IS NOT NULL AND COMP_CATEG IS NOT NULL AND SPORT IS NOT NULL AND COMP_DIV IS NOT NULL AND YEAR IS NOT NULL GROUP BY COMPETITION, FEDERATION, COUNTRY, COMP_CATEG, SPORT, COMP_DIV;

INSERT INTO SECCION(club, pais_club, seccion, categoria, deporte) SELECT DISTINCT CLUB_NAME, CLUB_COUNTRY, SECTION, CATEGORY, SPORT FROM FSDB.INSCRIPTIONS WHERE CLUB_NAME IS NOT NULL AND CLUB_COUNTRY IS NOT NULL AND SECTION IS NOT NULL AND SPORT IS NOT NULL;

INSERT INTO CONTROL (fecha, hora, lugar, sujeto) SELECT DISTINCT TO_DATE(CTRL_DATE,'YYYY-MM-DD'), CTRL_TIME, CTRL_PLACE, fsdb.controls.SPIC FROM fsdb.controls, fsdb.inscriptions  WHERE fsdb.controls.SPIC=fsdb.inscriptions.SPIC AND CTRL_DATE IS NOT NULL AND CTRL_TIME IS NOT NULL AND CTRL_PLACE IS NOT NULL AND CTRL_DATE != '2017-02-29';

INSERT INTO TRIBUNAL (fecha_control, lugar_control, deportista, tipo, sustancia, codigo_judicial, fecha_juicio, pais) SELECT DISTINCT TO_DATE(CTRL_DATE,'YYYY-MM-DD'), CTRL_PLACE, fsdb.controls.SPIC, INFRINGEMENT, DOPANT, COURT_CODE, TO_DATE(COURT_DATE,'YYYY-MM-DD'), COUNTRY FROM fsdb.controls, fsdb.inscriptions WHERE fsdb.controls.SPIC = fsdb.inscriptions.SPIC AND CTRL_DATE IS NOT NULL  AND CTRL_PLACE IS NOT NULL AND CTRL_DATE != '2017-02-29'  AND DOPANT IS NOT NULL AND INFRINGEMENT IS NOT NULL AND COUNTRY IS NOT NULL;

INSERT INTO HFEDERACION(federacion, deporte, pais) SELECT DISTINCT FEDERATION, SPORT, COUNTRY FROM FSDB.INSCRIPTIONS WHERE FEDERATION IS NOT NULL AND SPORT IS NOT NULL;

INSERT INTO HCLUB(club, pais) SELECT DISTINCT CLUB_NAME, CLUB_COUNTRY FROM FSDB.INSCRIPTIONS WHERE CLUB_NAME IS NOT NULL AND CLUB_COUNTRY IS NOT NULL;

INSERT INTO HDEPORTISTA(id_deportista) SELECT DISTINCT SPIC FROM FSDB.INSCRIPTIONS WHERE SPIC IS NOT NULL;

INSERT INTO HSECCION(club, pais, seccion, categoria, deporte) SELECT DISTINCT CLUB_NAME, CLUB_COUNTRY, SECTION, CATEGORY, SPORT FROM FSDB.INSCRIPTIONS WHERE CLUB_NAME IS NOT NULL AND CLUB_COUNTRY IS NOT NULL AND SECTION IS NOT NULL AND SPORT IS NOT NULL;
