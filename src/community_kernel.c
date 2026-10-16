#include <stdint.h>
typedef struct { uint64_t magic, fb; uint32_t width,height,pitch,pixelFormat; } BOOTINFO;
#if defined(__clang__) || defined(__GNUC__)
#define MSABI __attribute__((ms_abi))
#else
#define MSABI
#endif
__attribute__((noreturn)) void MSABI community_entry(BOOTINFO* b){
    if(b && b->magic==0x434F4D4D554E4954ULL && b->fb && b->width && b->height && b->pitch){
        volatile uint32_t* fb=(volatile uint32_t*)(uintptr_t)b->fb;
        uint32_t w=b->width, h=b->height, pitch=b->pitch;
        uint32_t bar=h>120?120:h;
        for(uint32_t y=0;y<bar;y++){
            for(uint32_t x=0;x<w;x++){
                uint8_t r=0,g=0,bl=0;
                if(y<bar/3){r=0x20;g=0xB0;bl=0x20;}
                else if(y<(bar*2)/3){r=0x20;g=0x60;bl=0xD0;}
                else {r=0xD0;g=0xB0;bl=0x20;}
                uint32_t px = (b->pixelFormat==1) ? ((uint32_t)bl<<16 | (uint32_t)g<<8 | r) : ((uint32_t)r<<16 | (uint32_t)g<<8 | bl);
                fb[(uint64_t)y*pitch+x]=px;
            }
        }
    }
    for(;;) __asm__ volatile("cli; hlt");
}
