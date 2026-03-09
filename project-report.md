# A Relational Database for Radiation Protection in Uranium Mining

## Table of Contents

## Introduction

- Uranium is a naturally-occurring element that is fairly abundant in the Earth's crust.
- Uranium has many uses: nuclear reactors, medicine,...
- Canada, particularly Saskatchewan, has some of the world's largest uranium deposits.
- There are several active and planned mines.

- Uranium is radioactive.
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
- The absorbed energy, measured in J/kg, causes excitation and ionization. 
- alpha:
    - easily blocked by shielding (such as a layer of dead skin cells)
    - dangerous if inhaled or injested, i.e., internal, not external threat
- beta:
- gamma:
- Large doses of absorbed radiation can lead to burns, sickness, and increased likelihood of various types of cancer.

- The goal of radiation protection is to prevent workers from absorbing unsafe levels of radiation:
    - areas are regularly monitored for radiation exposure
    - workers are regularly monitored for radiation absorption
    - if necessary, workers can be subjects of in vivo or in vitro tests.
- results in a large amount of data collected and analyzed

## Database Design

### Requirements Analysis and Definition

- There are several types of measurements/samples:
    - radon progeny (RnP)
    - personal alpha dosimeter (PAD)
    - long-lived radioactive dust (LLRD)
    - OSLD?
    - personal long-lived radioactive dust (LLRD)
    - radon gas (RnG) passive
    - radon gas (RnG) active
    - swipes
    - gamma
    - urine bioassay
- Samples have number, type, jurisdiction, limit type, classification, date, 
- Samples are sampled by employees.
    Employees have IDs.
- Samples are sampled at locations. 
    Locations have geographies, buildings, departments and/or floors.
- Samples are sampled using equipment. 
    - Equipment has a serial number, next-calibration date, initial flow, a set of flow measurements.
    - There's air sampling, sampling, and sample analysis equipment.
    - Sample analyses yield (monitoring) results.
- Samples are sent to labs.
- Equipment gets calibrated through calibrations.


### Conceptual Design Model

### Data Model Mapping

### Normalization

### Database Implementation and Operation

- setup
- report with worker ID, equipment ID, total runtime, start datetime, end datetime, total dose

## Discussion

## Conclusion

## References
