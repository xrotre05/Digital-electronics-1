# 8-Traffic_lights

## 1. Preparation tasks 

### State table

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) |
| **State**     | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B |
| **Output R**  | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `0` | `1` | `0` |

### Figure with connection of RGB LEDs on Nexys A7 board
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/08-Traffic_lights/Images/RGB.PNG "RGB")


### Table with connection of RGB LEDs on Nexys A7 board
| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
| LD17 | N16, R11, G14 | `1,0,0` | `1,1,0` | `0,1,0` |

## 2. Traffic light controller

### State diagram
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/08-Traffic_lights/Images/State_diagram.jpg "State diagram")

### VHDL code of sequential process `p_traffic_fsm`


### VHDL code of combinatorial process `p_output_fsm`


### Screenshots of the simulation
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/08-Traffic_lights/Images/sim1.PNG "sim1")
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/08-Traffic_lights/Images/sim2.PNG "sim2")
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/08-Traffic_lights/Images/sim3.PNG "sim3")
