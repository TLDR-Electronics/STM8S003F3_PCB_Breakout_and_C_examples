/******************************************************************************
* The MIT License (MIT)
* Copyright (c) 2020 Daniel Wood - Aardwolf Digital
*  Permission is hereby granted, free of charge, to any person obtaining a
*  copy of this software and associated documentation files (the "Software"),
*  to deal in the Software without restriction, including without limitation
*  the rights to use, copy, modify, merge, publish, distribute, sublicense,
*  and/or sell copies of the Software, and to permit persons to whom the
*  Software is furnished to do so, subject to the following conditions:
*
*  The above copyright notice and this permission notice shall be included in
*  all copies or substantial portions of the Software.
*
*  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
*  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
*  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
*  DEALINGS IN THE SOFTWARE.
******************************************************************************/

#ifndef _STM8S003X3_H
#define _STM8S003X3_H

/* Fixed-width Integers */
typedef   signed char     int8_t;
typedef   signed short    int16_t;
typedef   signed long     int32_t;
typedef unsigned char     uint8_t;
typedef unsigned short    uint16_t;
typedef unsigned long     uint32_t;

/** @brief Clock divider register */
#define CLK_CKDIVR    *(volatile unsigned char*) 0x50C6
#define CLK_CKDIVRbits (*(volatile clk_ckdivr_t*) 0x50C6)

/******************************************************************************
 * PORTS A to F Configuration
 *****************************************************************************/
#define PORTA   (*(volatile GPIO_t*) 0x5000)
#define PORTB   (*(volatile GPIO_t*) 0x5005)
#define PORTC   (*(volatile GPIO_t*) 0x500A)
#define PORTD   (*(volatile GPIO_t*) 0x500F)
#define PORTE   (*(volatile GPIO_t*) 0x5014)
#define PORTF   (*(volatile GPIO_t*) 0x5019)

/** @brief Used to access individual bits of an 8-bit integer */
typedef struct Bits
{
  uint8_t b0 :1;
  uint8_t b1 :1;
  uint8_t b2 :1;
  uint8_t b3 :1;
  uint8_t b4 :1;
  uint8_t b5 :1;
  uint8_t b6 :1;
  uint8_t b7 :1;
} bits_t;

typedef struct { /* GPIO Struct (GPIO_t) */
  union {
    /** @brief Data output latch register, ODR[7:0].
     *  @param 1 Output High
     *  @param 0 Output Low */ 
    uint8_t ODR;
    /** @brief Data output latch register (individual pin access).
     *  @param 1 Output High
     *  @param 0 Output Low */
    bits_t ODRbits;             
  };

  union {
    /** @brief Input pin value register, IDR[7:0]
     *  @param 1 High Logic Level
     *  @param 0 Low Logic Level */
    uint8_t IDR;  

    /** @brief Input pin value register (individual pin access)
     *  @param 1 High Logic Level
     *  @param 0 Low Logic Level */  
    bits_t IDRbits;            
  };

  union {
    /** @brief Data direction register, DDR[7:0]
     *  @param 0 Input Mode
     *  @param 1 Output Mode */
    uint8_t DDR;

    /** @brief Data direction register (individual pin access)
     *  @param 0 Input Mode
     *  @param 1 Output Mode */
    bits_t DDRbits;    
  };
  
  union {
    /** @brief Control register 1, , C1[7:0]
     *  @param 0 Floating Input [In input mode (DDR = 0)]
     *  @param 1 Input with Pull-Up [In input mode (DDR = 0)]
     *  @param 0 Pseudo Open Drain [In output mode (DDR = 1)]
     *  @param 1 Push-pull [In output mode (DDR = 1)] */
    uint8_t CR1;

    /** @brief Control register 1 (individual pin access)
     *  @param 0 Floating Input [In input mode (DDR = 0)]
     *  @param 1 Input with Pull-Up [In input mode (DDR = 0)]
     *  @param 0 Pseudo Open Drain [In output mode (DDR = 1)]
     *  @param 1 Push-pull [In output mode (DDR = 1)] */
    bits_t CR1bits;     
  };

  union {
    /** @brief Port control register 2 
     *  @param 0 External interrupt disabled [In input mode (DDR = 0)]
     *  @param 1 External interrupt enabled [In input mode (DDR = 0)]
     *  @param 0 Output speed up to 2 MHz [In output mode (DDR = 1)]
     *  @param 1 Output speed up to 10 MHz [In output mode (DDR = 1)] */
    uint8_t CR2;  

    /** @brief Port data direction register 2 (individual pin access)
     *  @param 0 External interrupt disabled [In input mode (DDR = 0)]
     *  @param 1 External interrupt enabled [In input mode (DDR = 0)]
     *  @param 0 Output speed up to 2 MHz [In output mode (DDR = 1)]
     *  @param 1 Output speed up to 10 MHz [In output mode (DDR = 1)] */
    bits_t CR2bits;           
  };

} GPIO_t;

enum ODR {
  ODR_OUTPUT_LOW = 0,
  ODR_OUTPUT_HIGH = 1
};

enum IDR {
  IDR_LOGIC_LOW = 0,
  IDR_LOGIC_HIGH = 1
};

enum DDR {
  DDR_INPUT_MODE = 0,
  DDR_OUTPUT_MODE = 1
};

enum CR1 {
  CR1_INPUT_FLOATING = 0,
  CR1_INPUT_PULLUP = 1,
  CR1_OUTPUT_OPEN_DRAIN = 0,
  CR1_OUTPUT_PUSH_PULL = 1
};

enum CR2 {
  CR2_INPUT_INTERRUPT_DISABLED = 0,
  CR2_INPUT_INTERRUPT_ENABLED = 1,
  CR2_OUTPUT_SPEED_2MHZ = 0,
  CR2_OUTPUT_SPEED_10MHZ = 1
};

/******************************************************************************
 * Clock Divider Register
 *****************************************************************************/
  typedef struct
  {
    /** @brief CPU clock prescaler, CPUDIV[2:0]
     *  @param 000 fCPU =fMASTER
     *  @param 001 fCPU =fMASTER/2
     *  @param 010 fCPU =fMASTER/4
     *  @param 011 fCPU =fMASTER/8
     *  @param 100 fCPU =fMASTER/16
     *  @param 101 fCPU =fMASTER/32
     *  @param 110 fCPU =fMASTER/64
     *  @param 111 fCPU =fMASTER/128 */
    uint8_t CPUDIV :3;

    /** @brief High speed internal clock prescaler, HSIDIV[1:0]
     *  @param 00 fHSI RC Output
     *  @param 01 fHSI RC Output/2
     *  @param 10 fHSI RC Output/4
     *  @param 11 fHSI RC Output/8 */
    uint8_t HSIDIV :2;
  } clk_ckdivr_t;

enum HSIDIV {
  HSIDIV_RC_16MHZ = 0,
  HSIDIV_RC_8MHZ,
  HSIDIV_RC_4MHZ,
  HSIDIV_RC_2MHZ,
  HSIDIV_RC_DEFAULT = 2
};

enum CPUDIV {
  CPUDIV_MASTER_1 = 0,
  CPUDIV_MASTER_2,
  CPUDIV_MASTER_4,
  CPUDIV_MASTER_8,
  CPUDIV_MASTER_16,
  CPUDIV_MASTER_32,
  CPUDIV_MASTER_64,
  CPUDIV_MASTER_128,
  CPUDIV_MATER_DEFAULT = 0
};

#endif