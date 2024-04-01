----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2024 01:39:15
-- Design Name: 
-- Module Name: barrelShift_8 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity barrelShift_8 is
    port(
        Num : in std_logic_vector(7 downto 0);
        amt : in std_logic_vector(2 downto 0);
        sel : in std_logic;
        Shft_Num : out std_logic_vector(7 downto 0)
    );
end barrelShift_8;

architecture arch_simple of barrelShift_8 is
    signal yR, s0R, s1R, yL, s0L, s1L : std_logic_vector(7 downto 0);
    begin
        -- shift Right circuit
        s0R <= Num(0) & Num(7 downto 1) when amt(0) = '1' else Num;
        s1R <= s0R(1 downto 0) & s0R(7 downto 2) when amt(1) = '1' else s0R;
        yR <= s1R(3 downto 0) & s1R(7 downto 4) when amt(2) = '1' else s1R;
        -- Shift Left circuit
        s0L <= Num(6 downto 0) & Num(7) when amt(0) = '1' else Num;
        s1L <= s0L(5 downto 0) & s0L(7 downto 6) when amt(1) = '1' else s0L;
        yL <= s1L(3 downto 0) & s0L(7 downto 4) when amt(2) = '1' else s1L;
        -- 2-to-1 MUX
        with sel select
            Shft_Num <= yR when '0',
                        yL when others;
end arch_simple;
