// Alec Vercruysse
// avercruysse [at] hmc.edu
// 2021-04-22

#pragma once

void twi_init(void);
void tx_rx_switch_init();
void tx_mode();
void rx_mode();
/* void TWI0_Handler(void); */

void extraio_init(void);
void sync_handler(uint32_t a, uint32_t b);
void new_sync_handler(void);
void sync_init(void);

void restart_capture(void);
void tc_trigger_init(void);
void adc_Init(void);
/* void ADC_Handler(void); */

uint64_t delay_to_cycles(volatile uint32_t delay);
uint8_t byte_transfer(uint8_t read, volatile uint32_t* dest);


void pwm_Init(void);
void pwm_Update(uint16_t pwmPeriod, uint16_t pwmDutyCycle);
void start_pwm(void);
void stop_pwm(void);
void dacc_Init(void);
void dacc_write_channel(uint8_t channel, uint32_t value);

int main(void);
