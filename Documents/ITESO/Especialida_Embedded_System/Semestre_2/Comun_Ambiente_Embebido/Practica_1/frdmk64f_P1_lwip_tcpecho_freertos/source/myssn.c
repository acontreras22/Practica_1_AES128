
#include "myssn.h"
#include <string.h>
#include <stdio.h>
#include "aes.h"
#include "fsl_crc.h"

#define checksum 4
uint8_t key[] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06 };
uint8_t iv[]  = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

static void InitCrc32(CRC_Type *base, uint32_t seed)
{
    crc_config_t config;

    config.polynomial         = 0x04C11DB7U;
    config.seed               = seed;
    config.reflectIn          = true;
    config.reflectOut         = true;
    config.complementChecksum = true;
    config.crcBits            = kCrcBits32;
    config.crcResult          = kCrcFinalChecksum;
    CRC_Init(base, &config);
}

void send_task(void *data_send){
	struct AES_ctx ctx;
	uint8_t padded_msg[512] = {0};
	size_t len_data,padded_len;
	//	CRC32
	CRC_Type *base = CRC0;
	uint32_t checksum32;

    InitCrc32(CRC0, 0xFFFFFFFFU); // inicializamos el Crc32 y el aes
	AES_init_ctx_iv(&ctx, key, iv);

	len_data = strlen(data_send); // le pasamos la longitud del dato
	padded_len = len_data + (16 - (len_data%16) ); // checamos que la longitud sea multiplo de 16
	AES_CBC_encrypt_buffer(&ctx,data_send , padded_len); // encriptamos el mensaje
	memcpy(padded_msg, data_send, padded_len);// ya encriptado pasamos el mensaje a un array

	CRC_WriteData(base, data_send, padded_len);// hacemos el checksum

	printf("Calculated CRC to send 0x%x\r\n", CRC_Get32bitResult(base));
	checksum32 = CRC_Get32bitResult(base);// imprimimos el checksum, lo pasamos a una variable

	data_send = data_send +checksum32; // le agregamos el checksum a al dato ya encriptado

	printf("\r\nEncrypted: \r\n");
	// imprimimos el mensaje ya encriptado
	for(int i=0; i<padded_len; i++) {
		printf("0x%02x,", padded_msg[i]);
	}


}

void recv_task(void *data, uint32_t len){

	struct AES_ctx ctx;
	uint8_t padded_msg[512] = {0};
	//	CRC32
	CRC_Type *base = CRC0;
	uint32_t checksum32;

	memcpy(padded_msg, data, len-checksum);//pasamos datos a array

	printf("\r\nEncrypted Message arrived : \r\n");
 	for(int i=0; i<len-checksum ; i++) {
 		printf("0x%02x,", padded_msg[i]);
 	}


 	InitCrc32(CRC0, 0xFFFFFFFFU);// inicializamos Crc32
 	checksum32 = *(uint32_t *)(data + len - checksum); //le pasamos a checksum los ultimos 4 datos de la trama recivida
 	printf("\r\nChecksum32 = 0x%x\n",checksum32);

 	CRC_WriteData(base, data, (len - checksum)); // le pasamos a base el checksum

 	printf("Calculated CRC Recv = 0x%x\r\n", CRC_Get32bitResult(base));

 	if(checksum32 == CRC_Get32bitResult(base)){//checamos si no se perdieron datos

		AES_init_ctx_iv(&ctx, key, iv); //se inicializa aes

		AES_CBC_decrypt_buffer(&ctx, data, (len - checksum)); // desencriptamos el dato

		memcpy(padded_msg, data, len - checksum);//le pasamos el dato a un array

		printf("\r\nDecrypted: %s\n", padded_msg); // imprimimos el mensaje
 	}else{
 		printf("\r\n Error Checksum32 %s\n");
 	}

}
