INSERT INTO cliente (nome, cpf)
VALUES ('João Silva','12345678901');

BEGIN
    pkg_bancario.abrir_conta(1,'12345-1');
END;
/

BEGIN
    pkg_bancario.deposito(1, 500);
END;
/

BEGIN
    pkg_bancario.saque(1, 200);
END;
/
