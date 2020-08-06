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

#include "stm8s003x3.h"

#define LED_PORT PORTC
#define LED_PIN  b3

void main () 
{
  CLK_CKDIVRbits.HSIDIV = HSIDIV_RC_2MHZ;
  /* CPU speed 2MHz / 128 = 15.625 kHz */
  CLK_CKDIVRbits.CPUDIV = CPUDIV_MASTER_128; 

  LED_PORT.DDRbits.LED_PIN = DDR_OUTPUT_MODE;
  LED_PORT.CR1bits.LED_PIN = CR1_OUTPUT_PUSH_PULL;
  LED_PORT.CR2bits.LED_PIN = CR2_OUTPUT_SPEED_2MHZ;
  LED_PORT.ODRbits.LED_PIN = ODR_OUTPUT_HIGH ;

  while(1)
  {
    LED_PORT.ODRbits.LED_PIN ^= 1;

    for(uint16_t i = 0; i < 1000; i++) {

    }
  }
}