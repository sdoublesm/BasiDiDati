/*
Si deve calcolare il costo totale della revisione. La tabella INTERVENTI_RICHIESTI memorizza l’elenco dei tipi di intervento richiesti per il veicolo per cui è prenotata la revisione. La tabella COSTO_INTERVENTI memorizza il costo di per ogni tipo di intervento in base alla marca e il modello dei veicolo.
- Si deve notificare l’avvenuta prenotazione inserendo un nuovo record nella tabella NOTIFICA_INFO_TAGLIANDO, fornendo le indicazioni sulla data selezionata e l’orario di apertura e chiusura nella data, e il costo totale per la revisione. 
*/

CREATE OR REPLACE TRIGGER prenotazioneRevisioni
AFTER INSERT ON PRENOTAZIONE_TAGLIANDO
FOR EACH ROW
DECLARE
CHK NUMBER;
DATASEL DATE;
COSTO_TOT NUMBER;
OASel CHAR(10);
OCSel CHAR(10);

BEGIN

-- Se in nessuna data SUCCESSIVA O UGUALE ci sono posti disponibili, la richiesta di prenotazione deve essere annullata.

-- Numero prenotazioni con posti disponibili in una data successiva o uguale
SELECT SUM(NumeroPostiDisponibili) CHK
FROM DISPONIBILITA_PRENOTAZIONE
WHERE Data >= :NEW.Data ;

IF CHK<=0 THEN
	RAISE_APPLICATION_ERROR(100, "Nessun posto disponibile");
END IF;

SELECT MIN(Data) INTO DATASEL, OraApertura INTO OASel, OraChiusura INTO OCSel 
FROM DISPONIBILITA_PRENOTAZIONE
WHERE Data >= :NEW.Data
AND NumeroPostiDisponibili > 0
ORDER BY Data;

-- Aggiorna il numero di posti disponibili

UPDATE DISPONIBILITA_PRENOTAZIONE
SET NumeroPostiDisponibili = NumeroPostiDisponibili - 1
WHERE Data = DATASEL;

-- calcolo costo totale revisione
SELECT Targa, SUM(Costo) INTO COSTO_TOT
FROM INTERVENTI_RICHIESTI R, COSTO_INTERVENTI C
AND R.Targa = :NEW.Targa 
AND C.TipoIntervento = R.TipoIntervento
GROUP BY Targa;

-- notifica dell'avvenuta prenotazione
INSERT INTO NOTIFICA_INFO_TAGLIANDO  (CodR, Targa, DataTagliando, OrarioApertura, OrarioChiusura, CostoTotale)
VALUES (:NEW.CodR, :NEW.Targa, DATASEL, OASel, OCSel, COSTO_TOT);

END;