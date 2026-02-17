CREATE OR REPLACE PACKAGE BODY pkg_bancario AS

  PROCEDURE abrir_conta(p_id_cliente NUMBER, p_numero VARCHAR2) IS
    v_count NUMBER;
  BEGIN
        SELECT COUNT(*) INTO v_count
    FROM cliente
    WHERE id_cliente = p_id_cliente;

    IF v_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20010, 'Cliente não encontrado.');
    END IF;

    INSERT INTO conta(id_cliente, numero)
    VALUES (p_id_cliente, p_numero);

    DBMS_OUTPUT.PUT_LINE('Conta ' || p_numero || ' aberta com sucesso.');
  END abrir_conta;

  PROCEDURE deposito(p_id_conta NUMBER, p_valor NUMBER) IS
    v_count NUMBER;
  BEGIN
    IF p_valor <= 0 THEN
      RAISE_APPLICATION_ERROR(-20011, 'Valor do depósito deve ser maior que zero.');
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM conta
    WHERE id_conta = p_id_conta;

    IF v_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20012, 'Conta não encontrada.');
    END IF;

    UPDATE conta
    SET saldo = saldo + p_valor
    WHERE id_conta = p_id_conta;

    INSERT INTO transacao(id_conta, tipo, valor)
    VALUES (p_id_conta, 'DEPOSITO', p_valor);

    DBMS_OUTPUT.PUT_LINE('Depósito de R$ ' || p_valor || ' realizado com sucesso.');
  END deposito;

  PROCEDURE saque(p_id_conta NUMBER, p_valor NUMBER) IS
    v_count NUMBER;
  BEGIN
    IF p_valor <= 0 THEN
      RAISE_APPLICATION_ERROR(-20013, 'Valor do saque deve ser maior que zero.');
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM conta
    WHERE id_conta = p_id_conta;

    IF v_count = 0 THEN
      RAISE_APPLICATION_ERROR(-20014, 'Conta não encontrada.');
    END IF;

    UPDATE conta
    SET saldo = saldo - p_valor
    WHERE id_conta = p_id_conta;

    INSERT INTO transacao(id_conta, tipo, valor)
    VALUES (p_id_conta, 'SAQUE', p_valor);

    DBMS_OUTPUT.PUT_LINE('Saque de R$ ' || p_valor || ' realizado com sucesso.');
  END saque;

END pkg_bancario;
/
