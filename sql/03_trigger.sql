CREATE OR REPLACE TRIGGER trg_prevent_saldo_negativo
BEFORE UPDATE ON conta
FOR EACH ROW
WHEN (NEW.saldo < 0)
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Saldo insuficiente.');
END;
/
