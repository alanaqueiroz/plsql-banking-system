SET SERVEROUTPUT ON;

--------------------------------------------------------
-- TEST CASES
-- Cenários negativos para validação de regras de negócio
--------------------------------------------------------

--------------------------------------------------------
-- TESTE 1: Saque maior que saldo
-- Esperado: Erro de saldo insuficiente (trigger ou regra)
--------------------------------------------------------
BEGIN
    pkg_bancario.saque(1, 1000);
END;
/

--------------------------------------------------------
-- TESTE 2: CPF duplicado
-- Esperado: ORA-00001 (unique constraint)
--------------------------------------------------------
INSERT INTO cliente (nome, cpf)
VALUES ('Maria Souza', '12345678901');

--------------------------------------------------------
-- TESTE 3: Conta inexistente
-- Esperado: -20012 Conta não encontrada
--------------------------------------------------------
BEGIN
    pkg_bancario.deposito(999, 100);
END;
/

--------------------------------------------------------
-- TESTE 4: Depósito com valor inválido
-- Esperado: -20011 Valor deve ser maior que zero
--------------------------------------------------------
BEGIN
    pkg_bancario.deposito(1, 0);
END;
/

--------------------------------------------------------
-- TESTE 5: Operação válida após erros
--------------------------------------------------------
BEGIN
    pkg_bancario.deposito(1, 250);
END;
/

--------------------------------------------------------
-- CONSULTAS FINAIS
--------------------------------------------------------

SELECT saldo FROM conta WHERE id_conta = 1;

SELECT * FROM cliente;

SELECT * FROM conta;

SELECT * FROM transacao
ORDER BY id_transacao DESC;
