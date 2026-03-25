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

- Each worker has the following attributes: ID, name, social insurance number (SIN), phone number, and email address. Also, each worker belongs to precisely one job category characterized by a job code, a title (**e.g.,** miner, radiation technician, or radiation safety officer (RSO)), and a job description. There are zero or more workers per job.
- There are one or more mining sites. Each mining site comprises zero or more buildings. Each building comprises one or more zones. Mining sites are characterized by an ID, a name, a description, a location (*i.e.,* latitude and longitude), a region (*e.g.,* Saskatchewan), and a country (*e.g.,* Canada). Buildings are characterized by an ID, a number (starting at 1 for each site), a name, and a description. Zones are characterized by an ID, a number (starting at 1 for each building), and a description.
- Many pieces of equipment are used in radiation safety at uranium mines. Data that needs to be tracked for each piece of equipment are a serial number, a make, a model, a status (**i.e.,** ready, deployed, out of service, or retired), a last-calibration date, and a next-calibration date. Also, each piece of equipment belongs to precisely one category, and each category contains zero or more pieces of equipment. Each equipment category has a code, a description (**e.g.,** air pump, counter, gamma meter, optically-stimulated luminescent dosimeter (OSLD), personal alpha dosimeter (PAD), or direct-reading dosimeter (DRD)), and a recommended calibration frequency (in days).
- Once used in the field, certain types of equipment (namely OSLDs and PADs) need to be shipped to an external lab for analysis. A lab is characterized by an ID, a name, a shipping address, a phone number, and an email address.

- Radiation monitoring is done for both areas and persons through the collection and analysis of samples. All samples, whether area samples or person samples, are sampled using one or more pieces of equipment. Each piece of equipment can be used multiple times to take many samples.
- Area samples are identified by an ID and have starting and ending timestamps identifying the time interval over which the sample was taken. Area samples are sampled in a zone by a radiation technician or an RSO and must be approved by an RSO. An area sample may be declared void; in such cases, a reason should be provided. Critically, an area sample has a type with a corresponding type-dependent result. Three types of area samples are considered here. The first type is RnG, **i.e.,** radon gas. For RnG, the result represents radon gas concentration in Becquerel (Bq) per cubic metre. (Note that 1 Bq corresponds to 1 radioactive decay per second.) The second type is RnP, **i.e.,** radon progeny. For RnP, the result represents concentration of radon progeny in working levels (WL). (Note that 1 WL corresponds to the number of radon progeny in 1 cubic metre that ultimately leads to a total alpha-particle energy of 1.3e5 MeV.) The third type is gamma. For gamma, the result represents dose rate in milllisieverts (mSv) per hour. (Note that 1 Sv corresponds to the absorption in human tissue of 1 J/kg from radiation weighted by radiation type and is a measure of expected biological damage.) 
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

Future improvements:
- equipment calibration logs
- lab shipping logs
- timecards
- worker promotions, **i.e.,** changes in job title
- workers sometimes lose their dosimeters

## Conclusion

## References
