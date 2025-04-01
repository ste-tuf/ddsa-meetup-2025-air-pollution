# ddsa-meetup-2025-air-pollution
Air pollution at the farm, a little air pollution experiment.

- `data-walk.csv`: contains the data from the air pollution monitors. Each monitor is
identify by it's Entity Name.

The following variable are found in the dataset:

- Timestamp – Date and time of measurement
- Accelerom. vector X/Y/Z – Acceleration in X, Y, and Z axes (m/s²)
- CO2 – Carbon dioxide concentration (ppm)
- Color Temp. – Correlated color temperature (Kelvin)
- Light data ALL – Total ambient light intensity
- Light_Blue/Green/Red/White – Light intensity in specific color channels
- NO2 – Nitrogen dioxide concentration (ppb)
- PM2.5 – Fine particulate matter concentration (µg/m³)
- RH – Relative humidity (%)
- T – Temperature (°C)

- `analysis.R`: the analysis script used at the meetup

- `analysis.html`: script rendered with knitr. 

The walk was as followed: 

- 13:50: Unpacking of the monitors
- 13:55: Start of the walk
- 14:08 - 14:12: Petting of the goats 🐐
- 14:21: Back inside the library

## Little background on air pollution

We separate the air pollutants in two: the particles and the gaseous pollutants. The particles are classified by their size: PM10 are all the particles and less than 10 µm diameter and PM2.5 are 2.5 µm. The PM2.5 can cross the various body barriers and enter the blood circulation. The gaseous pollutants include NO2 and CO" for exemples. NO2 is mostly emitted by combustion engine and hjeavy industry. CO2 is a marker of indoor ari quality and increase in poorly ventilated spaces.

Here are usual limits or indicators for the pollutants we mesured: 

- PM2.5 (Fine Particulate Matter): 15 µg/m³ (24-hour average)
- NO2 (Nitrogen Dioxide): 100 µg/m³ (1-hour average)
- CO2 (Carbon Dioxide):  < 1000 ppm (recommended for good air quality)

## Sharing you analysis

Feel free to share you analysis of the data. You can create issues or submit merge requests. 

