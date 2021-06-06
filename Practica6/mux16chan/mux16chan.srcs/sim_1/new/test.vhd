library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux16chan_tb is
end;

architecture bench of mux16chan_tb is

  component mux16chan
      Port ( readReg : in STD_LOGIC_VECTOR (3 downto 0);
             q0 : in STD_LOGIC_VECTOR (15 downto 0);
             q1 : in STD_LOGIC_VECTOR (15 downto 0);
             q2 : in STD_LOGIC_VECTOR (15 downto 0);
             q3 : in STD_LOGIC_VECTOR (15 downto 0);
             q4 : in STD_LOGIC_VECTOR (15 downto 0);
             q5 : in STD_LOGIC_VECTOR (15 downto 0);
             q6 : in STD_LOGIC_VECTOR (15 downto 0);
             q7 : in STD_LOGIC_VECTOR (15 downto 0);
             q8 : in STD_LOGIC_VECTOR (15 downto 0);
             q9 : in STD_LOGIC_VECTOR (15 downto 0);
             qA : in STD_LOGIC_VECTOR (15 downto 0);
             qB : in STD_LOGIC_VECTOR (15 downto 0);
             qC : in STD_LOGIC_VECTOR (15 downto 0);
             qD : in STD_LOGIC_VECTOR (15 downto 0);
             qE : in STD_LOGIC_VECTOR (15 downto 0);
             qF : in STD_LOGIC_VECTOR (15 downto 0);
             readData : out STD_LOGIC_VECTOR (15 downto 0));
  end component;

  signal readReg: STD_LOGIC_VECTOR (3 downto 0);
  signal q0: STD_LOGIC_VECTOR (15 downto 0);
  signal q1: STD_LOGIC_VECTOR (15 downto 0);
  signal q2: STD_LOGIC_VECTOR (15 downto 0);
  signal q3: STD_LOGIC_VECTOR (15 downto 0);
  signal q4: STD_LOGIC_VECTOR (15 downto 0);
  signal q5: STD_LOGIC_VECTOR (15 downto 0);
  signal q6: STD_LOGIC_VECTOR (15 downto 0);
  signal q7: STD_LOGIC_VECTOR (15 downto 0);
  signal q8: STD_LOGIC_VECTOR (15 downto 0);
  signal q9: STD_LOGIC_VECTOR (15 downto 0);
  signal qA: STD_LOGIC_VECTOR (15 downto 0);
  signal qB: STD_LOGIC_VECTOR (15 downto 0);
  signal qC: STD_LOGIC_VECTOR (15 downto 0);
  signal qD: STD_LOGIC_VECTOR (15 downto 0);
  signal qE: STD_LOGIC_VECTOR (15 downto 0);
  signal qF: STD_LOGIC_VECTOR (15 downto 0);
  signal readData: STD_LOGIC_VECTOR (15 downto 0);

begin

  uut: mux16chan port map ( readReg  => readReg,
                            q0       => q0,
                            q1       => q1,
                            q2       => q2,
                            q3       => q3,
                            q4       => q4,
                            q5       => q5,
                            q6       => q6,
                            q7       => q7,
                            q8       => q8,
                            q9       => q9,
                            qA       => qA,
                            qB       => qB,
                            qC       => qC,
                            qD       => qD,
                            qE       => qE,
                            qF       => qF,
                            readData => readData );

  stimulus: process
  begin
  
    q0 <= x"00AB";
    q1 <= x"ABAB";
    q2 <= x"FF00";
    q3 <= x"00A0";
    q4 <= x"00B0";
    q5 <= x"00C0";
    q6 <= x"00F0";
    q7 <= x"0010";
    q8 <= x"0020";
    q9 <= x"0030";
    qA <= x"0040";
    qB <= x"0050";
    qC <= x"0060";
    qD <= x"0070";
    qE <= x"0080";
    qF <= x"AABB";
    
    
    readReg <= "0000";
    wait for 100 ns;
    
    readReg <= "0001";
    wait for 100 ns;
    
    q0 <= x"00FF";
    readReg <= "0000";
    wait for 100 ns;
    
    readReg <= "0001";
    wait for 100 ns;
    
    readReg <= "0010";
    wait for 100 ns;
    
    readReg <= "0011";
    wait for 100 ns;
    
    readReg <= "0100";
    wait for 100 ns;
    
    readReg <= "0101";
    wait for 100 ns;
    
    readReg <= "0110";
    wait for 100 ns;
    
    readReg <= "0111";
    wait for 100 ns;
    
    readReg <= "1000";
    wait for 100 ns;
    
    readReg <= "1001";
    wait for 100 ns;

    readReg <= "1010";
    wait for 100 ns;
 
    wait;
  end process;


end;