/* 
EVENTO(CodE, NomeEvento, CategoriaEvento, CostoEvento, DurataEvento)
CALENDARIO_EVENTI(CodE, Data, OraInizio, Luogo)
SOMMARIO_CATEGORIA(CategoriaEvento, Data, NumeroTotaleEventi, CostoComplessivoEventi)

Il costo di un evento della categoria proiezione 
cinematografica (attributo CategoriaEvento) non può essere superiore a 1500 euro. Se un valore di costo
superiore a 1500 è inserito nella tabella EVENTO, all’attributo CostoEvento deve essere assegnato il
valore 1500. Si scriva il trigger per la gestione del vincolo di integrità. */

CREATE OR REPLACE TRIGGER costomax
AFTER INSERT OR UPDATE OF CostoEvento, CategoriaEvento ON EVENTO
FOR EACH ROW
WHEN (NEW.CategoriaEvento = 'Proiezione cinematografica' AND NEW.CostoEvento > 1500)

BEGIN
    :NEW.CostoEvento := 1500;
END;

/* In ogni data non possono essere pianificati più di 10
eventi. Ogni modifica della tabella CALANDARIO_EVENTI che causa la violazione del vincolo non
deve essere eseguita. */

CREATE OR REPLACE TRIGGER maxeventi
AFTER INSERT OR UPDATE OF Data ON CALENDARIO_EVENTI
-- [!] FOR EACH ROW (NO, devo avere visione complessiva del calendario)

DECLARE
N NUMBER
BEGIN
-- Meglio non utilizzare tabelle derivate / CTE poiche potrebbero essere supportate dai triggers in Oracle
-- N = eventi ci sono nelle date che non soddisfano il vincolo
SELECT COUNT(*) INTO N
FROM CALENDARIO_EVENTI
WHERE DATA IN (
    SELECT Data
    FROM CALENDARIO_EVENTI
    GROUP BY Data
    HAVING COUNT(*)>10)

IF (N<>0) THEN
    raise_application_error(101, "Troppi eventi")
END IF;
END;

