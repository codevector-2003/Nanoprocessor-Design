----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2025 06:57:15 PM
-- Design Name: 
-- Module Name: MUX_2_way_4_bits - Behavioral
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

entity MUX_2_way_4_bits is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_way_4_bits;

architecture Behavioral of MUX_2_way_4_bits is
component Mux_8_to_1
port(
    D : in STD_LOGIC_VECTOR (7 downto 0);
    EN : in STD_LOGIC;
    S : in STD_LOGIC_VECTOR (2 downto 0);
    Y : out STD_LOGIC
);
end component;

signal D : std_logic_vector(7 downto 0);
signal S0,S1,S2,S3 :std_logic_vector(2 downto 0);

begin
--Mapping A and B into D[0] to D[7]
   D(0) <= A(0);
   D(1) <= A(1);
   D(2) <= A(2);
   D(3) <= A(3);
   D(4) <= B(0);
   D(5) <= B(1);
   D(6) <= B(2);
   D(7) <= B(3);
   
   S0 <= Sel & "00"; -- selects A(0) or B(0)
   S1 <= Sel & "01"; -- selects A(1) or B(1)
   S2 <= Sel & "10"; -- selects A(2) or B(2)
   S3 <= Sel & "11"; -- selects A(3) or B(3)
   
   MUX0: Mux_8_to_1 
   port map(
       D => D, 
       EN => EN, 
       S => S0,--Declare S0 and map it into S(3 bit) selector 
       Y => Y(0)--Mapping MUX0's output Y into 2 way 4 bit mux's Y(0) output
   );
   MUX1: Mux_8_to_1 port map(D => D, EN => EN, S => S1, Y => Y(1));
   MUX2: Mux_8_to_1 port map(D => D, EN => EN, S => S2, Y => Y(2));
   MUX3: Mux_8_to_1 port map(D => D, EN => EN, S => S3, Y => Y(3));

end Behavioral;
