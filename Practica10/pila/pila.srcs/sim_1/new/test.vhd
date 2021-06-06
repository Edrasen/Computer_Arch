LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         pc_in : IN  std_logic_vector(15 downto 0);
         pc_out : OUT  std_logic_vector(15 downto 0);
         up : IN  std_logic;
         dw : IN  std_logic;
         wpc : IN  std_logic;
         clk : IN  std_logic;
         clr : IN  std_logic;
			sp_out  : out STD_LOGIC_VECTOR(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc_in : std_logic_vector(15 downto 0) := (others => '0');
   signal up : std_logic := '0';
   signal dw : std_logic := '0';
   signal wpc : std_logic := '0';
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(15 downto 0);
	signal sp_out  : STD_LOGIC_VECTOR(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          pc_in => pc_in,
          pc_out => pc_out,
          up => up,
          dw => dw,
          wpc => wpc,
          clk => clk,
          clr => clr,
			 sp_out => sp_out
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
		--Variables para el manejo del archivo
		file ARCH_RES : TEXT;	
		file ARCH_VEC : TEXT;
		variable LINEA_RES : line;
		variable LINEA_VEC : line;
		
		--Variables de la entidad
		variable var_up: std_logic;
		variable var_dw: std_logic;
		variable var_wpc: std_logic;
		variable var_clr: std_logic;
		variable CADENA: string(1 to 6);
		variable var_pc_in : std_logic_vector(15 downto 0);
		variable var_pc_out: std_logic_vector(15 downto 0);
		variable var_sp_out: std_logic_vector(2 downto 0);
		
   begin
		file_open(ARCH_VEC, "D:\ESCOM\ARQUITECTURA\Practica10\pila\pila.srcs\sim_1\new\VECTORES.txt", READ_MODE);
		file_open(ARCH_RES, "D:\ESCOM\ARQUITECTURA\Practica10\pila\pila.srcs\sim_1\new\RESULTADO.txt", WRITE_MODE); 
		
		CADENA :="SP    ";
		write(LINEA_RES, CADENA, left, CADENA'LENGTH);
		CADENA :="PC_out";
		write(LINEA_RES, CADENA, left, CADENA'LENGTH+2);
		writeline(ARCH_RES, LINEA_RES);
		
      -- hold reset state for 100 ns.
      wait for 2 ps;	
			FOR I IN 0 TO 24 LOOP
				readline(ARCH_VEC,LINEA_VEC);
				Hread(LINEA_VEC, var_pc_in);
				pc_in <= var_pc_in;
				read(LINEA_VEC, var_clr);
				clr <= var_clr;
				read(LINEA_VEC, var_wpc);
				wpc <= var_wpc;
				read(LINEA_VEC, var_up);
				up <= var_up;
				read(LINEA_VEC, var_dw);
				dw <= var_dw;
				
				WAIT UNTIL RISING_EDGE(CLK);
				
				var_pc_out := pc_out;
				var_pc_in  := pc_in;
				var_up     :=up;
				var_dw	  :=dw;
				var_wpc    :=wpc;
				var_clr    :=clr;
				var_sp_out :=sp_out;
				

				write(LINEA_RES, var_sp_out,left, 6);
				Hwrite(LINEA_RES, var_pc_out, left, 8);
				writeline(ARCH_RES, LINEA_RES);
			end loop;
			file_close(ARCH_VEC);  -- cierra el archivo
			file_close(ARCH_RES);  -- cierra el archivo
			
      wait for clk_period*10;
      wait;
   end process;

END;
