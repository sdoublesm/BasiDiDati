-- Visualizzare il numero di prenotazioni per ogni stanza.
SELECT CodS, COUNT(*) N_PRENOT
FROM PRENOTAZIONE
GROUP BY CodS

-- Visualizzare il numero di stanze, per tipo, per cui non sono mai state fatte prenotazioni
SELECT Type, COUNT(*) N_NOPREN
FROM STANZA
WHERE CodS NOT IN (SELECT CodS FROM PRENOTAZIONE)
GROUP BY Type;

-- Visualizzare per ciascun mese il codice, piano, superficie e tipo di stanza con il costo medio giornaliero mensile più alto

-- MESE | STANZA CON COSTO MEDIO GIORNALIERO PIU ALTO (CODICE, PIANO, SUPERFICIE)

WITH COSTI_MENSILI AS (
    SELECT CodS, EXTRACT(YEAR FROM TO_DATE(DataInizio, 'YYYY-MM-DD')) AS Anno, EXTRACT(MONTH FROM TO_DATE(DataInizio, 'YYYY-MM-DD')) AS Mese, 
           Costo/(TO_DATE(DataFine, 'YYYY-MM-DD') - TO_DATE(DataInizio, 'YYYY-MM-DD')+1) AS CostoGiornaliero
    FROM PRENOTAZIONE
), 
COSTI_MEDI_PER_MESE AS (
    SELECT CodS, Anno, Mese, AVG(CostoGiornaliero) AS MediaGiornaliera
    FROM COSTI_MENSILI
    GROUP BY CodS, Anno, Mese, CodS
),
COSTI_MAX AS (
    SELECT Anno, Mese, MAX(MediaGiornaliera) AS MAXCostoGiornaliero
    FROM COSTI_MEDI_PER_MESE
    GROUP BY Anno, Mese
)

SELECT CMM.Mese, CMM.Anno, S.Piano, S.Superficie, S.Type, CMM.MediaGiornaliera
FROM COSTI_MEDI_PER_MESE CMM, STANZA S, COSTI_MAX CM
WHERE S.CodS = CMM.CodS 
AND CMM.Anno = CM.Anno
AND CMM.Mese = CM.Mese
AND CMM.MediaGiornaliera = CM.MAXCostoGiornaliero