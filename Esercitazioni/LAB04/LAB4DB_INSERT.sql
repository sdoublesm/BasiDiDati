INSERT INTO AGENZIA (CodA, SitoWeb, Tel, Via_Indirizzo, CAP_Indirizzo, Citta_Indirizzo, Numero_Indirizzo, Stato_Indirizzo)
       VALUES (1, 'www.ag1.it', '070-123456', 'Via Stretta', 1234, 'Milano', 12, 'Italia');

INSERT INTO AGENZIA (CodA, SitoWeb, Tel, Via_Indirizzo, CAP_Indirizzo, Citta_Indirizzo, Numero_Indirizzo, Stato_Indirizzo)
       VALUES (2, 'www.ag2.it', '070-234567', 'Via Corta', 2345, 'Roma', 24, 'Italia');

INSERT INTO AGENZIA (CodA, Tel, Via_Indirizzo, CAP_Indirizzo, Citta_Indirizzo, Numero_Indirizzo, Stato_Indirizzo)
       VALUES (3, '070-345678', 'Via Lunga', 3456, 'Napoli', 38, 'Italia');


INSERT INTO STANZA (CodS, Piano, Superficie, Type)
       VALUES (1, 1, 20, 'singola');

INSERT INTO STANZA (CodS, Piano, Superficie, Type)
       VALUES (2, 2, 30, 'doppia');

INSERT INTO STANZA (CodS, Piano, Superficie, Type)
       VALUES (3, 3, 40, 'tripla');


INSERT INTO PRENOTAZIONE (CodS, DataInizio, DataFine, Costo, CodA)
       VALUES (1, '2023-01-01', '2023-01-10', 100, 1);

INSERT INTO PRENOTAZIONE (CodS, DataInizio, DataFine, Costo, CodA)
       VALUES (2, '2023-01-01', '2023-01-10', 200, 2);

INSERT INTO PRENOTAZIONE (CodS, DataInizio, DataFine, Costo, CodA)
       VALUES (2, '2023-01-12', '2023-01-17', 110, 2);

INSERT INTO PRENOTAZIONE (CodS, DataInizio, DataFine, Costo, CodA)
       VALUES (3, '2023-01-13', '2023-01-17', 170, 2);

INSERT INTO PRENOTAZIONE (CodS, DataInizio, DataFine, Costo, CodA)
       VALUES (3, '2023-02-01', '2023-02-05', 200, 3);

INSERT INTO PRENOTAZIONE (CodS, DataInizio, DataFine, Costo, CodA)
       VALUES (3, '2023-02-06', '2023-02-07', 50, 3);


INSERT INTO OPTIONAL (NomeOptional, CodS)
       VALUES ('balcone', 1);

INSERT INTO OPTIONAL (NomeOptional, CodS)
       VALUES ('balcone', 2);

INSERT INTO OPTIONAL (NomeOptional, CodS)
       VALUES ('minibar', 2);

INSERT INTO OPTIONAL (NomeOptional, CodS)
       VALUES ('jacuzzi', 2);

INSERT INTO OPTIONAL (NomeOptional, CodS)
       VALUES ('minibar', 3);

INSERT INTO SPAZI (NomeSpazio, CodS)
       VALUES ('sala da pranzo', 3);

INSERT INTO SPAZI (NomeSpazio, CodS)
       VALUES ('camera da letto', 3);

INSERT INTO SPAZI (NomeSpazio, CodS)
       VALUES ('bagno', 3);

INSERT INTO SPAZI (NomeSpazio, CodS)
       VALUES ('cucina', 3);