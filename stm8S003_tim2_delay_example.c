/******************************************************************************
* @file    stm8S003_tim2_delay_example.c
* @author  Daniel Wood - github.com/aardwolfDigital
* @brief   Timer 2 DelayMs and DelayUs example for the STM8S003F3. 
*          Using the SDCC, or the IAR compiler. Self contained within one
*          C file.
*
******************************************************************************
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

/******************************************************************************
 * Definitions
 *****************************************************************************/
#define __at(x) ( *(volatile uint8_t*) (x) )

/** Register locations found in the STM8S003F3 datasheet (DS7147) 
 *  register map */

#define CLK_CKDIVR  __at(0x50C6) /* Clock divider register */

#define PORTC_ODR   __at(0x500A) /* Port C data output latch register */
#define PORTC_DDR   __at(0x500C) /* Port C data direction register */
#define PORTC_CR1   __at(0x500D) /* Port C control register 1 */
#define PORTC_CR2   __at(0x500E) /* Port C control register 2 */

#define TIM2_CR1    __at(0x5300) /* TIM2 control register 1 */
#define TIM2_SR1    __at(0x5304) /* TIM2 status register 1 */
#define TIM2_PSCR   __at(0x530E) /* TIM2 prescaler register */
#define TIM2_ARRH   __at(0x530F) /* TIM2 auto-reload register high 0xFF */
#define TIM2_ARRL   __at(0x5310) /* TIM2 auto-reload register low 0xFF */

#define LED_PIN     8   /* LED Pin 3 */

/******************************************************************************
 * Fixed width integers
 *****************************************************************************/
typedef unsigned char     uint8_t;
typedef unsigned short    uint16_t;
typedef unsigned long     uint32_t;

/******************************************************************************
 * Function Prototypes
 *****************************************************************************/
void SetupLEDPort(void);
void DelayMs(const uint16_t preload_value);
void _delay_us(const uint16_t preload_value);

/******************************************************************************
 * Local Functions
 *****************************************************************************/
void SetupLEDPort(void)
{
  PORTC_ODR |= LED_PIN;   /* Output Pin Level High (LED OFF) */
  PORTC_DDR |= LED_PIN;   /* Output Mode */
  PORTC_CR1 |= LED_PIN;   /* Push-Pull Output */
  PORTC_CR2 = 0;          /* Low speed output (2 MHz) */
}

void DelayMs(const uint16_t preload_value)
{
  uint8_t arrh = (preload_value >> 8); /* Higher byte will be loaded in ARRH */
  uint8_t arrl = preload_value & 0xFF; /* Lower byte will be loaded in ARRL */

  TIM2_PSCR = 14;         /* Prescale set to 2^14 or 16384 */
  TIM2_ARRH = arrh;       /* Set High Auto-Reload Value */
  TIM2_ARRL = arrl;       /* Set Low Auto-Reload Value */
  TIM2_SR1 &= 0;          /* Reset the Update Interrupt Flag (UIF) */
  TIM2_CR1  = 1;          /* Enable Counter enable bit (CEN) */
  
  while((TIM2_SR1 & 0x01) == 0) /* Wait for Update Interrupt Flag to set */ 
  {
  }
  
  TIM2_CR1  = 0;          /* Disable Counter enable bit (CEN) */

}

void DelayUs(const uint16_t preload_value)
{  
  uint8_t arrh = (preload_value >> 8); /* Higher byte will be loaded in ARRH */
  uint8_t arrl = preload_value & 0xFF; /* Lower byte will be loaded in ARRL */

  TIM2_PSCR = 4;          /* Prescale set to 2^4 or 16 */
  TIM2_ARRH = arrh;       /* Set High Auto-Reload Value */
  TIM2_ARRL = arrl;       /* Set Low Auto-Reload Value */
  TIM2_SR1 &= 0;          /* Reset the Update Interrupt Flag (UIF) */
  TIM2_CR1  = 1;          /* Enable Counter enable bit (CEN) */

  while((TIM2_SR1 & 0x01) == 0) /* Wait for Update Interrupt Flag to set */
  {
  }

  TIM2_CR1  = 0;          /* Disable Counter enable bit (CEN) */
}

/******************************************************************************
 * Main Program
 *****************************************************************************/

void main () 
{
  CLK_CKDIVR = 0; /* Do not prescale HSIDIV or CPUDIV, device speed = 16 MHz */
  
  SetupLEDPort();

  while(1)
  {
    PORTC_ODR = (~PORTC_ODR ) & LED_PIN; /* Toggle LED Pin State */
    DelayMs(500);
  }
}

/** To calculate 1ms TIM2 Period with a 16MHz clock speed
 *  fOUT = fOSC / ( PSCR * ARR )
 * 
 *  Where:
 *  - fOUT = Period (Hz)
 *  - fOSC = Clock Frequency (Hz)
 *  - PSCR = Timer 2 Prescale Value
 *  - ARR  = Auto-reload register 
 *  
 *  fOUT = 16MHz / ( 16384 * 1 )
 *  fOUT = 976Hz, or 1.024mS  (Close enough ¯\_(ツ)_/¯ )
 * 
 *  To calculate 1uS TIM2 Period with a 16MHz clock speed
 *  
 *  fOUT = 16MHz / ( 16 * 1 )
 *  fOUT = 1MHz, or 1uS
 * 
 *  NOTE: DelayUs and DelayMs functions will need to be modified if 
 *        the clock settings change
 */