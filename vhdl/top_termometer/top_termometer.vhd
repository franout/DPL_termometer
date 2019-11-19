----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:01 11/19/2019 
-- Design Name: 
-- Module Name:    top_termomemter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_termometer is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           in_sensor : inout  STD_LOGIC;
           out_sensor : inout  STD_LOGIC;
           in_out_s : in  STD_LOGIC;
           lcd_enable : out  STD_LOGIC;
           lcd_rw : out  STD_LOGIC;
           lcd_rs : out  STD_LOGIC;
           ldc_data : out  STD_LOGIC_VECTOR (7 downto 0));
end top_termometer;

architecture structural of top_termometer is
 
 -- main control unit
 
 
 
 
 -- datapath ( interfaces have its own CU ) 
 -- computation 


-- termometer interfaces


-- lcd interfaces 




begin


-- interconnecting components



end structural;

