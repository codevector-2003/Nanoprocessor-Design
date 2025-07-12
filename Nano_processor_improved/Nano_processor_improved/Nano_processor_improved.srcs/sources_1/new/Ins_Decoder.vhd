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
  Ins :         IN STD_LOGIC_VECTOR(12 downto 0); --Instructions
  Jump :        IN STD_LOGIC_VECTOR( 3 downto 0);
  Register_EN : OUT STD_LOGIC_VECTOR(2 downto 0); --Register Enable
  Load_sel :    OUT STD_LOGIC_VECTOR(2 downto 0); -- Select the load
  I_value :     OUT STD_LOGIC_VECTOR(3 downto 0); --Immediate value
  Reg_A :       OUT STD_LOGIC_VECTOR(2 downto 0);
  Reg_B :       OUT STD_LOGIC_VECTOR(2 downto 0);
  Add_sub :     OUT STD_LOGIC;
  Jump_flag :   OUT STD_LOGIC;
  Address_J :   OUT STD_LOGIC_VECTOR(2 downto 0);
  Cmp_EN :      OUT STD_LOGIC;  -- Enable signal for Comparator
  Mul_EN :      OUT STD_LOGIC; -- Enable signal for Multiplier
  Sft_EN :      OUT STD_LOGIC; -- Enable signal for Bit Shifter
  Sft_Dir :     OUT STD_LOGIC; -- Shift Direction
  LU_EN :       OUT STD_LOGIC; -- Enable signal for Logical Unit
  LU_Op_Select :OUT STD_LOGIC_VECTOR(1 downto 0)-- Operation select for Logical Unit
    );
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
SIGNAL ADD, NEG, MOV, JZR, CMP, MUL, SFT, LOG :STD_LOGIC;

begin

Decoder_3_to_8_0 : Decoder_3_to_8
    Port map ( 
    I(0) => Ins(10),
    I(1) => Ins(11),
    I(2) => Ins(12),
    EN => '1',
    Y(0) => ADD,
    Y(1) => NEG,
    Y(2) => MOV,
    Y(3) => JZR,
    Y(4) => CMP,
    Y(5) => MUL,
    Y(6) => LOG,
    Y(7) => SFT );
    
Reg_A <= Ins(9 downto 7);
Reg_B <= Ins(6 downto 4);
Register_EN <= Ins(9 downto 7);
Add_sub <= NEG;
I_value <= Ins(3 downto 0);
Jump_flag <= JZR AND ( NOT(Jump(0) OR Jump(1) OR Jump(2) OR Jump(3)));
Address_J <= Ins(2 downto 0);
Load_Sel <= Ins(12 downto 10);
Cmp_EN <= CMP;
Mul_EN <= MUL;
Sft_EN <= SFT;
Sft_Dir <= Ins(2);
LU_EN <= LOG;
LU_Op_Select <= Ins(1 downto 0);

end Behavioral;
