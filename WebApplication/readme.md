## Compost'TER - web application. Garemix, Lyon, 2015


Here is the web / screen side of the project. This web application communicates with arduino sensors and displays screens and information following the data that is sent by the sensors. It's written in javascript, through the framework [meteor.js](https://www.meteor.com/) that enables realtime communication between server and client.


### How to install the application

1. Install meteor
`$ curl https://install.meteor.com | /bin/sh`

2. Clone this repository
`$ git clone ....`

3. Plug the arduino board on a usb port (via usb/serial wire)

4. Check the address of your serial port.
One way to do it is to install arduino, and check in the top menu on which port is the arduino board sending its signal.

5. Change the address of the serial port in the file `/server/serialPort.js`

### How to launch the application

#### With arduino plugged on serial port

Go inside the application folder and launch meteor :
1. `$ cd composTer/WebApplication`
2. `$ meteor`

If *'Port open'* appears in your terminal, everything is working

3. Open a browser and go to `localhost:3000/`

#### Without arduino plugged on serial port

For debugging purpose, you may want to launch the app without arduino plugged.

1. First, you need to comment the whole file `/server/serialPort.js`. Then, do as in the previous part :

2. `$ cd composTer/WebApplication`
3. `$ meteor`
4. Open a browser and go to `localhost:3000/`

### Bugs ?

#### Arduino is plugged but serial port isn't recognised

1. Shut down the application : In your terminal, type Ctrl-C
2. unplug the arduino board
3. plug it back
4. relaunch the application (`meteor` in the project directory)

#### The program is blocked at the wrong screen

- Shut down the application
In your terminal : Ctrl-C
- Go to the home page in your browser (`localhost:3000/`)
- relaunch the application (`meteor` in the project directory)

The program automatically reboots routing.


### Warning

This application was developped in 2 days by a single person, in order to have a life size prototype working and being tryed out for 2 hours. Therefore, it's neither optimized, nor secure or 100% reliable !
