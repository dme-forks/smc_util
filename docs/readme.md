# List of known SMC keys

For convenience, I moved this list over from https://app.assembla.com/spaces/fakesmc/wiki

| KEY | TYPE | SIZE |  ATTRIBUTES  | DESCRIPTION  |
|-----|------|------|--------------|------------- |
|#KEY | `ui32` |  4  | K_CONST       | Number of Keys  |
|+LKS | flag |  1  | K_FUNC_R      | Returns whether or not lock bits are set.  Returns 3 bit value, where  each bit represents one of the three lock bit regions.  1 => set.  |
|AL!  | ui8  |  1  | K_VAR_RW      | Each "1" bit in gui8ALSForced indicates that a certain writable ALS variable has been overridden (i.e., forced) by the host OS or host diagnostics, and that variable should not be written by the SMC again until the applicable bit is cleared in gui8ALSForced. Currently, the used bits are: <ul><li>Bit 0 protects gui16ALSScale<li>Bit 1 protects ui16Chan0 and ui16Chan1 of aalsvALSData<li>Bit 2 protects gui16ALSLux<li>Bit 3 protects fHighGain of aalsvALSData<li>Bit 4 protects gai16ALSTemp[MAX_ALS_SENSORS]</ul> All other bits are reserved and should be cleared to 0.  |
|ALA0 | {ala |     | K_VAR_ATOM_RW | ALS analog lux calculation information  |
|ALA1 | {ala |     | K_VAR_ATOM_RW | ALS analog lux calculation information  |
|ALA2 | {ala |     | K_VAR_ATOM_RW | ALS analog lux calculation information  |
|ALA3 | {ala |     | K_VAR_ATOM_RW | ALS analog lux calculation information  |
|ALA4 | {ala |     | K_VAR_ATOM_RW | ALS analog lux calculation information  |
|ALA5 | {ala |     | K_VAR_ATOM_RW | ALS analog lux calculation information  |
|ALAT | {alt |     | K_VAR_ATOM_RW | analog lux calculation thresholds  |
|ALI0 | {ali |     | K_CONST       | ALS Sensor 0 Info  |
|ALI1 | {ali |     | K_CONST       | ALS Sensor 1 Info  |
|ALRV | ui16 |  2  | K_CONST       | ALS/SIL version ID for the application program interface  |
|ALSC | {alc |     | K_VAR_ATOM_RW | ALS Configuration (some fields of which are used by the SIL on both ALS and non-ALS systems)  |
|ALSF | fp1f |  2  | K_VAR_ATOM_RW | ALS Scale Factor for SIL in 1.15 fixed-point representation  |
|ALSL | ui16 |  2  | K_VAR_ATOM_RW | Average ALS Ambient Light Reading in Lux  |
|ALT0 | ui16 |  2  | K_VAR_ATOM_RW | ALS Ambient Light Sensor Temperature for sensor 0 (deg C, FP16.0) |
|ALT1 | ui16 |  2  | K_VAR_ATOM_RW | ALS Ambient Light Sensor Temperature for sensor 1 (deg C, FP16.0) |
|ALTH | {alr |     | K_VAR_ATOM_RW | ALS Ambient Light Sensor Thermal Coefficient and baseline temperature |
|ALV0 | {alv |     | K_VAR_ATOM_RW | Latest ambient light reading from sensor 0 |
|ALV1 | {alv |     | K_VAR_ATOM_RW | Latest ambient light reading from sensor 1 |
|AUPO | ui8  |  1  | K_VAR_ATOM_RW | Auto Power-on key.  If set to 1, system will be automatically powered on by SMC after next transition to S5/G3HOT. |
|BATP | flag |  1  | K_VAR_R       | System currently being powered by battery. Used by FW TDM. Needed on all platforms. |
|BNum | ui8  |  1  | K_VAR_R       | Maximum number of supported batteries. Architecturally visiable key used by EFIUtil. Needed on all platforms. |
|BSIn | ui8  |  1  | K_VAR_R       | Battery System info byte. BSIn[7:0]<ul><li> 0=Charging<li> 1=AC present<li> 2=AC presence changed<li> 3=OS Stop Charge<li> 4=OS Calibration Req<li> 5=BatteryQueryInProgress<li> 6=batOK<li> 7=adcInProgress</ul> Architecturally visiable key used by EFIUtil. Needed on all platforms. |
|CLKT | ui32 |  4  | K_FUNC_RW     |  SMC local time in seconds since midnight, Used to control SIL brightness on some systems based on time of day. |
|CRCB | ui32 |  4  | K_VAR_R       | Returns a CRC32 value representing all of UserBootMAT. |
|CRCU | ui32 |  4  | K_FUNC_R      | Generates a CRC32 value representing all of UserMAT. |
|DPLM | {lim |     | KPRIV_FUNC_W  | Tests Plimit plumbing from SMC to OS. 3 bytes input are Cpu Plimit, Gpu Plimit, Mem Plimit. |
|EPCA | ui32 |  4  | K_CONST       | EPM CV Start Address |
|EPCF | flag |  1  | K_FUNC_R      | EPM CV Flash Status 1=flashed |
|EPCI | ui32 |  4  | K_VAR_R       | EPM CV Configuration ID |
|EPCV | ui16 |  2  | K_VAR_R       | EPM CV Configuration Version |
|EPMA | ch8* |     | K_FUNC_R      | EPM Meta Table Address First set EPMI and then read EPMA |
|EPMI | ui8  |  1  | K_VAR_ATOM_RW | EPM Meta Table Index First set EPMI and then read EPMA |
|EPUA | ui32 |  4  | K_CONST       | EPM UV Start Address |
|EPUF | flag |  1  | K_FUNC_R      | EPM UV Flash Status. 1=flashed |
|EPUI | ui32 |  4  | K_VAR_R       | EPM UV Configuration ID |
|EPUV | ui16 |  2  | K_VAR_R       | EPM UV Configuration Version |
|EVCT | ui16 |  2  | K_FUNC_R      | Event Trace Buffer. Returns a 2 byte value. The first byte is the number of events that have been put into the trace buffer since the last time this key was read and the second is the index into the buffer for the next event to be written.  If they are not the same, then the trace buffer has been overwritten and more then 16 events have occured since the last time it was read |
|EVMD | ui32 |  4  | K_FUNC_W      | Event Mode. Used for debug to determine if we should reset SMC or jump into flasher on a detected SMC health check. If key is written to a value of 0x87126534, then we will jump into the flasher on any SMC health check. |
|EVRD | ch8* |     | K_FUNC_R      |  Event Trace Buffer Read. 32 byte read from event trace buffer. Issue key read 4 times to read entire event trace buffer |
|F0Ac | fpe2 |  2  | K_VAR_ATOM_RW | Fan0 Actual RPM, DIAG_LOG |
|F0ID | {fds |     | K_CONST       | Fan0 Description |
|F0Mn | fpe2 |  2  | K_VAR_ATOM_RW | Fan0 Minimum RPM |
|F0Mt | ui16 |  2  | K_VAR_ATOM_RW | Fan0 Max calculated target RPM |
|F0Mx | fpe2 |  2  | K_VAR_ATOM_RW | Fan0 Maximum RPM |
|F0Sf | fpe2 |  2  | K_VAR_ATOM_RW | Fan0 Safe RPM |
|F0Tg | fpe2 |  2  | K_VAR_ATOM_RW |  Modify this in conjunction with Fan force bit [0] to set fan speed.  |
|F1Ac | fpe2 |  2  | K_VAR_ATOM_RW | Fan1 Actual RPM |
|F1ID | {fds |     | K_CONST       | Fan1 Description |
|F1Mn | fpe2 |  2  | K_VAR_ATOM_RW | Fan1 Minimum RPM |
|F1Mt | ui16 |  2  | K_VAR_ATOM_RW | Fan1 Max calculated target RPM |
|F1Mx | fpe2 |  2  | K_VAR_ATOM_RW | Fan1 Maximum RPM |
|F1Sf | fpe2 |  2  | K_VAR_ATOM_RW | Fan1 Safe RPM |
|F1Tg | fpe2 |  2  | K_VAR_ATOM_RW |  Modify this in conjunction with Fan force bit [1] to set fan speed.  |
|F2Ac | fpe2 |  2  | K_VAR_ATOM_RW | Fan2 Actual RPM |
|F2ID | {fds|      | K_CONST       | Fan2 Description |
|F2Mn | fpe2 |  2  | K_VAR_ATOM_RW | Fan2 Minimum RPM |
|F2Mt | ui16 |  2  | K_VAR_ATOM_RW | Fan2 Max calculated target RPM |
|F2Mx | fpe2 |  2  | K_VAR_ATOM_RW | Fan2 Maximum RPM |
|F2Sf | fpe2 |  2  | K_VAR_ATOM_RW | Fan2 Safe RPM |
|F2Tg | fpe2 |  2  | K_VAR_ATOM_RW |  Modify this in conjunction with Fan force bit [2] to set fan speed.  |
|FNum | ui8  |  1  | K_CONST       | Number of supported fans. |
|FPhz | si16 |  2  | KPRIV_VAR_ATOM_RW |  Programmable Fan Phase offset affects all fans.  Signed value has legal values between 0 and 360.  Default is 360 (no change). |
|FS!  | ui16 |  2  | K_VAR_ATOM_RW |  Fan force bits. FS![15:0] Setting bit to 1 allows for external control over fan speed target and prevents thermal manager from actively overidding value set via key access. |
|GCID | ui32 |  4  | K_VAR_ATOM_RW |  Graphics Card Identification.  Communicates the graphics card's Device ID (DID) and Vendor ID (VID) to the SMC so that the SMC can communicate with that graphics card's thermal sensor(s).  The 32-bit value that is written to this key contains the graphics card's DID in its most-significant 16 bits, and the VID occupies the least-significant 16-bits. |
|GPU! | ui8  |  1  | K_VAR_ATOM_RW |  MXM GPU Force bits[7:0]: GPU![0] = GTHR force override bit. |
|GTHR | ui8  |  1  | K_VAR_ATOM_RW |  MXM_GPU_AC_BATT_L. Drive SMC output with written value.  Needs to be written in conjunction with GPU![0].  |
|HBWK | flag |  1  | K_VAR_RW      | Allows a one-time lid-open event to "wake" the system from S5. |
|HDBS | ui8  |  1  | K_VAR_ATOM_R  | Hang Detect. A/B switch value |
|HDST | ui16 |  2  | K_VAR_ATOM_R  | Hang Detect. Current System State Machine value |
|HDSW | ui32 |  4  | K_VAR_ATOM_R  | Hang Detect. {Sleep[15:0],Wake[15:0]} Count. |
|IC0C | fp79 |  2  | K_VAR_ATOM_RW | CPU 0 core current. |
|ID0R | fp5b |  2  | K_VAR_ATOM_RW | DC In S0 rail current. |
|ID5R | fp4c |  2  | K_VAR_ATOM_RW | DC In S5 rail current. |
|IG0R | fp4c |  2  | K_VAR_ATOM_RW | GPU 0 rail current. |
|IG0r | ui16 |  2  | K_VAR_ATOM_RW | GPU 0 rail current. Raw ADC input value. |
|LAcN | ui8  |  1  | KPRIV_FUNC_W  | Queue up ACPI Notify byte |
|LAtN | ui16 |  2  | KPRIV_FUNC_W  | Queue up Proprietary ATTN_IF Notify byte |
|LCCN | ui8  |  1  | K_VAR_R       | LPC Debug counter data: Num of Acpi Notifies |
|LCCQ | ui8  |  1  | K_VAR_R       | LPC Debug counter data: Num of Acpi Queries |
|LCKA | ui8  |  1  | K_VAR_R       | LPC Debug counter data: Num of Key Accesses |
|LCSA | ui8  |  1  | K_VAR_R       | LPC Debug counter data: Num of Smb Accesses |
|LCTN | ui8  |  1  | K_VAR_R       | LPC Debug counter data: Num of Attn Notifies |
|LCTQ | ui8  |  1  | K_VAR_R       | LPC Debug counter data: Num of Attn Queries |
|LDSP | flag |  1  | K_VAR_W       | When OS X sleeps due to a lid-closed event, it writes a 1 in this key. |
|LS!  | ui8  |  1  | K_VAR_RW      |  Each "1" bit in gui8LmsForced indicates that a certain writable SIL variable has been overridden (i.e., forced) by the host OS or host diagnostics, and that variable should not be written by the SMC again until the applicable bit is cleared in gui8LmsForced.  Currently, this is just a place-holder.  All bits are reserved and should be cleared to 0. |
|LSCF | {lsc |     | K_VAR_ATOM_RW | LmsConfig structure provides overall system-specific config info for the SIL. |
|LSDD | {lsd |     | K_VAR_ATOM_RW | LmsDwell structures provide dwell fade-down configuration |
|LSDU | {lsd |     | K_VAR_ATOM_RW | LmsDwell structures provide dwell fade-up configuration |
|LSFD | {lsf |     | K_VAR_ATOM_RW | LmsFlare structures provide flare config for non-breathing fade-down |
|LSFU | {lsf |     | K_VAR_ATOM_RW | LmsFlare structures provide flare config for non-breathing fade-up |
|LSLB | {pwm |     | K_VAR_ATOM_RW | SIL's PWM "Full On" value (usually 0xFFFF, used for power switch override) |
|LSLF | {pwm |     | K_VAR_ATOM_RW | SIL's PWM "Off" value (usually 0) |
|LSLN | {pwm |     | K_VAR_ATOM_RW | SIL's PWM "On" value (varies per system) |
|LSOF | flag |  1  | K_VAR_R       | Reads TRUE (1) if the SIL is Off |
|LSOO | flag |  1  | K_FUNC_W      |  ui8LmsSetOnOff is a function called by the OS to set the SIL to either on (max brightness, flag=1) or off (flag = 0). |
|LSPV | {pwm |     | K_VAR_R       | SIL's Current PWM value |
|LSRB | flag |  1  | K_FUNC_W      |  ui8LmsRevertToSSMBehavior is a function called by the OS to revert the SIL's behavior to the most recent behavior requested by the SMC's system state machine. |
|LSSB | {lso |     | K_FUNC_W      |  ui8LmsSetBehavior is a function called by the OS to override the SIL's behavior.  The calling parameters must conform to the LmsOverrideBehavior struct. |
|LSSE | flag |  1  | K_VAR_RW      |  gfLmsMaxBrightScalingEnabled lets diagnotics enable and disable the SIL's per-unit max brightness scaling.  This flag will normally be 1 (i.e, TRUE), which enables per-unit scaling.  Set this flag to 0 (FALSE) to disable per-unit scaling.  |
|LSSS | {lso |     | K_FUNC_W      |  ui8LmsSetSSMBehavior is a function called by the OS to override the SIL's behavior while pretending to be the SMC's System State Machine (host software should normally use LSSB instead of this special-purpose key).  The calling parameters must conform to the LmsOverrideBehavior struct. |
|LSSV | ui16 |  2  | K_VAR_RW      |  gui16LmsMaxBrightScale holds the SIL's per-unit max brightness scale value.  A value of 0xFFFF indicates that no scaling will be done for this particular unit.  
|LSUP | ui8  |  1  | K_FUNC_W      |  ui8LmsUpdateBehaviorParams is a function called by the SIL tuning application to force an update of the SIL's behavior parameters at the user's implicit request (i.e., after the user updates underlying data that affects the behavior params). 
|MACA | ui32 |  4  | K_VAR_ATOM_RW | Memory Address Cycle Address. Sets the address for subsequent MACR calls |
|MACM | flag |  1  | K_VAR_ATOM_RW | Memory Address Cycle Mode. Sets the addressing mode for MACR calls. Defaults to auto-incrementing |
|MACR | ch8* |     | K_FUNC_R      |  Memory Address Cycle Read. Reads 32 bytes from SMC @ address pointed to by MACA. Restricted to EPM address range. If MACM==1 then MACA will be incremented by 32 bytes at the completion of the read. |
|MOCF | ui16 |  2  | K_VAR_ATOM_RW | MOtion sensor (SMS) Configuration register |
|MOCN | ui16 |  2  | K_VAR_ATOM_RW | MOtion sensor (SMS) Control register - enables accelerometer and threshold testing |
|MSAL | ui8 |  1  | KWPRIV_FUNC_RW |  Allows control of the thermal routine's behavior for debug and testing purposes.<ul><li>7 - Unused<li>6 - Plimits enabled.  0 => thermal routine will not send plimits, but all other thermal code is still active.  1 => routine sends plimits normally, assuming routine is active.<li> 5 - Unused  <li>4 - Unused  <li>3 - Thermal Subsystem Operating Normally, read-only.  If this bit is 1,    the SMC's thermal subsystem is operating normally.  If it is 0, then    the thermal code is disabled, fans are set to max RPM, and plimits    are all set to max.  On systems that require a throttle selector    table in the UV EPM block, this bit will be set to 0 if the throttle    selector table is invalid or is missing.<li>2 - Valid current/power calibration coefficients in UV EPM block,    read-only.<li>1 - Prochot Enable<li>0 - Thermtrip Enable </ul> |
|MSAc | fp88 |  2  | K_VAR_ATOM_R  | Returns the average CPU PLIMIT sent by the SMC, DIAG_LOG |
|MSAg | fp88 |  2  | K_VAR_ATOM_R  | Returns the average GPU PLIMIT sent by the SMC, DIAG_LOG |
|MSAm | fp88 |  2  | K_VAR_ATOM_R  | Returns the average MEM PLIMIT sent by the SMC, DIAG_LOG |
|MSC0 | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSC1 | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSC2 | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSC3 | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCP | ui16 |  2  | K_VAR_ATOM_RW | Total number of sub samples to calibrate with |
|MSCR | ui16 |  2  | K_VAR_ATOM_RW | Total number of sub samples to calibrate with |
|MSCS | ui8  |  1  | K_FUNC_W      | Calibration Start key - Writing a value of 0x11 to this key will begin |
|MSCT | ui8  |  1  | K_VAR_ATOM_RW | Total number of samples to calibrate with |
|MSCa | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCb | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCc | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCd | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCl | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCm | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCn | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSCo | ui16 |  2  | K_VAR_ATOM_RW | Calibration key |
|MSDI | flag |  1  | K_VAR_R       | Indicates whether an optical disk has been inserted in the optical disk drive (1) or the drive is empty (0). |
|MSDW | flag |  1  | K_FUNC_W      | ui8SSMDisplayWakeSleep is a function called by the OS to notify the SMC that the display is now awake (i.e., on) or asleep (i.e. off), so that the SMC can set the correct behavior for the Status Indicator Light.  |
|MSHA | fp79 |  2  | K_VAR_ATOM_R  | Average HDD activity (range 0 to 1) in U7.9 format. |
|MSLD | ui8  |  1  | K_VAR_R       | Returns the current Lid Switch state |
|MSPA | fp6a |  2  | K_VAR_ATOM_R  | Average count of prochot assertions between 0 and 1 in 6.10 format, DIAG_LOG. |
|MSPC | ui8  |  1  | K_FUNC_RW     | reads and writes the number of available "Power states" for the CPU. |
|MSPS | {msp |     | K_VAR_R       | Returns the current (enumerated) system power state exported by the SMC's System State Machine. |
|MSSD | si8  |  1  | K_FUNC_RW     | Stores the last known Shut-down cause. |
|MSSF | ui32 |  4  | K_FUNC_RW     | Bad fan flag bits. A bit-vector in which each bit position represents a corresponding fan status. The bit-vector is write-one-to-clear for each fan/bit position |
|MSSP | si8  |  1  | K_VAR_RW      | Stores the last known Sleep Request cause. See MSSD for list of causes. |
|MSSS | {mss |     | K_VAR_R       | Returns the current (enumerated) state of the SMC's System State Machine |
|MSTC | ui16 |  2  | K_VAR_ATOM_RW | - ScratchPad register that outputs via Tlog so that a script running on the SUT can add to the log what test case was running. |
|MSTM | ui8  |  1  | K_FUNC_R      | Returns whether power balancing is enabled or not. |
|MSTc | ui8  |  1  | K_VAR_ATOM_R  | Returns the last CPU PLIMIT sent by the SMC |
|MSTg | ui8  |  1  | K_VAR_ATOM_R  | Returns the last GPU PLIMIT sent by the SMC |
|MSTm | ui8  |  1  | K_VAR_ATOM_R  | Returns the last MEM PLIMIT sent by the SMC |
|MSWR | ui8  |  1  | K_FUNC_W      |  ui8SSMStartWarmReset is a function called by the OS to notify that SMC that a warm reset is beginning. |
|NATJ | ui8  |  1  | K_VAR_RW      |  Ninja Action Timer Job.  This job is performed when the Ninja Action Timer counts down to zero.  Job can be any of:<ul><li> 0 = Do Nothing<li> 1 = Force Shutdown to S5<li> 2 = Force Restart<li> 3 = Force Startup<li> 4 = reserved </ul> |
|NATi | ui16 |  2  | K_VAR_ATOM_RW |  Ninja Action Timer.  This timer can be set to the number of seconds before a job (defined in NATJ) is performed.  Value is in seconds and counts down to zero.  Setting to zero cancels any previously set timer. |
|NTOK | ui8  |  1  | K_FUNC_W      | Key for OS X to write to turn on Proprietary Host Notifies. |
|ONMI | ui8  |  1  | K_VAR_ATOM_RW | NMI flag (For OS NMI) |
|PC0C | fp88 |  2  | K_VAR_ATOM_RW | CPU 0 core power |
|PC0c | ui16 |  2  | K_VAR_ATOM_RW | CPU 0 core power. Raw ADC input value. |
|PD0R | fp88 |  2  | K_VAR_ATOM_RW | DC-In MLB S0 rail power |
|PD5R | fp88 |  2  | K_VAR_ATOM_RW | DC-In MLB S5 rail power |
|PDMR | fp88 |  2  | K_VAR_ATOM_RW | DC-In MLB Total (S0+S5) power |
|PDTR | fpa6 |  2  | K_VAR_ATOM_RW | DC-In System Total (S0+S5+LCD+HDD) power |
|PG0R | fp88 |  2  | K_VAR_ATOM_RW | GPU0 rail power |
|PZ0E | fp88 |  2  | K_VAR_ATOM_RW | Zone0 average target power (PC0C+PG0R) |
|PZ0G | fp88 |  2  | K_VAR_ATOM_RW | Zone0 average power (PC0C+PG0R) |
|RBr  | ch8* |     | K_DESC_STR    | Source branch |
|REV  | {rev |     | K_CONST       | Source revision |
|RMde | char |  1  | K_CONST       | Mode. What code is currently being executed. 'B'=base flasher, 'U'=update flasher or 'A'=app code |
|RPlt | ch8* |     | K_CONST       | Platform String |
|RSvn | ui32 |  4  | K_CONST       | SVN database revision |
|RVBF | {rev |     | K_FUNC_R      | Base flasher revision |
|RVUF | {rev |     | K_FUNC_R      | Update flasher revision |
|SAS! | ui32 |  4  | KWPRIV_VAR_ATOM_RW |  ADC sensor force bits [31:0]. Setting bit(s) will prevent periodic ADC conversion cycle from overwriting sensor data for selected channels. |
|SBF  | ui16 |  2  | K_VAR_ATOM_R  |  Bad sensor flags.  One per PID, defined as follows:<ul><li> PID  Bit   Hex     Dec<li> ---  ---  ------   ---<li> CPU   0   0x0001     1<li> GPU   1   0x0002     2<li> HDD   2   0x0004     4<li> ODD   3   0x0008     8<li> PS    4   0x0010    16<li> LCD   5   0x0020    32 </ul> |
|SBFC | ui16 |  2  | K_VAR_ATOM_RW |  When a bit has been set by the SMC in SBF key and is then subsequently reset by writing this key, it will cause the appropriate data elements for the PID to be reset and the pid will resume normal behaviour if it's sensors are working properly again.  Note that it may take a few minutes for the fans associated with that PID loop to return to normal speed due to PID loop tuning. |
|SBFE | flag |  1  | K_VAR_ATOM_RW |  The state of this flag determines whether vTmBadSensorCheck will display sensor error codes instead of actual temperatures when it detects unstable temperatures or temperatures that are below the allowed minimum.  Defaults to TRUE (displays error codes). |
|SCIA | ui16 |  2  | K_FUNC_RW     | Lpc Base Address for SCIF, default is 0x3F8 |
|SCIL | ui8  |  1  | K_FUNC_RW     | Set this to 1 to enable SCIF to be LPC slave for EFI debug |
|SCTg | sp78 |  2  | K_VAR_ATOM_RW | CPU Thermal Target Temp |
|SDPE | ui8  |  1  | K_VAR_ATOM_RW | Mode bit to enable polling of developmental build sensors. Default state will vary depending on build. |
|SDRd | ui16 |  2  | K_FUNC_W      |  Delayed sensor read. Writing a value in ms will cause the SMC to start a timer which when expires will cause the SMC to set force bits for polled sensors. This effectively allows a follow on query to sample the state of the sensors at the desired time. Value in ms. |
|SGHT | ui8  |  1  | K_VAR_ATOM_R  | Sensor Graphics HoT. 1 = GPU Overtemp. |
|SGTT | sp78 |  2  | K_VAR_ATOM_RW |  GPU Heatsink Throttle Threshold Temperature.  If the GPU's heatsink temperature exceeds this temperature, the SMC will assert the GPU's throttle to slow and cool the GPU.  |
|SGTg | sp78 |  2  | K_VAR_ATOM_RW | GPU Thermal Target Temp |
|SHTg | sp78 |  2  | K_VAR_ATOM_RW | HDD Thermal Target Temp |
|SIS! | ui16 |  2  | KWPRIV_VAR_ATOM_RW|  I2C sensor force bits. Setting bit(s) will prevent periodic I2C polling cycle overwriting sensor data. This key is intended for expert use only. (...) |
|SLPT | sp78 |  2  | K_VAR_ATOM_RW | LCD Prochot threshold. TL0P temp at which Prochot will be asserted. |
|SLST | sp78 |  2  | K_VAR_ATOM_RW | LCD Sleep threshold. TL0P temp at which Sleep will be requested. |
|SLTg | sp78 |  2  | K_VAR_ATOM_RW | LCD Fan Temp Target |
|SLTp | sp78 |  2  | K_VAR_ATOM_RW | LCD Power Temp Target |
|SOTg | sp78 |  2  | K_VAR_ATOM_RW | ODD Thermal Target Temp |
|SPH0 | ui16 |  2  | K_VAR_R       | CPU Prochot event count since last boot |
|SPHR | ui32 |  4  | K_VAR_ATOM_R  | Any bit set to 1 identifies an active Prochot requestor.  For K2/K3, the following bits are defined: Bit 31:  User-forced Prochot Bit 30:  RSVD for "Prochot forever in lieu of Thermtrip" (currently unused) Bits 4-29:  RSVD Bit  3:  Prochot Power Index Bit  2:  Power-supply overcurrent Bit  1:  Power-supply overtemp Bit  0:  LCD panel overtemp |
|SPHS | ui8  |  1  | K_VAR_ATOM_RW | Indicates if PROCHOT was ever set after entering S0, DIAG_LOG |
|SPHT | ui16 |  2  | K_VAR_ATOM_R  |  Current state of all Prochots and whether the SMC itself is asserting each one.  Bits 0-7:   Prochot state for CPUs 0-7, respectively (1 bit per CPU).  1 = Prochot asserted.  0 = Prochot deasserted.  Bits 8-15:  The SMC itself is asserting Prochot for CPUs 0-7, respectively (1 bit per CPU; bit 8 corresponds to CPU 0, bit 15 corresponds to CPU 7).  1 = SMC is asserting Prochot to that CPU.  0 = SMC is NOT asserting Prochot to that CPU. |
|SPHZ | ui8  |  1  | K_FUNC_W      |  Drive SMC Prochot(s).  In the single byte of write data, bits 0 through 7 control the Prochots for CPUs 0 through 7, respectively.  For example, writing 0x01 sets Prochot for CPU 0, while writing 0x80 sets Prochot for CPU 7, and writing 0xFF sets all 8 Prochots.  Setting bits for CPUs that don't exist does nothing and causes no harm. |
|SPS! | ui16 |  2  | KWPRIV_VAR_ATOM_RW |  Power force bits. Setting bit(s) will prevent periodic power calculations from overwriting existing data. Bit mapping varies by platform and is intended for expert use only. |
|SpCP | fps4 |  2  | K_VAR_ATOM_R  | Read-only PS I-squared sum Prochot threshold in U27.4 format.  Sample computation:  [(Prochot threshold in watts)/12v]^2 * (Filter depth = 24576) Hex value is the above * 16. |
|SpCS | fps4 |  2  | K_VAR_ATOM_R  |  Read-only PS I-squared sum target for P3-level PS current control, in U27.4 format.  Sample computation:  [(Target in watts)/12v]^2 * (Filter depth = 24576) Hex value is the above * 16. |
|SpCT | fpc4 |  2  | K_VAR_ATOM_R  | Read-only PS I-squared target (non-summed) for initializing PS current control filter history, in U12.4 format.  Sample computation:  [(Target in watts)/12v]^2.  Hex value is the above * 16. |
|SpPT | sp78 |  2  | K_VAR_ATOM_RW | PS Prochot threshold. Tp0P temp at which Prochot will be asserted |
|SpST | sp78 |  2  | K_VAR_ATOM_RW | PS Sleep threshold. Tp0P temp at which Sleep will be requested. |
|SpTg | sp78 |  2  | K_VAR_ATOM_RW | PS Fan Temp Target |
|TA0P | sp78 |  2  | K_VAR_ATOM_RW | Ambient temp |
|TC0D | sp78 |  2  | K_VAR_ATOM_RW | CPU 0 die temp |
|TC0H | sp78 |  2  | K_VAR_ATOM_RW | CPU 0 Heatsink temp |
|TC0P | sp78 |  2  | K_VAR_ATOM_RW | CPU 0 Proximity temp |
|TG0D | sp78 |  2  | K_VAR_ATOM_RW | GPU 0 die temp |
|TG0H | sp78 |  2  | K_VAR_ATOM_RW | GPU 0 Heatsink temp |
|TG0P | sp78 |  2  | K_VAR_ATOM_RW | GPU 0 Proximity temp |
|TH0P | sp78 |  2  | K_VAR_ATOM_RW | HardDisk proximity temp |
|TL0P | sp78 |  2  | K_VAR_ATOM_RW | LCD proximity temp |
|TO0P | sp78 |  2  | K_VAR_ATOM_RW | Optical Drive proximity temp |
|TW0P | sp78 |  2  | K_VAR_ATOM_RW | Airport temp |
|Tm0P | sp78 |  2  | K_VAR_ATOM_RW | Misc Local temp |
|Tp0P | sp78 |  2  | K_VAR_ATOM_RW | Power Supply Proximity temp |
|UPRC | ui16 |  2  | K_CONST       | Type of SMC microcontroller upon which system is based (value of UPROC macro) |
|VC0C | fp1f |  2  | K_VAR_ATOM_RW | CPU 0 core voltage. |
|VC0c | ui16 |  2  | K_VAR_ATOM_RW | CPU 0 core voltage. Raw ADC input value. |
|VD0R | fp4c |  2  | K_VAR_ATOM_RW | DC In S0 rail voltage. |
|VD5R | fp4c |  2  | K_VAR_ATOM_RW | DC In S5 rail voltage. |
|VG0R | fp4c |  2  | K_VAR_ATOM_RW | GPU 0 rail voltage. |
|VG0r | ui16 |  2  | K_VAR_ATOM_RW | GPU 0 rail voltage. Raw ADC input value. |
|dBA0 | sp78 |  2  | K_VAR_ATOM_R  | Acoustic Reporting. Fan 0 Noise Component (dBA). |
|dBA1 | sp78 |  2  | K_VAR_ATOM_R  | Acoustic Reporting. Fan 1 Noise Component (dBA). |
|dBA2 | sp78 |  2  | K_VAR_ATOM_R  | Acoustic Reporting. Fan 2 Noise Component (dBA). |
|dBAH | sp78 |  2  | K_VAR_ATOM_R  | Acoustic Reporting. HDD Noise Component (dBDA). |
|dBAT | sp78 |  2  | K_VAR_ATOM_R  | Acoustic Reporting. Total Noise of all calculated components (dBDA). |
|zDBG | ui8  |  1  | K_FUNC_RW     | Set this to 1 to enable SCIF debug output to USB 0 Port |
|{lim | \0\0\0\0|     |KPRIV_DESC_STR|  Plimits group is 3 UInt8s:|
|{lsc | \0\0\0\0|     |K_DESC_STR|  LmsConfig structure provides overall system-specific config info for the SIL.|
|{msp | \0\0\0\0|     |K_DESC_STR|  SSMPowerState |
|{mss | \0\0\0\0|     |K_DESC_STR|  SSMState typedef |
|{pwm | \0\0\0\0|     |K_DESC_STR|  PWMValue typedef |
