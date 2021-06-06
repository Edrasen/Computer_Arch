LIBRARY STD;
LIBRARY ieee;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity tb_MemoPrograma is
end tb_MemoPrograma;

architecture tb of tb_MemoPrograma is

    component MemoPrograma
        port (dir  : in std_logic_vector (9 downto 0);
              inst : out std_logic_vector (24 downto 0));
    end component;

    signal dir  : std_logic_vector (9 downto 0) := (others => '0');
    signal inst : std_logic_vector (24 downto 0);

begin

    dut : MemoPrograma
    port map (dir  => dir,
              inst => inst);

    stim_proc: process

   file ARCH_SAL : TEXT;
	variable LINEA_SAL : line;
	
	VARIABLE CADENA : STRING(1 TO 6);
	VARIABLE CADENA2 : STRING(1 TO 2);
	variable var_Instruccion: std_logic_vector(24 downto 0);
	variable var_operacion: std_logic_vector(4 downto 0);
	variable var_Parte1 : std_logic_vector(3 downto 0);
	variable var_Parte2 : std_logic_vector(3 downto 0);
	variable var_Parte3 : std_logic_vector(3 downto 0);
	variable var_Parte4 : std_logic_vector(3 downto 0);
	variable var_Parte5 : std_logic_vector(3 downto 0);
	variable ID : std_logic_vector(3 downto 0); 
	variable iterator : integer;
	begin		
      file_open(ARCH_SAL, "D:\ESCOM\ARQUITECTURA\Practica8\MemoriaPrograma.srcs\sim_1\new\salida.txt", WRITE_MODE);
		
		--para los encabezados
	CADENA2:="PC";
	write(LINEA_SAL, CADENA2, right, CADENA2'LENGTH+1);
	CADENA:="OPCODE";
	write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
	CADENA:="19..16";
	write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
	CADENA:="15..12";
	write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
	CADENA:="11...8";
	write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
	CADENA:="7....4";
	write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
	CADENA:="3....0";
	write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
	writeline(ARCH_SAL,LINEA_SAL);

        for iterator in 0 to 11 loop
            if iterator > 9 then
                dir <= "0000000100";
                
            end if;
				dir <= conv_std_logic_vector(iterator, 10);
				
				wait for 10 ps;
				var_Instruccion:= inst;
				
				for j in 24 downto 20 loop
					var_operacion(j-20):=var_Instruccion(j);
				end loop;
			
				for j in 19 downto 16 loop
					var_Parte1(j-16):=var_Instruccion(j);
				end loop;
			
				for j in 15 downto 12 loop
					var_Parte2(j-12):=var_Instruccion(j);
				end loop;
				
				for j in 11 downto 8 loop
					var_Parte3(j-8):=var_Instruccion(j);
				end loop;			
			
				for j in 7 downto 4 loop
					var_Parte4(j-4):=var_Instruccion(j);
				end loop;
		
				for j in 3 downto 0 loop
					var_Parte5(j):=var_Instruccion(j);
		
				end loop;		
				ID:=conv_std_logic_vector(iterator,4);

				
				Hwrite (LINEA_SAL,ID,RIGHT,2);
				write(LINEA_SAL,var_operacion,right,7);
				write(LINEA_SAL,var_Parte1,right,7);
				write(LINEA_SAL,var_Parte2,right,7);
				write(LINEA_SAL,var_Parte3,right,7);
				write(LINEA_SAL,var_Parte4,right,7);
				write(LINEA_SAL,var_Parte5,right,7);
				writeline(ARCH_SAL,LINEA_SAL);-- escribe la linea en el archivo
		end loop;
	
	
			file_close(ARCH_SAL);  -- cierra el archivo

        wait;
    end process;

end tb;
