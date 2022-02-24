#ifndef MYSSN_H
#define MYSSN_H

#include <stdint.h>



void send_task(void *data_send);

void recv_task(void *data, uint32_t len);



#endif /* MYSSN_H */
