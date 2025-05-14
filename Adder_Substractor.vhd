----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Haren Daishika
-- 
-- Create Date: 05/04/2025 08:15:25 PM
-- Design Name: 4 bit Adder and Substractor
-- Module Name: Adder_Substractor - Behavioral
-- Project Name: Nanoprocessor Design Challenge
-- Target Devices:Xlinix Basys 3
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

entity Adder_Substractor is
PORT(
A: IN STD_LOGIC_VECTOR(3 downto 0);
B: IN STD_LOGIC_VECTOR(3 downto 0);
EN:IN STD_LOGIC; --This enable system decide whether use adder or substractor
V: OUT STD_LOGIC;--overflow bit
Ca_out:OUT STD_LOGIC;--carry bit
D: OUT STD_LOGIC_VECTOR(3 downto 0));

end Adder_Substractor;

architecture Behavioral of Adder_Substractor is

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

SIGNAL Y: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL C0,C1,C2,C3: STD_LOGIC;

begin
FA0:FA
port map(
A=>A(0),
B=>Y(0),
C_in=>EN,
S=>D(0),
C_out=>C0);

FA1:FA
port map(
A=>A(1),
B=>Y(1),
C_in=>C0,
S=>D(1),
C_out=>C1);

FA2:FA
port map(
A=>A(2),
B=>Y(2),
C_in=>C1,
S=>D(2),
C_out=>C2);

FA3:FA
port map(
A=>A(3),
B=>Y(3),
C_in=>C2,
S=>D(3),
C_out=>C3);

Ca_out<=C3;
Y(0)<=EN XOR B(0);
Y(1)<=EN XOR B(1);
Y(2)<=EN XOR B(2);
Y(3)<=EN XOR B(3);
V<=C2 XOR C3;




end Behavioral;
