################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/uart/fsl_adapter_uart.c 

OBJS += \
./component/uart/fsl_adapter_uart.o 

C_DEPS += \
./component/uart/fsl_adapter_uart.d 


# Each subdirectory must supply rules for building sources it contributes
component/uart/%.o: ../component/uart/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DFRDM_K64F -DFREEDOM -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSERIAL_PORT_TYPE_UART=1 -DSDK_OS_FREE_RTOS -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/board" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/source" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/mdio" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/phy" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/lwip/contrib/apps/tcpecho" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/lwip/port" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/lwip/src" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/lwip/src/include" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/drivers" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/utilities" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/device" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/component/uart" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/component/serial_manager" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/component/lists" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/CMSIS" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/freertos/freertos_kernel/include" -I"/Users/albertocon/Documents/MCUXpressoIDE_11.4.0_6237/workspace/frdmk64f_P1_lwip_tcpecho_freertos/freertos/freertos_kernel/portable/GCC/ARM_CM4F" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


