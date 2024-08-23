#include <plugin.h>

/*
 * Return the name of a Catalina plugin type:
 */
char *_plugin_name(int type) {
   switch (type) {
      case LMM_VMM  : return "Kernel";
      case LMM_HMI  : return "HMI";
      case LMM_LIB  : return "Library";
      case LMM_FLA  : return "Float_A";
      case LMM_FLB  : return "Float_B";
      case LMM_RTC  : return "Real-Time Clock";
      case LMM_FIL  : return "SD File System";
      case LMM_SIO  : return "Serial I/O";
      case LMM_DUM  : return "Dummy";
      case LMM_CGI  : return "Graphics";
      case LMM_KBD  : return "Keyboard";
      case LMM_SCR  : return "Screen";
      case LMM_MOU  : return "Mouse";
      case LMM_PRX  : return "Proxy";
      case LMM_GAM  : return "Gamepad";
      case LMM_SND  : return "Sound";
      case LMM_ADC  : return "A/D Converter";
      case LMM_S4   : return "4 Port Serial";
      case LMM_TTY  : return "Full Duplex Serial";
      case LMM_VGI  : return "Virtual Graphics";
      case LMM_VDB  : return "Virtual Double Buffer";
      case LMM_SPI  : return "SPI/I2C";
      case LMM_FLC  : return "Float_C";
      case LMM_S2A  : return "2 Port Serial A";
      case LMM_S2B  : return "2 Port Serial B";
      case LMM_S8A  : return "8 Port Serial A";
      case LMM_HYP  : return "HyperRam/HyperFlash";
      case LMM_SM1  : return "SRAM Memory (8 Bit)";
      case LMM_PM1  : return "PSRAM Memory (16 Bit)";
      case LMM_XCH  : return "XMM Cache";
      case LMM_STO  : return "CogStore";
      case LMM_P2P  : return "P2P Bus";
      case LMM_RND  : return "Random Number Generator";
      case LMM_SVR  : return "C/Lua Server";
      case LMM_NUL  : return "None";
      default       : return "Unknown";
   }
}
