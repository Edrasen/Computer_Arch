
LIBRARY ieee;
LIBRARY STD;

USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_textio.ALL;
USE STD.textio.ALL;  
 
ENTITY TBUC IS
END TBUC;
 
ARCHITECTURE behavior OF TBUC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         OV : IN  std_logic;
         N : IN  std_logic;
         Z : IN  std_logic;
         C : IN  std_logic;
         LF : IN  std_logic;
         clk : IN  std_logic;
         clr : IN  std_logic;
         OP_CODE : IN  std_logic_vector(4 downto 0);
         FUN_CODE : IN  std_logic_vector(3 downto 0);
         NA_out : OUT  std_logic;
         SDOPC_out : OUT  std_logic;
         SM_out : OUT  std_logic;
         MicroInstruccion : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OV : std_logic := '0';
   signal N : std_logic := '0';
   signal Z : std_logic := '0';
   signal C : std_logic := '0';
   signal LF : std_logic := '0';
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal OP_CODE : std_logic_vector(4 downto 0) := (others => '0');
   signal FUN_CODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal NA_out : std_logic;
   signal SDOPC_out : std_logic;
   signal SM_out : std_logic;
   signal MicroInstruccion : std_logic_vector(19 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          OV => OV,
          N => N,
          Z => Z,
          C => C,
          LF => LF,
          clk => clk,
          clr => clr,
          OP_CODE => OP_CODE,
          FUN_CODE => FUN_CODE,
          NA_out => NA_out,
          SDOPC_out => SDOPC_out,
          SM_out => SM_out,
          MicroInstruccion => MicroInstruccion
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
		 --Entradas
		FILE archivoEntrada 	 : TEXT;
		variable lineaEntrada : LINE;

		variable var_flags 	: std_logic_vector(3 downto 0);
		variable var_LF 		: std_logic;
		variable var_clr 		: std_logic;
		variable var_OP_CODE 		: std_logic_vector(4 downto 0);
		variable var_FUN_CODE 	: std_logic_vector(3 downto 0);
		
		--Salidas
		FILE archivoSalida 	: TEXT;
		variable lineaSalida : LINE;
		
		variable var_MicroInstruccion : std_logic_vector(19 downto 0);
		variable var_NA: std_logic;
		variable var_SDOPC: std_logic;
		variable var_SM: std_logic;
		
		constant E_OP_CODE  	: STRING:="Op_Code";
		constant E_FUN_CODE 	: STRING:="Fun_Code";
		constant E_FLAGS 		: STRING:="Banderas";
		constant E_CLR 		: STRING:="CLR";
		constant E_LF 			: STRING:="LF";
		constant E_NIVEL 		: STRING:="Nivel";
		constant E_ALTO 		: STRING:="ALTO";
		constant E_BAJO 		: STRING:="BAJO";
		constant E_NA 			: STRING:="NA";
		constant E_SDOPC 		: STRING:="SDOPC";
		constant E_SM 			: STRING:="SM";
		
		constant E_Microinstruccion : STRING:="Microinstruccion";
	
	begin		
		
		FILE_OPEN (archivoEntrada, "D:\ESCOM\ARQUITECTURA\Practica14\Main\Main.srcs\sim_1\new\entradas.txt", READ_MODE);
		FILE_OPEN (archivoSalida,"D:\ESCOM\ARQUITECTURA\Practica14\Main\Main.srcs\sim_1\new\salidas.txt",WRITE_MODE);
		
		WRITE (lineaSalida, E_OP_CODE, RIGHT, E_OP_CODE'LENGTH+1);
		WRITE (lineaSalida, E_FUN_CODE, RIGHT, E_FUN_CODE'LENGTH+1);
		WRITE (lineaSalida, E_FLAGS, RIGHT, E_FLAGS'LENGTH+1);
		WRITE (lineaSalida, E_CLR, RIGHT, E_CLR'LENGTH+1);
		WRITE (lineaSalida, E_LF, RIGHT, E_LF'LENGTH+1);
		WRITE (lineaSalida, E_Microinstruccion, RIGHT, var_Microinstruccion'LENGTH+1);
		WRITE (lineaSalida, E_NIVEL, RIGHT, E_NIVEL'LENGTH+1);
		
		WRITELINE (archivoSalida, lineaSalida);
		clr<='1';--este daba lata y los clears del archivo
		wait for 12 ns;
		clr<='0';
		WHILE NOT ENDFILE (archivoEntrada) LOOP
			
			WAIT UNTIL RISING_EDGE ( clk );
			READLINE (archivoEntrada, lineaEntrada);
			 
			READ(lineaEntrada, var_OP_CODE);
			OP_CODE <= var_OP_CODE;
			
			READ(lineaEntrada, var_FUN_CODE);
			FUN_CODE <= var_FUN_CODE;
			
			READ(lineaEntrada, var_FLAGS);
			OV <= var_FLAGS(3);
			N  <= var_FLAGS(2);
			Z  <= var_FLAGS(1);
			C  <= var_FLAGS(0);
			
			READ(lineaEntrada, var_CLR);
			clr<=var_CLR;
			
			READ(lineaEntrada, var_LF);
			LF<=var_LF;
			
			WAIT FOR 4 NS;
			
			var_Microinstruccion := Microinstruccion;
			
			--Se escriben entradas
			WRITE(lineaSalida, var_OP_CODE, RIGHT, E_OP_CODE'LENGTH+1);
			WRITE(lineaSalida, var_FUN_CODE, RIGHT, E_FUN_CODE'LENGTH+1);
			WRITE(lineaSalida, var_FLAGS, RIGHT, E_FLAGS'LENGTH+1);
			WRITE(lineaSalida, var_CLR, RIGHT, E_CLR'LENGTH+1);
			WRITE(lineaSalida, var_LF, RIGHT, E_LF'LENGTH+1);
			
			--Se escriben salidas
			WRITE(lineaSalida, var_Microinstruccion, RIGHT, Microinstruccion'LENGTH+1);
			WRITE(lineaSalida, E_ALTO, RIGHT, E_NIVEL'LENGTH+1);
			
			WRITELINE(archivoSalida, lineaSalida);
			
			WAIT UNTIL FALLING_EDGE ( clk );
			wait for 4 ns;
			var_Microinstruccion := Microinstruccion;

			--Se escriben entradas
			WRITE(lineaSalida, var_OP_CODE, RIGHT, E_OP_CODE'LENGTH+1);
			WRITE(lineaSalida, var_FUN_CODE, RIGHT, E_FUN_CODE'LENGTH+1);
			WRITE(lineaSalida, var_FLAGS, RIGHT, E_FLAGS'LENGTH+1);
			WRITE(lineaSalida, var_CLR, RIGHT, E_CLR'LENGTH+1);
			WRITE(lineaSalida, var_LF, RIGHT, E_LF'LENGTH+1);
			
			--Se escriben salidas
			WRITE(lineaSalida, var_Microinstruccion, RIGHT, Microinstruccion'LENGTH+1);
			WRITE(lineaSalida, E_BAJO, RIGHT, E_NIVEL'LENGTH+1);
			
			WRITELINE(archivoSalida, lineaSalida);
			
		END LOOP;
		
		--Se cierran archivos de texto
		FILE_CLOSE(archivoEntrada);
		FILE_CLOSE(archivoSalida);
		
      wait;
   end process;

END;
