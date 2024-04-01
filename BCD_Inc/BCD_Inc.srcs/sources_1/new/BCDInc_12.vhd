----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2024 06:30:10
-- Design Name: 
-- Module Name: BCDInc_12 - RTL_bcdinc_12
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDInc_12 is
    generic(K : natural := 1);
    port(
        Num : in std_logic_vector(11 downto 0);
        y : out std_logic_vector(11 downto 0)
    );
end BCDInc_12;

architecture RTL_bcdinc_12 of BCDInc_12 is
-- instantiate first adder: Num(3 downto ) + 1 = adr1_sum
-- instantiate second adder: C1 + Num(7 downto 4) = adr2_sum
-- instantiate third adder: C2 + Num(11 downto 8) = adr3_sum
-- y = adr3_sum & adr2_sum & adr1_sum
    signal C1, C2, C3, adr1_c, adr2_c, adr3_c : std_logic := '0';
    signal vec_c1, vec_c2 : std_logic_vector(3 downto 0) := "0000";
    signal adr1_sum, adr2_sum, adr3_sum, sum1, sum2, sum3 : std_logic_vector(3 downto 0);
    signal inc_amt : std_logic_vector(3 downto 0);    

begin
    inc_amt <= std_logic_vector(to_unsigned(K, 4));
    ADR1 : entity work.Adder_N
        generic map(N => 4)
        port map(a => Num(3 downto 0), b => inc_amt, cout => C1, sum => sum1);
    adr1_sum <= sum1 when unsigned(sum1) < 10 else "0000";
    adr1_c <= C1 when unsigned(sum1) < 10 else '1';
    vec_c1 <= "000" & adr1_c;
    
    ADR2: entity work.Adder_N
        generic map(N => 4)
        port map(a => Num(7 downto 4), b => vec_c1, cout => C2, sum => sum2);
    adr2_sum <= sum2 when unsigned(sum2) < 10 else "0000";
    adr2_c <= C2 when unsigned(sum2) < 10 else '1';
    vec_c2 <= "000" & adr2_c;
    
    ADR3 : entity work.Adder_N
        generic map(N => 4)
        port map(a => Num(11 downto 8), b => vec_c2, cout => C3, sum => sum3);
    adr3_sum <= sum3 when unsigned(sum3) < 10 else "0000";
    adr3_c <= C3 when unsigned(sum3) < 10 else '1';
    y <= adr3_sum & adr2_sum & adr1_sum;

end RTL_bcdinc_12;
