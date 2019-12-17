library ieee;
use ieee.std_logic_1164.all;

entity decode_tb is

end entity;

architecture tb_arc of decode_tb is
	component decode is
		port(reset		 : in  std_logic;
			clk 		 : in  std_logic;
			Din  		 : in  std_logic;
			Dout 		 : out  std_logic_vector(8 downto 0));
	end component;
	
	signal reset_tb: std_logic;
	signal clk_tb  : std_logic:='0';
	signal Din_tb  : std_logic;
	signal Dout_tb : std_logic_vector(8 downto 0);

begin
	decode_com: component decode
		port map(reset=>reset_tb,clk=>clk_tb,Din=>Din_tb,Dout=>Dout_tb);
		
	clk_tb<= not clk_tb after 5 ns;
	
	reset_tb <= '1',
				'0' after 100 ns,
				'1' after 200 ns;
				
	Din_tb   <= '0',
				'1' after 205 ns,--1
				'0' after 215 ns,
				'1' after 225 ns,--1
				'0' after 235 ns,
				'1' after 245 ns,--1
				'0' after 255 ns,
				'1' after 265 ns,--1
				'0' after 275 ns,
				'1' after 285 ns,--1
				'0' after 295 ns,
				'1' after 305 ns,--1
				'0' after 315 ns,
				'0' after 325 ns,--0   
				'1' after 335 ns,
				'1' after 345 ns,--1 ,8 start transfer data
				'0' after 355 ns,
				'1' after 365 ns,--1,7
				'0' after 375 ns,
				'0' after 385 ns,--0,6
				'1' after 395 ns,
				'0' after 405 ns,--0,5
				'1' after 415 ns,
				'0' after 425 ns,--0,4
				'1' after 435 ns,
				'0' after 445 ns,--0,3
				'1' after 455 ns,
				'1' after 465 ns,--1,2
				'0' after 475 ns,
				'0' after 485 ns,--0,1
				'1' after 495 ns,
				'1' after 505 ns,--1,0
				'0' after 515 ns,
				'0' after 525 ns,--stop    
				'1' after 535 ns,--detect initial seq
				'1' after 545 ns,--1 
				'0' after 555 ns,
				'1' after 565 ns,--1
				'0' after 575 ns,
				'0' after 585 ns,--0
				'1' after 595 ns,
				'1' after 605 ns,--1
				'0' after 615 ns,
				'1' after 625 ns,--1
				'0' after 635 ns,
				'1' after 645 ns,--1
				'0' after 655 ns,
				'0' after 665 ns,--0
				'1' after 675 ns,
				'1' after 685 ns,--1, 8 start record
				'0' after 695 ns;
				
end tb_arc;
				
				
				
				