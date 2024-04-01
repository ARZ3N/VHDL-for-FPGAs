----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2024 08:13:25
-- Design Name: 
-- Module Name: DPE_Design - RTL
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DPE_Design is
    port(
        req : in std_logic_vector(11 downto 0);
        first : out std_logic_vector(3 downto 0);
        second : out std_logic_vector(3 downto 0)
    );
end DPE_Design;

architecture RTL of DPE_Design is
    --PE1 : Num1, y1; PE2 : Num2, y2
    -- first <= y1,  second <= y2
    -- Num2 modification: y1 ->  unsigned val -> integer; and passed onto srl
    signal Num1, Num2 : std_logic_vector(11 downto 0);
    signal y1, y2 : std_logic_vector(3 downto 0);
    signal usig_y : unsigned(3 downto 0);
    signal temp : std_logic_vector(11 downto 0) := "000000000001";
    signal pos : std_logic_vector(11 downto 0);
    signal index : integer := 0;
begin
    --Num1 <= req;
    --pos <= "000000000001";
    -- instantiate 12-4 PriorityEncoder
    PE1 : entity work.PR_ENCDR_12_4(RTL_pe_12_4)
        port map( Num => req, y => y1);
    
    usig_y <= unsigned(y1);
    index <= to_integer(usig_y - 1);
    pos <= not std_logic_vector(shift_left(to_unsigned(1, 12), index));
    Num2 <= req and pos;
    
    PE2 : entity work.PR_ENCDR_12_4(RTL_pe_12_4)
        port map(Num => Num2, y => y2);
    
    first <= y1;
    second <= y2;
    
end RTL;
