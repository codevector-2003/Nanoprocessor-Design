----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:59:54 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
  Port (
  reg_en : IN STD_LOGIC_VECTOR(2 downto 0); --select the register
  val_in : IN STD_LOGIC_VECTOR(3 downto 0); -- data for registers
  clk_in : IN STD_LOGIC; --input clock signal
  
  --out put of data fropm registers
  R_0 : out STD_LOGIC_VECTOR (3 downto 0);
  R_1 : out STD_LOGIC_VECTOR (3 downto 0);
  R_2 : out STD_LOGIC_VECTOR (3 downto 0);
  R_3 : out STD_LOGIC_VECTOR (3 downto 0);
  R_4 : out STD_LOGIC_VECTOR (3 downto 0);
  R_5 : out STD_LOGIC_VECTOR (3 downto 0);
  R_6 : out STD_LOGIC_VECTOR (3 downto 0);
  R_7 : out STD_LOGIC_VECTOR (3 downto 0)
   );
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Decoder_3_to_8
    port(
    I: in STD_LOGIC_VECTOR(2 downto 0);
    EN: in STD_LOGIC;
    Y: out STD_LOGIC_VECTOR(7 downto 0)
     );
end component;

component Reg
     Port ( D   : in  STD_LOGIC_VECTOR (3 downto 0);
     En  : in  STD_LOGIC; --Enable Signal
     Clk : in  STD_LOGIC; --Clock Signal
     Q   : out STD_LOGIC_VECTOR (3 downto 0):="0000" 
     ); 
end component;

SIGNAL D : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL E : STD_LOGIC := '1';
     
begin

Decoder_3_to_8_0 : Decoder_3_to_8
PORT MAP(
    I => reg_en,
    EN => E,
    Y => D
    );
    
Reg_0 : Reg
PORT MAP (
    EN => '0',
    D =>"0000" ,
    Q => R_0,
    Clk => Clk_in
    );    
    
Reg_1 : Reg
PORT MAP (
    EN => D(1),
    D =>val_in ,
    Q => R_1,
    Clk => Clk_in
    ); 
    
Reg_2 : Reg
PORT MAP (
    EN => D(2),
    D =>val_in ,
    Q => R_2,
    Clk => Clk_in
    ); 
    
Reg_3 : Reg
PORT MAP (
    EN => D(3),
    D =>val_in ,
    Q => R_3,
    Clk => Clk_in
    ); 
    
Reg_4 : Reg
PORT MAP (
    EN => D(4),
    D =>val_in ,
    Q => R_4,
    Clk => Clk_in
    );
    
Reg_5 : Reg
PORT MAP (
    EN => D(5),
    D =>val_in ,
    Q => R_5,
    Clk => Clk_in
    ); 
    
Reg_6 : Reg
PORT MAP (
    EN => D(6),
    D =>val_in ,
    Q => R_6,
    Clk => Clk_in
    );

Reg_7 : Reg
PORT MAP (
    EN => D(7),
    D =>val_in ,
    Q => R_7,
    Clk => Clk_in
    ); 
    
  
end Behavioral;
