DROP TABLE HAS_OPTIONAL;
DROP TABLE HAS_SPAZI;
DROP TABLE PRENOTAZIONE;
DROP TABLE AGENZIA;
DROP TABLE OPTIONAL;
DROP TABLE SPAZI;
DROP TABLE STANZA;

-- Tables
CREATE TABLE AGENZIA (
    CodA INTEGER NOT NULL,
    SitoWeb VARCHAR(32),
    Tel VARCHAR(32) NOT NULL,
    Via_Indirizzo VARCHAR(32) NOT NULL,
    CAP_Indirizzo INTEGER NOT NULL,
    Citta_Indirizzo VARCHAR(32) NOT NULL,
    Numero_Indirizzo INTEGER NOT NULL,
    Stato_Indirizzo VARCHAR(32) NOT NULL,
    PRIMARY KEY (CodA)
);
CREATE TABLE STANZA (
    CodS INTEGER NOT NULL,
    Piano INTEGER NOT NULL,
    Superficie INTEGER NOT NULL,
    Type VARCHAR(32) NOT NULL,
    PRIMARY KEY (CodS)
);
CREATE TABLE PRENOTAZIONE (
    CodS INTEGER NOT NULL,
    DataInizio VARCHAR(32) NOT NULL,
    DataFine VARCHAR(32) NOT NULL,
    Costo REAL NOT NULL,
    CodA INTEGER NOT NULL,
    PRIMARY KEY (CodS, DataInizio),
    FOREIGN KEY (CodS) REFERENCES STANZA(CodS),
    FOREIGN KEY (CodA) REFERENCES AGENZIA(CodA)
);
CREATE TABLE OPTIONAL (
    NomeOptional VARCHAR(32) NOT NULL,
    CodS INTEGER NOT NULL,
    PRIMARY KEY (NomeOptional, CodS),
    FOREIGN KEY (CodS) REFERENCES STANZA(CodS)
);
CREATE TABLE SPAZI (
    NomeSpazio VARCHAR(32) NOT NULL,
    CodS INTEGER NOT NULL,
    PRIMARY KEY (NomeSpazio, CodS),
    FOREIGN KEY (CodS) REFERENCES STANZA(CodS)
);