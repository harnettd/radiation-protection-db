# A Relational Database for Radiation Protection in Uranium Mining

## Table of Contents

## Introduction

- Uranium is a common element that can be found throughout the Earth's crust.
- Uranium has many uses: nuclear power plants, nuclear medicine,
- Canada, particularly Saskatchewan, has some of the world's largest uranium deposits.
- There are several active and planned mines.

- Uranium is radioactive. Uranium ore contains all elements of the U-238 and U-235 decay chains.
- atom, nucleus, atomic number, mass number
- There are three types of nuclear radiation:
    - alpha
        - ejection of a helium-4 nucleus
        - decreases atomic number by 2, decreases mass number by 4
    - beta
        - ejection of an electron
        - increases atomic number by 1, leaves mass number unchanged 
    - gamma
        - emission of high-energy electromagnetic radiation
- Naturally-occurring uranium is in secular(?) equilibrium with its progeny including radon gas.

- When absorbed by a material such as human tissue or bone, all three types of radiation cause the material to absorb energy (through various mechanisms).
- Energy absorbed by a human body due to exposure to radiation is called absorbed dose and is measured in Grays (Gy) where 1 Gy = 1 J/kg.
- The biological effects of radiation exposure depend on absorbed dose as well as radiation type. Equivalent dose combines the two (somehow) and is measured in sieverts (Sv).
- There is also effective dose.
- The absorbed energy, measured in J/kg, causes excitation and ionization. 
- alpha:
    - easily blocked by shielding (such as a sheet of paper or a layer of dead skin cells)
    - dangerous if inhaled or injested, i.e., internal, not external threat
- beta:
    - more penetrating than alpha particles
    - can be blocked by shielding (a sheet of plastic?)
- gamma:
    - highly penetrating
    - cannot be completely blocked
- Large doses of absorbed radiation can lead to skin burns, radiation sickness, and an increased likelihood of cancer.

- The goal of radiation protection is to prevent workers from absorbing unsafe levels of radiation:
    - areas are regularly monitored for radiation exposure
    - workers are regularly monitored for radiation absorption dose
    - if necessary, workers can be subjects of in vivo or in vitro tests.
- results in a large amount of data collected and analyzed
- regular reports issued to workers, managers, and regulators

## Database Design

### Requirements Analysis and Definition

- There are several types of measurements (monitoring, dosimetry, urine bioassay):
    - area monitoring:
        - radon progeny (RnP)
        - radon gas (RnG)
            - **focus on active**
        - long-lived radioactive dust (LLRD)
            - U-238, U-234, Th-230, Ra-226, Po-210
            - alpha emitters
        - gamma
    - individual monitoring:
        - personal long-lived radioactive dust (LLRD)
        - OSLD (Optically Stimulated Luminescent Dosimeter)
            - measures dose from gamma rays
        - DRD (direct reading dosimeter)
            - OSLD preferred
        - personal alpha dosimeter (PAD)
            - alphas come from radon progeny and LLRD
        - urine bioassay
    - other
        - swipes
- Workers have IDs and names. Some workers are radiation technicians. Some workers are managers. Most workers are neither.
- Locations have geographies, buildings, departments and/or floors.
- Area monitoring is handled through surveys that are created by managers. A survey comprises one or more samples, each taken at a particular location on a particular date. Each sample is obtained using one of more pieces of equipment. A radiation technician collects each sample, calclulates a corresponding exposure (C/kg?) or activity or concentration (Bq/m3) or dose rate(?), and enters the result into the database.
- Each day, workers submit timecards indicating their SEG(?), which locations they worked in, and how long they spent in each location. Timecards must be approved by a manager. The timecards together with survey results allow for daily RnP/RnG/LLRD/gamma equivalent doses (in mSv) to be calculated for each worker.
- All/most equipment requires regular calibration.
- RnP monitoring equipment consists of an air sample pump, a calibrator, and a TRIMET. Each TRIMET has a calculated efficiency and chi-squared.
- RnG monitoring equipment consist of an air sample pump, a calibrator, a lucas cell, and an AB7.
- For each sample, the sample and equipment details are logged. Also, samples have a number, type, jurisdiction, limit type, classification, date 
- Every quarter, each worker is assigned an OSLD. (This constitutes a survey.) At the end of the quarter, all OSLDs are collected and sent to a lab for processing. Results (in mSv) are added to the database.
- Each worker is assigned a DRD. Each day, workers add the DRD reading to the database.
- Every month, each worker is assigned a PAD. PADs have a head and a body (air sampling unit). At the end of the month, all PADs are collected and sent to a lab for processing. Resuts (in mSv) are added to the database.

### Conceptual Design Model

### Data Model Mapping

### Normalization

### Database Implementation and Operation

- setup
- create daily and monthly reports summarizing RnP, RnG (active) area monitoring
- create cumulative monthly, quarterly, annual RnP doses for each worker

## Discussion

## Conclusion

## References
