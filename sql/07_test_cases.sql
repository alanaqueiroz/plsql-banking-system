SET SERVEROUTPUT ON;

BEGIN
    pkg_bancario.saque(1, 1000);
END;
/

INSERT INTO cliente (nome, cpf)
VALUES ('Maria Souza', '12345678901');

BEGIN
    pkg_bancario.abrir_conta(1, '12345-1');
END;
/

BEGIN
    pkg_bancario.deposito(999, 100);
END;
/

BEGIN
    pkg_bancario.deposito(1, 0);
END;
/

SELECT saldo FROM conta WHERE id_conta = 1;

BEGIN
    pkg_bancario.deposito(1, 250);
END;
/

SELECT * FROM cliente;

SELECT * FROM conta;

SELECT * FROM transacao;

SELECT saldo FROM conta WHERE id_conta = 1;

SELECT * FROM transacao ORDER BY id_transacao DESC;
