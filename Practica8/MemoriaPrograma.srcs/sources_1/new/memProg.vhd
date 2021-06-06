library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity MemoPrograma is
    generic (
        m : integer := 10; --tamaño del bus de direcciones
        n : integer := 25 --tamaño de palabra
    );
    Port ( dir : in STD_LOGIC_VECTOR (m-1 downto 0);
           inst : out STD_LOGIC_VECTOR (n-1 downto 0));
end MemoPrograma;

architecture Behavioral of MemoPrograma is
---------------------Tipo R------------------------
constant tipoR : std_logic_vector(4 downto 0) := "00000";

----------Instrucciones de Carga y Almacenamiento-------
constant LI : std_logic_vector(4 downto 0) := "00001";
constant LWI : std_logic_vector(4 downto 0) := "00010";
constant LW : std_logic_vector(4 downto 0) := "10111";
constant SWI : std_logic_vector(4 downto 0) := "00011";
constant SW : std_logic_vector(4 downto 0) := "00100";

---------Aritmeticas con registros----------------
constant add_app : std_logic_vector(3 downto 0) := "0000";  
constant sub_app : std_logic_vector(3 downto 0) := "0001";

---------Aritmeticas--------------------------------
constant addi : std_logic_vector (4 downto 0)  := "00101";  
constant subi : std_logic_vector (4 downto 0)  := "00110";

--------.Logicas-----------------------------------
constant andi : std_logic_vector (4 downto 0)  := "00111";  
constant ori  : std_logic_vector (4 downto 0)  := "01000";  
constant xori : std_logic_vector (4 downto 0)  := "01001";  
constant nandi: std_logic_vector (4 downto 0)  := "01010";  
constant nori : std_logic_vector (4 downto 0)  := "01011";
constant xnori: std_logic_vector (4 downto 0)  := "01100"; 

---------Logicas con Registros--------------------
constant andr : std_logic_vector (3 downto 0) := "0010";  
constant orr  : std_logic_vector (3 downto 0) := "0011";  
constant xorr : std_logic_vector (3 downto 0) := "0100";  
constant nandr: std_logic_vector (3 downto 0) := "0101"; 
constant norr : std_logic_vector (3 downto 0) := "0110";  
constant xnorr: std_logic_vector (3 downto 0) := "0111";  
constant notr : std_logic_vector (3 downto 0) := "1000"; 

--------Identificador Corrimiento R------------------------  
constant sllr : std_logic_vector (3 downto 0) := "1001";  
constant srlr : std_logic_vector (3 downto 0) := "1010"; 

--------Saltos Condicionales e Incondicionales-------------  
constant beqi : std_logic_vector (4 downto 0) := "01101";  
constant bnei : std_logic_vector (4 downto 0) := "01110";  
constant blti : std_logic_vector (4 downto 0) := "01111";  
constant bleti: std_logic_vector (4 downto 0) := "10000";  
constant bgti : std_logic_vector (4 downto 0) := "10001";  
constant bgeti: std_logic_vector (4 downto 0) := "10010";  
constant b    : std_logic_vector (4 downto 0) := "10011";

---------------Manejo de Subrutinas--------------------------------  
constant call : std_logic_vector (4 downto 0):= "10100";  
constant ret : std_logic_vector (4 downto 0) := "10101"; 

--------------- Otros ---------------------------------------------  
constant nop : std_logic_vector (4 downto 0) := "10110";  
constant su  : std_logic_vector (3 downto 0) := "0000"; 

-----------------  Registros --------------------------------------  
constant r0  : std_logic_vector (3 downto 0) := "0000";  
constant r1  : std_logic_vector (3 downto 0) := "0001";  
constant r2  : std_logic_vector (3 downto 0) := "0010";  
constant r3  : std_logic_vector (3 downto 0) := "0011";  
constant r4  : std_logic_vector (3 downto 0) := "0100";  
constant r5  : std_logic_vector (3 downto 0) := "0101";  
constant r6  : std_logic_vector (3 downto 0) := "0110";  
constant r7  : std_logic_vector (3 downto 0) := "0111";  
constant r8  : std_logic_vector (3 downto 0) := "1000";  
constant r9  : std_logic_vector (3 downto 0) := "1001";  
constant r10 : std_logic_vector (3 downto 0) := "1010";  
constant r11 : std_logic_vector (3 downto 0) := "1011";  
constant r12 : std_logic_vector (3 downto 0) := "1100";  
constant r13 : std_logic_vector (3 downto 0) := "1101";  
constant r14 : std_logic_vector (3 downto 0) := "1110";  
constant r15 : std_logic_vector (3 downto 0) := "1111"; 

type banco is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0);
constant aux : banco := (

    LI&R0&x"0000",
    LI&R1&x"0001",
    LI&R2&x"0000",
    LI&R3&x"000C",
    
    tipoR&R4&R0&R1&SU&ADD_APP,
    SWI&R4&x"0072",
    
    ADDI&R0&R1&x"000",
    ADDI&R1&R4&x"000",
    
    ADDI&R2&R2&x"001",
    
    BNEI&R3&R2&x"004",
    
    NOP&SU&SU&SU&SU&SU,
    B&SU&x"000A",
    
    others => (others => '0')
);
begin

    inst <= aux(conv_integer(dir));

end Behavioral;