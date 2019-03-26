-- Quartus II - VHDL
-- Sistemas Digitais (Aula 2)
-- Data: 19.03.19
-- Iniciando o Quartus
-- Aula sobre o CI7404


ENTITY aula2 IS
PORT(
            A1,A2,A3,A4,A5,A6: IN BIT;
            Y1,Y2,Y3,Y4,Y5,Y6: OUT BIT
);
END aula2;

ARCHITECTURE aula2 OF aula2 IS
BEGIN
Y1 <= not A1;
Y2 <= not A2;
Y3 <= not A3;
Y4 <= not A4;
Y5 <= not A5;
Y6 <= not A6;
END aula2;
