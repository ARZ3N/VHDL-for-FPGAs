----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2024 06:30:59
-- Design Name: 
-- Module Name: Adder_N - RTL_adder_n
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

entity Adder_N is
    generic(N : integer := 4);
    port(
        a, b : in std_logic_vector(N-1 downto 0);
        cout : out std_logic;
        sum : out std_logic_vector(N-1 downto 0)        
    );
end Adder_N;

architecture RTL_adder_n of Adder_N is
    signal usig_a, usig_b, usig_sum : unsigned(N downto 0);
    
begin
    usig_a <= unsigned('0' & a);
    usig_b <= unsigned('0' & b);
    usig_sum <= usig_a + usig_b;
    sum <= std_logic_vector(usig_sum(N-1 downto 0));
    cout <= usig_sum(N);
end RTL_adder_n;
