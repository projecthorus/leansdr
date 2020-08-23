leansdr: Lightweight, portable software-defined radio.

Project Horus Fork Additions:
* Startup scripts with horus-specific parameters.

Copyright (C) 2016 <pabr@pabr.org>

> This program is free software: you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation, either version 3 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License
> along with this program.  If not, see <http://www.gnu.org/licenses/>.

**leansdr** consists of:
* A simple data-flow framework for signal processing
* A C++ library of software-defined radio functions
* Applications built on top of the above.

Currently the main application is **leandvb**.

# leandvb

**leandvb** is a DVB-S demodulator designed for speed rather
than sensitivity.

See http://www.pabr.org/radio/leandvb for details and use cases.

## Quick start guide
Install required dependencies (tested on Ubuntu 20.04):
```
$ sudo apt-get install build-essential rtl-sdr git libfftw3-dev libiio-dev libx11-dev mplayer

```

Build the decoder:
```
git clone http://github.com/projecthorus/leansdr.git
cd leansdr/src/apps
make
```

## Decoding using a RTLSDR
The `start_horus.sh` script in src/apps/ provides most of the settings required to decode DVB-S from a horus launch.

You will likely need to edit this file to adjust receiver gain to optimize reception, but try with AGC enabled first (the default).
If you need to adjust the receiver gain, edit `start_horus.sh` and change the `GAIN=0` line to some other value (between 0-49 for RTLSDRs)

Run the script with (assuming you are in leansdr/src/apps):
```
$ ./start_horus.sh
```

The leanDVB windows will appear, showing constellation diagrams and spectrum information. After mplayer has cached enough video, a video window will appear (this may take up to 30 seconds depending on signal quality).



