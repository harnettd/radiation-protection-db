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

- Each worker has the following attributes: ID, name, social insurance number (SIN), phone number, and email address. Also, each worker belongs to precisely one job category characterized by a job code, a title (**e.g.,** miner, radiation technician, or radiation safety officer (RSO)), and a job description. There are zero or more workers per job.
- There are one or more mining sites. Each mining site comprises zero or more buildings. Each building comprises one or more zones. Mining sites are characterized by an ID, a name, a description, a location (*i.e.,* latitude and longitude), a region (*e.g.,* Saskatchewan), and a country (*e.g.,* Canada). Buildings are characterized by an ID, a number (starting at 1 for each site), a name, and a description. Zones are characterized by an ID, a number (starting at 1 for each building), and a description.
- Many pieces of equipment are used in radiation safety at uranium mines. Data that needs to be tracked for each piece of equipment are a serial number, a make, a model, a status (**i.e.,** ready, deployed, out of service, or retired), a last-calibration date, and a next-calibration date. Also, each piece of equipment belongs to precisely one category, and each category contains zero or more pieces of equipment. Each equipment category has a code, a name (**e.g.,** air pump, counter, gamma meter, optically-stimulated luminescent dosimeter (OSLD), personal alpha dosimeter (PAD), or direct-reading dosimeter (DRD)), a description, and a recommended calibration frequency (in days).
- Once used in the field, certain types of equipment (namely OSLDs and PADs) need to be shipped to an external lab for analysis. A lab is characterized by an ID, a name, a shipping address, a phone number, and an email address.
- Radiation monitoring is done for both areas and persons through the collection and analysis of samples. All samples, whether area samples or person samples, have a sample number, a start timestamp, and an end timestamp. Also, each sample must be approved by an RSO. Furthermore, a sample can be declared void; if this occurs, a reason should be given. Each sample is sampled using one or more pieces of equipment, and each piece of equipment can be used to take zero or more samples. Each sample belongs to precisely one sample category, and each sample category contains zero or more samples. Each sample category has a code, a name (**i.e.,** area radon gas, area alpha, area gamma, person PAD, person DRD, or person OSLD), and a description.
- For each sample, there is a result. However, the attributes of a result depend on the sample's category. 
    - Each area-sample result refers to precisely one zone, and each zone serves as the location for zero or more area-sample results. Each area sample is sampled by a worker who is either a radiation technician or an RSO. Each worker allowed to sample areas does so zero or more times. 
    - Each person-sample result refers to precisely one worker, and each worker serves as the subject for zero or more person-sample results.
    - Each result corresponding to person PAD and person OSLD is obtained from an analysis performed at an external lab. Each external lab can perform many analyses.
    - For area radon gas, results represent radon gas concentration in Becquerel (Bq) per cubic metre. (Note that 1 Bq corresponds to 1 radioactive decay per second.)
    - For area alpha, results represent alpha-emitter concentration in working level (WL). (Note that 1 WL corresponds to the number of alpha emitters in 1 cubic metre that ultimately leads to a total alpha-particle energy of 1.3e5 MeV.)
    - For area gamma, results represent equivalent dose in millisieverts (mSv). (Note that sieverts have the same dimensions as J/kg and serve as a measure of expected biological damage from absorbed radiation.)
    - For person PAD, results represent equivalent dose in mSv.
    - For person DRD, results represent equivalent dose in microsieverts.
    - For person OSLD, results represent equivalent dose in mSv.

### Conceptual Design Model

![conceptual design model](./images/erd-1.drawio.png)

### Data Model Mapping

### Normalization

### Database Implementation and Operation

- setup
- create daily and monthly reports summarizing RnP, RnG (active) area monitoring
- create cumulative monthly, quarterly, annual RnP doses for each worker

## Discussion

Future improvements:
- equipment calibration logs
- lab shipping logs
- timecards
- worker promotions, **i.e.,** changes in job title
- worker-dosimeter assigning and tracking

## Conclusion

## References


[def]: ./images/erd-1.drawio.png