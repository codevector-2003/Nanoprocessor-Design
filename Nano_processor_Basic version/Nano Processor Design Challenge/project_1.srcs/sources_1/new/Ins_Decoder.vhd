----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 08:53:32 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
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

entity Ins_Decoder is
  Port ( 
  Ins :         IN STD_LOGIC_VECTOR(11 downto 0); --Instructions
  Jump :        IN STD_LOGIC_VECTOR( 3 downto 0);
  Register_EN : OUT STD_LOGIC_VECTOR(2 downto 0); --Register Enable
  Load_sel :    OUT STD_LOGIC;                     -- Select the load
  I_value :     OUT STD_LOGIC_VECTOR(3 downto 0); --Immediate value
  Reg_A :       OUT STD_LOGIC_VECTOR(2 downto 0);
  Reg_B :       OUT STD_LOGIC_VECTOR(2 downto 0);
  Add_sub :     OUT STD_LOGIC;
  Jump_flag :   OUT STD_LOGIC;
  Address_J :   OUT STD_LOGIC_VECTOR(2 downto 0)
    );
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is

component Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
SIGNAL ADD, NEG, MOV, JZR :STD_LOGIC;

begin

Decoder_2_to_4_0 : Decoder_2_to_4
    Port map ( I(0) => Ins(10),
    I(1) => Ins(11),
    EN => '1',
    Y(0) => ADD,
    Y(1) => NEG,
    Y(2) => MOV,
    Y(3) => JZR );
    
Reg_A <= Ins(9 downto 7);
Reg_B <= Ins(6 downto 4);
Register_EN <= Ins(9 downto 7);
Add_sub <= NEG;
I_value <= Ins(3 downto 0);
Jump_flag <= JZR AND ( NOT(Jump(0) OR Jump(1) OR Jump(2) OR Jump(3)));
Address_J <= Ins(2 downto 0);
Load_Sel <= MOV;


end Behavioral;
