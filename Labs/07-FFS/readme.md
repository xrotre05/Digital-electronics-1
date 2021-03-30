# 07-FFS

## 1. Preparation tasks

### D-type flip-flop

q<sub>n+1</sub> = d

| **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | Remember |
   | 0 | 1 | 0 | Remember |
   | 1 | 0 | 1 | Sample |
   | 1 | 1 | 1 | Sample |

###  JK-type flip-flop

q<sub>n+1</sub>=j/q<sub>n</sub> +/kq<sub>n</sub>

   | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 | 1 | 0 | 0 | Reset |
   | 0 | 1 | 1 | 0 | Reset |
   | 1 | 0 | 0 | 1 | Set |
   | 1 | 0 | 1 | 1 | Set |
   | 1 | 1 | 0 | 1 | Toggle |
   | 1 | 1 | 1 | 0 | Toggle |

###  T-type flip-flop

q<sub>n+1</sub>=t/q<sub>n</sub> +/tq<sub>n</sub>

   | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | No change |
   | 0 | 1 | 1 | No change |
   | 1 | 0 | 1 | Toggle |
   | 1 | 1 | 0 | Toggle |

## 2. D latch

### VHDL code of the process `p_d_latch `
```vhfl
 p_d_latch : process(en,d,arst)
        begin
            if (arst = '1') then
                q     <= '0';
                q_bar <= '1';    
            elsif (en = '1') then
                q       <= d;
                q_bar   <= not d;
            end if;
    end process p_d_latch;
```

### VHDL reset and stimulus processes from the testbench `tb_d_latch.vhd`

```vhdl
p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       
       s_en   <= '0';
       s_d    <= '0';
       s_arst <= '0';
       wait for 20 ns;
            
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       
       --test enable
       s_en   <= '1';
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       s_en   <= '0'; --enable deactivated
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       
       
       --test reset
       s_en   <= '1';
        wait for 20 ns;
       s_d    <= '1';
        wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       s_arst <= '1'; --reset active
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';
       wait for 20 ns;
       s_arst <= '0'; --reset deactive
       wait for 50 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;
```
### Screenshot with simulated time waveforms
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/d-latch.PNG "d-latch")

## 3. Flip-flops

### a) d_ff_arst

#### process `p_d_ff_arst`
```vhdl
p_d_ff_arst : process(clk,arst)
        begin
            if (arst = '1') then
                q     <= '0';
                q_bar <= '1';    
            elsif rising_edge(clk) then
                q       <= d;
                q_bar   <= not d;
            end if;
    end process p_d_ff_arst;
```
#### testbench
```vhdl
p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK / 2;
            s_clk <= '1';
            wait for c_CLK / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 300 ns;
        s_arst <= '1';                 -- Reset activated
        wait for 100 ns;
        s_arst <= '0';
        wait for 17 ns;
        s_arst <= '1';
        wait for 7 ns;
        s_arst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       

       s_d    <= '0';
       
       wait for 20 ns;
            
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;   --100ns
       
       
       
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns; -- 200 ns
       
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 70 ns;
       s_d    <= '0'; 
       wait for 20 ns; --350ns
       
       
       
       --test reset
       
        wait for 20 ns;
       s_d    <= '1';
        wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
      
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';
       wait for 20 ns;
       wait for 50 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;
   ```
#### Screenshot
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/d_ff_arst.PNG "d_ff_arst")


### b) d_ff_rst

#### process `p_d_ff_rst`
```vhdl
p_d_ff_rst : process(clk,rst)
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                    q     <= '0';
                    q_bar <= '1';    
                else
                    q       <= d;
                    q_bar   <= not d;
                end if;
            end if;
    end process p_d_ff_rst;
```
#### Testbench
```vhdl
p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK / 2;
            s_clk <= '1';
            wait for c_CLK / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 300 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 100 ns;
        s_rst <= '0';
        wait for 17 ns;
        s_rst <= '1';
        wait for 7 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       

       s_d    <= '0';
       
       wait for 20 ns;
            
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;   --100ns
       
       
       
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns; -- 200 ns
       
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 70 ns;
       s_d    <= '0'; 
       wait for 20 ns; --350ns
       
       
       
       --test reset
       
        wait for 20 ns;
       s_d    <= '1';
        wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
      
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';
       wait for 20 ns;
       wait for 50 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;

```
#### Screenshot
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/d_ff_rst.PNG "d_ff_rst")

### c) jk_ff_rst

#### process `p_jk_ff_rst`
```vhdl
p_jk_ff_rst : process(clk,rst)
        begin    
            if rising_edge(clk) then
                if (rst = '1') then
                    s_q       <= '0';
                    s_q_bar   <= '1';
                else
                    if (j = '0' and k = '0') then
                        s_q       <= s_q;
                        s_q_bar   <= s_q_bar;
                    elsif (j = '0' and k = '1') then 
                        s_q       <= '0';
                        s_q_bar   <= '1';
                    elsif (j = '1' and k = '0') then 
                        s_q       <= '1';
                        s_q_bar   <= '0';
                    else 
                        s_q       <= not s_q;
                        s_q_bar   <= not s_q_bar;     
                    end if;
                end if;
            end if;
    end process p_jk_ff_rst;

    q       <= s_q;
    q_bar   <= s_q_bar;
```
#### Testbench
```vhdl
 p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK / 2;
            s_clk <= '1';
            wait for c_CLK / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
         s_rst <= '0';
        wait for 300 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 100 ns;
        s_rst <= '0';
        wait for 17 ns;
        s_rst <= '1';
        wait for 7 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       

       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
            
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns; 
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;

```
#### Screenshot
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/jk_ff_rst.PNG "jk_ff_rst")

### d) t_ff_rst

#### process `p_t_ff_rst`
```vhdl
p_t_ff_rst : process(clk,rst)
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                    s_q     <= '0';
                    s_q_bar <= '1';    
                else
                    if (t = '1') then
                        s_q       <= not s_q;
                        s_q_bar   <= not s_q_bar;
                    else
                        s_q       <=  s_q;
                        s_q_bar   <=  s_q_bar; 
                    end if;
                end if;
            end if;
    end process p_t_ff_rst;

    q       <= s_q;
    q_bar   <= s_q_bar;
```
#### Testbench
```vhdl
p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK / 2;
            s_clk <= '1';
            wait for c_CLK / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 300 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 100 ns;
        s_rst <= '0';
        wait for 17 ns;
        s_rst <= '1';
        wait for 7 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       

       s_t    <= '0';
       
       wait for 20 ns;
            
       s_t    <= '1';  
       wait for 20 ns;  
       s_t    <= '0';
       wait for 20 ns;
       s_t    <= '1';  
       wait for 20 ns;  
       s_t    <= '0';
       wait for 20 ns;   --100ns
       
       
       
       wait for 20 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 20 ns;
       s_t    <= '0'; 
       wait for 20 ns; -- 200 ns
       
       wait for 20 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 70 ns;
       s_t    <= '0'; 
       wait for 20 ns; --350ns
       
       
       
       
       
        wait for 20 ns;
       s_t    <= '1';
        wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 100 ns; 
       s_t    <= '0'; 
       wait for 20 ns;
      
       wait for 20 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';
       wait for 20 ns;
       wait for 50 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 20 ns;
       s_t    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;
```
#### Screenshot
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/t_ff_rst.PNG "t_ff_rst")

## 4. Shift register
### Shift register schematic
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/t_ff_rst.PNG "t_ff_rst")
