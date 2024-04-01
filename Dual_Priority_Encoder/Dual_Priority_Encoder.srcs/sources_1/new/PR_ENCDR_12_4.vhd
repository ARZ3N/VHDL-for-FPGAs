----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2024 08:48:08
-- Design Name: 
-- Module Name: PR_ENCDR_12_4 - RTL_pe_12_4
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
use IEEE. NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PR_ENCDR_12_4 is
    port(
        Num : in std_logic_vector(11 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end PR_ENCDR_12_4;

architecture RTL_pe_12_4 of PR_ENCDR_12_4 is
    signal usig_out : unsigned(3 downto 0);
begin
    process(Num)
    begin
        if(Num(11) = '1') then
            usig_out <= to_unsigned(12, 4);
        elsif(Num(10) = '1') then
            usig_out <= to_unsigned(11, 4);
        elsif(Num(9) = '1') then
            usig_out <= to_unsigned(10, 4);
        elsif(Num(8) = '1') then
            usig_out <= to_unsigned(9, 4);
        elsif(Num(7) = '1') then
            usig_out <= to_unsigned(8, 4);
        elsif(Num(6) = '1') then
            usig_out <= to_unsigned(7, 4);
        elsif(Num(5) = '1') then
            usig_out <= to_unsigned(6, 4);
        elsif(Num(4) = '1') then
            usig_out <= to_unsigned(5, 4);
        elsif(Num(3) = '1') then
            usig_out <= to_unsigned(4, 4);
        elsif(Num(2) = '1') then
            usig_out <= to_unsigned(3, 4);
        elsif(Num(1) = '1') then
            usig_out <= to_unsigned(2, 4);
        elsif(Num(0) = '1') then
            usig_out <= to_unsigned(1, 4);
        else
            usig_out <= to_unsigned(0, 4);
        end if;
        
    end process;
    y <= std_logic_vector(usig_out);
end RTL_pe_12_4;
