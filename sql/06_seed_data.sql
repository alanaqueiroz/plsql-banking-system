SET SERVEROUTPUT ON;

--------------------------------------------------------
-- SEED DATA
-- Cenário base válido para inicialização do sistema
--------------------------------------------------------

-- 1) Inserir cliente inicial
INSERT INTO cliente (nome, cpf)
VALUES ('João Silva','12345678901');

-- 2) Abrir conta para o cliente ID 1
BEGIN
    pkg_bancario.abrir_conta(1,'12345-1');
END;
/

-- 3) Realizar depósito inicial
BEGIN
    pkg_bancario.deposito(1, 500);
END;
/

-- 4) Realizar saque válido
BEGIN
    pkg_bancario.saque(1, 200);
END;
/

-- 5) Verificar saldo final esperado (300)
SELECT saldo FROM conta WHERE id_conta = 1;

-- 6) Verificar saldo via procedure consultar_saldo
SELECT consultar_saldo(1)
FROM dual;
