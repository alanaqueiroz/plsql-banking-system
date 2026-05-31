CREATE OR REPLACE PACKAGE pkg_bancario AS
  PROCEDURE abrir_conta(p_id_cliente NUMBER, p_numero VARCHAR2);
  PROCEDURE deposito(p_id_conta NUMBER, p_valor NUMBER);
  PROCEDURE saque(p_id_conta NUMBER, p_valor NUMBER);
  FUNCTION consultar_saldo(
      p_id_conta NUMBER
  ) RETURN NUMBER;
END pkg_bancario;
/