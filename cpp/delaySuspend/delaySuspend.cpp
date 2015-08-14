#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
using namespace std;

// ENTER "sudo delaySuspend" FOLLOWED BY
// THE DELAY TIME IN MINUTES BEFORE
// THE SYSTEM IS TO GO INTO SLEEP
// MODE.

int main(int argc, char *argv[])
{
	int delayMins = 0;
	int delayHours = 0;
	int currentSecs = 0;
	int currentMins = 0;
	int currentHours = 0;

	if(argc != 2)
	{
		cout << "Invalid input." << endl;
	}
	else
	{
		delayMins = atoi(argv[1]);
		delayHours = (delayMins / 60);
		delayMins = (delayMins % 60);
		printf("%02d:%02d:%02d of %02d:%02d:00\n",
				currentHours,currentMins,currentSecs,delayHours,delayMins);
		for(int i = 0; i < ((delayHours * 60 * 60) + (delayMins * 60)); i++)
		{
			// sleepcp(1);
			usleep(1000000);
			if(currentSecs == 59)
			{
				if(currentMins == 59)
				{
					currentHours++;
					currentMins = 0;
					currentSecs = 0;
				}
				else
				{
					currentMins++;
					currentSecs = 0;
				}
			}
			else
			{
				currentSecs++;
			}
			printf("%02d:%02d:%02d of %02d:%02d:00\n",
				currentHours,currentMins,currentSecs,delayHours,delayMins);
		}
		system("sudo pm-suspend");
	}
	return 0;
}