library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MemProg is
	generic(
		n : integer := 10 --bits de CP / log2(#palabras)
	);
	port(
		pc : in std_logic_vector (n - 1 downto 0);
		inst : out std_logic_vector (24 downto 0)
		);
end MemProg;

architecture Funcion of MemProg is

	--CONSTANTES DE INSTRUCCIONES
	--Instrucciones tipo R
	constant tipo_r : std_logic_vector (4 downto 0) := "00000";
	--Carga y Almacenamiento
	constant li : std_logic_vector (4 downto 0) := "00001";
	constant lwi : std_logic_vector (4 downto 0) := "00010";
	constant lw : std_logic_vector (4 downto 0) := "10111";
	constant swi : std_logic_vector (4 downto 0) := "00011";
	constant sw : std_logic_vector (4 downto 0) := "00100";
	--Aritmticas
	constant addi : std_logic_vector (4 downto 0) := "00101";
	constant subi : std_logic_vector (4 downto 0) := "00110";
	--Identificador Aritmticas R
	constant add : std_logic_vector (3 downto 0) := "0000";
	constant sub : std_logic_vector (3 downto 0) := "0001";
	--Logicas
	constant andi : std_logic_vector (4 downto 0) := "00111";
	constant ori : std_logic_vector (4 downto 0) := "01000";
	constant xori : std_logic_vector (4 downto 0) := "01001";
	constant nandi : std_logic_vector (4 downto 0) := "01010";
	constant nori : std_logic_vector (4 downto 0) := "01011";
	constant xnori : std_logic_vector (4 downto 0) := "01100";
	--Identificador Logicas R
	constant andr : std_logic_vector (3 downto 0) := "0010";
	constant orr : std_logic_vector (3 downto 0) := "0011";
	constant xorr : std_logic_vector (3 downto 0) := "0100";
	constant nandr : std_logic_vector (3 downto 0) := "0101";
	constant norr : std_logic_vector (3 downto 0) := "0110";
	constant xnorr : std_logic_vector (3 downto 0) := "0111";
	constant notr : std_logic_vector (3 downto 0) := "1000";
	--Identificador Corrimiento R
	constant sllr : std_logic_vector (3 downto 0) := "1001";
	constant srlr : std_logic_vector (3 downto 0) := "1010";
	--Saltos Condicionales e Incondicionales
	constant beqi : std_logic_vector (4 downto 0) := "01101";
	constant bnei : std_logic_vector (4 downto 0) := "01110";
	constant blti : std_logic_vector (4 downto 0) := "01111";
	constant bleti : std_logic_vector (4 downto 0) := "10000";
	constant bgti : std_logic_vector (4 downto 0) := "10001";
	constant bgeti : std_logic_vector (4 downto 0) := "10010";
	constant b : std_logic_vector (4 downto 0) := "10011";
	--Manejo de Subrutinas
	constant call : std_logic_vector (4 downto 0) := "10100";
	constant ret : std_logic_vector (4 downto 0) := "10101";
	--Otros
	constant nop : std_logic_vector (4 downto 0) := "10110";
	constant su : std_logic_vector (3 downto 0) := "0000"; -- sin usar
	--Registros
	constant R0 : std_logic_vector (3 downto 0) := "0000";
	constant R1 : std_logic_vector (3 downto 0) := "0001";
	constant R2 : std_logic_vector (3 downto 0) := "0010";
	constant R3 : std_logic_vector (3 downto 0) := "0011";
	constant R4 : std_logic_vector (3 downto 0) := "0100";
	constant R5 : std_logic_vector (3 downto 0) := "0101";
	constant R6 : std_logic_vector (3 downto 0) := "0110";
	constant R7 : std_logic_vector (3 downto 0) := "0111";
	constant R8 : std_logic_vector (3 downto 0) := "1000";
	constant R9 : std_logic_vector (3 downto 0) := "1001";
	constant R10 : std_logic_vector (3 downto 0) := "1010";
	constant R11 : std_logic_vector (3 downto 0) := "1011";
	constant R12 : std_logic_vector (3 downto 0) := "1100";
	constant R13 : std_logic_vector (3 downto 0) := "1101";
	constant R14 : std_logic_vector (3 downto 0) := "1110";
	constant R15 : std_logic_vector (3 downto 0) := "1111";
	
	--PROGRAMA
	type aux is array(0 to 2**n - 1) of std_logic_vector(24 downto 0);
	constant programa : aux := (
		
--		EJEMPLO 1
--
--		LI & R0 & X"0001", 
	
--		LI & R1 & X"0007",
		
--		TIPO_R & R1 & R0 & R1 & SU & ADD, 
		
--		SWI & R1 & X"0005",
		
--		B & SU & X"0002",   
--------------------------------------------------------------------------------
--      PROMEDIO DE 4 ARREGLOS
        
        
--      LLENADO
        LI & R0 & X"0000",                  --0        
        LI & R1 & X"000A",                  --1    
        LI & R2 & X"0004",                  --2    
        SW & R1 & R0 & X"000",              --3
        ADDI & R0 & R0 & X"001",            --4
        ADDI & R1 & R1 & X"00A",            --5
        BLTI & R2 & R0 & X"FFD",            --6
        --RET & SU & SU & SU & SU & SU,       --7
    
--      PROMEDIO
        LI & R1 & X"0000",                  --7
        LI & R2 & X"0000",                  --8
        LI & R3 & X"0004",                  --9
        LW & R4 & R1 & X"000",              --10
        TIPO_R & R2 & R4 & R2 & SU & ADD,   --11
        ADDI & R1 & R1 & X"001",            --12
        BLTI & R3 & R1 & X"FFD",            --13
        TIPO_R & R2 & R2 & SU & X"2" & SRLR,      --14
        SWI & R2 & X"0900",                       --15
        LWI & R2 & X"0900",                        --16
        NOP & SU & SU & SU & SU & SU,               --17
        B & SU & X"0011",
        
        

--------------------------------------------------------------------------------
		
-- 	NORMAL
-- --	li r1 9 r2 10 r 26
-- 	LI & R1 & x"0009", --0
-- 	LI & R2 & x"000a", --1
-- 	LI & R3 & x"001a", --2
-- 	blti&r2&r1&x"005", --3
-- 	blti&r3&r2&x"006", --4
-- 	swi&r3&x"0026", --5
-- 	nop&su&su&su&su&su, --6
-- 	b&su&x"000E", --7
-- 	blti&r3&r1&x"004", --8
-- 	b&su&x"0005", --9
-- 	swi&r2&x"0026", --10
-- 	b&su&x"0006", --11
-- 	swi&r1&x"0026", --12
-- 	b&su&x"0006", --13
-- 	lwi&R5&x"0026", --14
-- 	nop&su&su&su&su&su, --15
-- 	b&su&x"000E", --16
	
--	addi&r4&r1&x"000",		--addi, r4, r1, #0
	--blti&r4&r2&x"006" ,     --blti, r4, r2, 6 (s1)
	--blti&r4&r3&x"008" ,     --blti, r4, r3, 8 (s2)		--salto 1
	--swi&r4&x"0026",			--swi r4 0x26					--salto 2
	--nop&su&su&su&su&su,  	--nop								--fin
	--b&su&x"0100",  			--b fin
	--addi&r4&r2&x"000",		--addi, r4, r2, #0 			--s1
	--b&su&x"0010",  			--b salto1
	--addi&r4&r3&x"000",		--addi, r4, r3, #0 			--s1
	--b&su&x"0011",  			--b salto 2


---		BUBBLE -----------------------------------------------------------
--		call & SU & x"0006", 					--	(0) B ARREGLO -> (6)
--		call & SU & x"0010", 					--	(1) B BURBUJA -> (22)
--		call & SU & x"0021",					--	(2) B MOSTRAR -> (42)
--		B & SU & x"0002",						--	(3) B (2)
--		--FIN-------------------------------------------------------------
--		NOP & SU & SU & SU & SU & SU,			--	(4) NOP FIN 
--		B & SU & x"0004",						--	(5) Branch - - - - - - 
--		--ARREGLO---------------------------------------------------------								
--		LI & R2 & x"0000",						--	(6)	 R2 = 0- - - - - -  Contador de memoria 
--		LI & R3 & x"001C",						--	(7)	 R3 = 5- - - - - -  Numero de elementos
--		LI & R4 & x"0000",						--	(8)	 R3 = 5- - - - - -  Numero minimo de elementos
--		LI & R1 & x"0033",						--	(9)	 R1 = 50- - - - - - Numero a agregar a memoria   				
--		SW & R1 & R2 & x"000", 					--  (10)  men[R2 + 1] = R1
--		SUBI & R1 & R1 & x"001",				--	(11) R1 = R1 - 1
--		SUBI & R3 & R3 & x"001",				--	(12) R3 = R3 - 1	
--		ADDI & R2 & R2 & x"001",-------------13
--		BGETI & R4 & R3 & "111111111100",		--14--			
--		ret & SU & SU & SU & SU & SU,			--  (15) - - FIN ARREGLO-          	
--		--BURBUJA---------------------------------------------------------
--		LI & R10 & x"0028",						--	(16) LIMITE I   R10= 4
--		LI & R11 & x"0028",						--	(17) LIMITE J   R11= 4
--		LI & R2 & x"0000",						--	(18) CONTADOR I R2 = 0
--		LI & R3 & x"0001",						--	(19) Contador J	R3 = 1
--		--CICLO I---------------------------------------------------------
--		--CICLO J---------------------------------------------------------
--		SUBI & R6 & R3 & x"001",				--	(20) R6 = R3 - 1 = 0 -
--		LW & R4 & R6 & x"000",					--	(21) R4 = MEM[J - 1] -
--		LW & R5 & R3 & x"000",					--	(22) R5 = MEM[J] - - -
--		ADDI & R4 & R4 & x"000",				--	(23) R4 = R4
--		ADDI & R5 & R5 & x"000",				--	(24) R5 = R5
--		BLETI & R5 & R4 & x"005",				--	(25) BLTI INCREMENTO J R4 <= R5 -> (26 + 5)
--		----INTERCAMBIO----------------------------------------------------
--		SW & R4 & R3 & "000000000000",			--	(26) MEM[R6 + 0] = R4
--		SW & R5 & R6 & "000000000000",			--	(27) MEM[R3 + 0] = R5
--			--INCREMENTO J ---------------------------------------------------
--		ADDI & R3 & R3 & "000000000001",		--	(28) R3 = J (R8) + 1
--		BLETI & R11 & R3 & "111111110111",		--	(29) BNEI CICLO J R3 <= R11 = 4 -> 32 - 9
--			--INCREMENTO I----------------------------------------------------
--		ADDI  & R2 & R2 & "000000000001",		--	(30) R2 = R9 + 1
--		BLETI & R10 & R2 & "111111110100",		--	(31) BNEI CICLO I R2 <= R10 = 4 -> 34-12
--		ret & SU & SU & SU & SU & SU,			--	(32) Regresar FIN Burbuja
--		--MOSTRAR---------------------------------------------------------------
--		LWI & R14 & x"0000",					--	(33) R14 = MEM[0]
--		LWI & R14 & x"0001",					--	(34) R14 = MEM[1]
--		LWI & R14 & x"0002",					--	(35) R14 = MEM[2]
--		LWI & R14 & x"0003",					--	(36) R14 = MEM[3]
--		LWI & R14 & x"0004",					--	(37) R14 = MEM[4]
--		LWI & R14 & x"0005",					--	(38) R14 = MEM[4]
		
--		LWI & R14 & x"0006",					--	(33) R14 = MEM[0]
--		LWI & R14 & x"0007",					--	(34) R14 = MEM[1]
--		LWI & R14 & x"0008",					--	(35) R14 = MEM[2]
--		LWI & R14 & x"0009",					--	(36) R14 = MEM[3]
--		LWI & R14 & x"000a",					--	(37) R14 = MEM[4]
--		LWI & R14 & x"000b",					--	(38) R14 = MEM[4]
		
--		LWI & R14 & x"000c",					--	(33) R14 = MEM[0]
--		LWI & R14 & x"000d",					--	(34) R14 = MEM[1]
--		LWI & R14 & x"000e",					--	(35) R14 = MEM[2]
--		LWI & R14 & x"000f",					--	(36) R14 = MEM[3]
--		LWI & R14 & x"0010",					--	(37) R14 = MEM[4]
--		LWI & R14 & x"0011",					--	(38) R14 = MEM[4]
		
--		LWI & R14 & x"0012",					--	(33) R14 = MEM[0]
--		LWI & R14 & x"0013",					--	(34) R14 = MEM[1]
--		LWI & R14 & x"0014",					--	(35) R14 = MEM[2]
--		LWI & R14 & x"0015",					--	(36) R14 = MEM[3]
--		LWI & R14 & x"0016",					--	(37) R14 = MEM[4]
--		LWI & R14 & x"0017",					--	(38) R14 = MEM[4]
		
--		LWI & R14 & x"0018",					--	(33) R14 = MEM[0]
--		LWI & R14 & x"0019",					--	(34) R14 = MEM[1]
--		LWI & R14 & x"001A",					--	(35) R14 = MEM[2]
--		LWI & R14 & x"001B",					--	(36) R14 = MEM[3]
--		--LWI & R14 & x"001C",					--	(37) R14 = MEM[4]
		
--		B&su&x"0021",							--	(39) CICLADO
--		ret & SU & SU & SU & SU & SU,			--	(40)
		others => (others => '0')
	);
	
	begin
		inst <= programa( conv_integer(PC) );
end Funcion;

