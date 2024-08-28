-- Esercizio 4: manipolazione dei dati
-- Aggiornare il nuovo numero di telefono dell’agenzia con codice 1 a “0987654321”.
UPDATE AGENZIA
SET Tel = '098-7654321'
WHERE CodA=1;
-- La stanza con codice 1 è diventata una stanza doppia di 30mq
UPDATE STANZA
SET Type='doppia',
    Superficie=30
WHERE CodS=1;
-- La prenotazione per la stanza con codice 1, cambiando la data di inizio e fine prenotazione
-- a 10 Gennaio 2023 fino al 20 Gennaio 2023, e il costo a 400 €.
UPDATE PRENOTAZIONE
SET DataInizio='2023-01-10',
    DataFine='2023-01-10',
    Costo='400'
WHERE CodS = 1;
-- La prenotazione dal 12 Gennaio 2023 fino al 17 Gennaio 2023 per la stanza 2 è stata cancellata.
DELETE FROM PRENOTAZIONE
WHERE DataInizio='2023-01-12' AND DataFine='2023-01-17' AND CodS=2;
-- Tutte le prenotazioni con data di inizio successiva al 12 Gennaio 2023 e la cui durata è
-- inferiore a 5 giorni sono state cancellate.
DELETE FROM PRENOTAZIONE 
WHERE DataInizio >= '2023-01-12' AND DataFine < '2023-01-17';