LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
 
ENTITY tb_pila_mem IS
END tb_pila_mem;
 
ARCHITECTURE behavior OF tb_pila_mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         inst : OUT  std_logic_vector(24 downto 0);
         pc_in : IN  std_logic_vector(15 downto 0);
		 pc_out : out  std_logic_vector(9 downto 0);
         sp_out : out std_logic_vector(2 downto 0);
         clk : IN  std_logic;
         clr : IN  std_logic;
         up : IN  std_logic;
         dw : IN  std_logic;
         wpc : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal pc_in : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal up : std_logic := '0';
   signal dw : std_logic := '0';
   signal wpc : std_logic := '0';

 	--Outputs
   signal inst : std_logic_vector(24 downto 0);
   signal pc_out : std_logic_vector(9 downto 0);
   signal sp_out : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          inst => inst,
          pc_in => pc_in,
		  pc_out => pc_out,
		  sp_out => sp_out,
          clk => clk,
          clr => clr,
          up => up,
          dw => dw,
          wpc => wpc
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
   file ARCH_RES : TEXT;																					
	variable LINEA_RES : line;
   variable var_inst : std_logic_vector(24 downto 0);
	
	
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
	variable var_pc : std_logic_vector(15 downto 0);
	variable var_pc_out : std_logic_vector(9 downto 0);
	variable var_clk,var_clr,var_up,var_dw,var_wpc: std_logic;
	variable var_sp_out : std_logic_vector(2 downto 0);
	
	variable cadena2 : string(1 to 2);
	variable cadena5 : string(1 to 5);
	variable cadena6 : string(1 to 6);
   begin		
		file_open(ARCH_RES, "D:\ESCOM\ARQUITECTURA\Practica11\pilaMem\pilaMem.srcs\sim_1\new\RESULTADO.TXT", WRITE_MODE); 
		file_open(ARCH_VEC, "D:\ESCOM\ARQUITECTURA\Practica11\pilaMem\pilaMem.srcs\sim_1\new\VECTORES.TXT", READ_MODE); 	
			
        cadena2 := "SP";
        write(LINEA_RES, cadena2, left, 3);
		cadena2 := "PC";
		write(LINEA_RES, cadena2, left, 5);	
		cadena6 := "OPCODE";
		write(LINEA_RES, cadena6, left, 7);	
		cadena2 := "RD";
		write(LINEA_RES, cadena2, left, 6);	
		cadena2 := "RT";
		write(LINEA_RES, cadena2, left, 6);
		cadena2 := "RS";
		write(LINEA_RES, cadena2, left, 6);
		cadena5 := "Shamt";
		write(LINEA_RES, cadena5, left, 6);
		cadena5 := "FCODE";
		write(LINEA_RES, cadena5, left, 6);
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo

		WAIT FOR 100 NS;
		FOR I IN 0 TO 20 LOOP
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa
			Hread(LINEA_VEC, var_pc);
			pc_in <= var_pc;
			read(LINEA_VEC, var_up);
			up <= var_up;		
			read(LINEA_VEC, var_dw);  
			dw <= var_dw;
			read(LINEA_VEC, var_wpc);
			wpc <= var_wpc;
			read(LINEA_VEC, var_clr);
			clr <= var_clr;
					
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			--wait for 100 ns;
			var_pc_out := pc_out;
			var_inst := inst;
			var_sp_out := sp_out;
			--wait for 100 ns;
			Hwrite(LINEA_RES, var_sp_out, left, 3);
			Hwrite(LINEA_RES, var_pc_out, left, 5);	--ESCRIBE EL CAMPO pc_out
			write(LINEA_RES, var_inst(24 downto 20), left, 7);
			write(LINEA_RES, var_inst(19 downto 16), left, 6);
			write(LINEA_RES, var_inst(15 downto 12), left, 6);
			write(LINEA_RES, var_inst(11 downto 8), left, 6);
			write(LINEA_RES, var_inst(7 downto 4), left, 6);
			write(LINEA_RES, var_inst(3 downto 0), left, 6);
			
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
			
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo

		--wait for clk_period*10;
      wait;
   end process;

END;
