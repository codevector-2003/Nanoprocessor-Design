----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 12:19:49 AM
-- Design Name: 
-- Module Name: T_bit_Adder - Behavioral
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

entity T_bit_Adder is
    Port (
        A      : in  STD_LOGIC_VECTOR(2 downto 0);
        B      : in  STD_LOGIC_VECTOR(2 downto 0);
        Sum    : out STD_LOGIC_VECTOR(2 downto 0);
        Carry  : out STD_LOGIC              -- Final carry-out
    );
end T_bit_Adder;

architecture Behavioral of T_bit_Adder is

    component FA
        Port (
            A      : in  STD_LOGIC;
            B      : in  STD_LOGIC;
            C_in   : in  STD_LOGIC;
            C_out  : out STD_LOGIC;
            S      : out STD_LOGIC
        );
    end component;

    signal C0, C1 : STD_LOGIC;

begin

    -- LSB full adder: no carry-in (set to '0')
    FA0: FA
        port map (
            A      => A(0),
            B      => B(0),
            C_in   => '0',
            S      => Sum(0),
            C_out  => C0
        );

    -- Middle bit
    FA1: FA
        port map (
            A      => A(1),
            B      => B(1),
            C_in   => C0,
            S      => Sum(1),
            C_out  => C1
        );

    -- MSB
    FA2: FA
        port map (
            A      => A(2),
            B      => B(2),
            C_in   => C1,
            S      => Sum(2),
            C_out  => Carry
        );

end Behavioral;
