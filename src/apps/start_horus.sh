#!/bin/bash
#
#   LeanDVB DVB-S Decoder Script for Horus Launches
#

# RECEIVER SETTINGS
# Receive Frequency, in Hz.
RXFREQ=445000000

# Receiver Gain Setting
# Set to 0 to use AGC, otherwise use a gain value between 0 and 49
GAIN=0
#GAIN=30

# Sample Rate, in Hz
# Suggest leaving this at 2.4 MHz.
SAMPLERATE=2400000

#
# DVB TRANSMITTER SETTINGS
#
# Transmitter Symbol Rate
SYMBRATE=1000e3
# Transmitter FEC
FEC=1/2


# Save captured Transport Stream to this file.
# Note that this will be overwritten each time this script is run.
TSOUT=dvb_capture.ts



# Configure the gain setting
GAIN_SETTING=""
if [ "$GAIN" = "0" ]; then
	echo "Using AGC."
	GAIN_SETTING=""
else
	echo "Using Manual Gain"
	GAIN_SETTING=" -g $GAIN"
fi

# Start the decoder

rtl_sdr -f $RXFREQ $GAIN_SETTING -s $SAMPLERATE - | ./leandvb --gui -f $SAMPLERATE --sr $SYMBRATE --cr $FEC | tee $TSOUT | mplayer -cache 32 -