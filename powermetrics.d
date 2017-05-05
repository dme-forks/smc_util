/*******************************************************************************
WHAT:    Read SMC keys that Apple's powermetrics tool uses. Requires OS X 10.10
RUN:     sudo dtrace -qCs powermetrics.d -c 'powermetrics --sampler smc -n 1'
DETAIL:  This lets us see what hardware components/functions they map to.
LICENSE: MIT
AUTHOR:  beltex <http://beltex.github.io>

REFERENCES:

- Advanced Mac OS X Programming: The Big Nerd Ranch Guide
- DTrace: Dynamic Tracing in Oracle Solaris, Mac OS X, and FreeBSD
- https://www.bignerdranch.com/blog/hooked-on-dtrace-part-1/
- http://dtrace.org/blogs/brendan/2011/02/11/dtrace-pid-provider-arguments/
*******************************************************************************/


/*
We need to define the SMCParamStruct here so we can cast the inputStruct arg
in IOConnectCallStructMethod() which is void and not defined in any public
headers. See link below for information about it.

https://github.com/beltex/SMCKit/blob/v0.0.13/SMCKit/SMC.swift#L450-468
*/

typedef struct SMCVersion {
    unsigned char  major;
    unsigned char  minor;
    unsigned char  build;
    unsigned char  reserved;
    unsigned short release;
} SMCVersion;

typedef struct SMCPLimitData {
    uint16_t version;
    uint16_t length;
    uint32_t cpuPLimit;
    uint32_t gpuPLimit;
    uint32_t memPLimit;
} SMCPLimitData;

typedef struct SMCKeyInfoData {
    uint32_t dataSize;
    uint32_t dataType;
    uint8_t  dataAttributes;
} SMCKeyInfoData;

typedef struct SMCParamStruct {
    uint32_t       key;
    SMCVersion     vers;
    SMCPLimitData  pLimitData;
    SMCKeyInfoData keyInfo;
	uint16_t padding;
    uint8_t        result;
    uint8_t        status;
    uint8_t        data8;
    uint32_t       data32;
    uint8_t        bytes[32];
} SMCParamStruct;


/*
Probe to detect when powermetrics makes a call to IOConnectCallStructMethod()

This is the main I/O Kit function call that is made to interface with the SMC.
Passes in a void pointer to an SMCParamStruct which contains the SMC key that is
to be read. See IOKitLib.h for function signature.
*/
pid$target::IOConnectCallStructMethod:entry
{
    /*
    Since DTrace executes in kernel-space, the void pointer we have (arg2) is to
    a user-space address. Thus, we use DTrace's copyin() to copy the data into
    kernel-space (DTrace scratch buffer), at which point we can cast it.
    */
    inputStruct = (struct SMCParamStruct *) copyin(arg2, sizeof(struct SMCParamStruct)); 

    /* Decode UInt32 key to human readable. SMC keys are 4 char constants */
    printf("Key: %c%c%c%c, io count %d, result %02x, status %02x, data8 %02x, data32 %08x, bytes[0:1] %02x %02x\n", 
			      inputStruct->key >> 24 & 0xff,
                              inputStruct->key >> 16 & 0xff,
                              inputStruct->key >>  8 & 0xff,
                              inputStruct->key       & 0xff,
				inputStruct->keyInfo.dataSize,
				inputStruct->result, inputStruct->status,
			      inputStruct->data8, inputStruct->data32,
				inputStruct->bytes[0],inputStruct->bytes[1]);
}
