# A Relational Database for Radiation Protection in Uranium Mining

## Table of Contents

- [Introduction](#introduction)

## Introduction

Uranium is a common element found throughout Earth's crust. Uranium is mined to be used as fuel in nuclear power plants. Canada, particularly Saskatchewan, has some of the world's largest uranium deposits. In Saskatchewan, there are several active and planned uranium mines.

Compared to other types of mining, uranium mining presents additional challenges as uranium is radioactive. Two types of radioactivity are of particular concern in uranium mining. The first is alpha emission. In alpha emission, an atomic nucleus (the parent) emits a helium-4 nucleus (a bound state of two protons and two neutrons often called an alpha ray) and transforms into a nucleus of a different element (the progeny). The second is gamma emission. In gamma emission, a radioactive substance emits high-frequency, short-wavelength electromagnetic radiation (often called gamma rays).

Material exposed to radiation absorbs energy from the radiation. Radiation dose is a measure of energy absorbed per mass. Large radiation doses in human tissue or bone can cause radiation sickness, burns, and an increased likelihood of cancer. 

Alpha rays generally have relatively low penetrating power and are easily blocked by shielding such as a sheet of paper or a person's epidermis (outler layer of skin). As such, alpha radiation is regarded as an internal, not external, radiation hazard. An alpha emitter is dangerous mainly if it enters the body through inhalation, ingestion, or through a wound. In contrast, gamma radiation has relatively high penetrating power and cannot be completely blocked by shielding. Gamma rays are both an internal and external radiation hazard.

Another radiation-related concern in uranium mining is the release of radon gas. Uranium-238 (the principal component of uranium in Earth's crust) decays naturally via a sequence of radiation emissions (including several alpha emissions). Among the progeny of these decays is radon-222, a colourless, odourless, chemically-inert gas. Radon-222 is an alpha emitter, but perhaps of greater significance, being an inert gas, it easily disperses throughout the environment, effectively spreading radioactivity.   

The goals of radiation protection are to prevent both workers and the general public from absorbing unsafe levels of radiation and to prevent environmental contamination with radioactive material. To achieve these goals, radiation-protection professionals at uranium mines regularly test workers for absorbed doses from alpha and gamma radiation and test areas within mine sites for concentration of radioactive material, including radon-222. Such tests result in a large amount of data to be collected, stored, and analyzed. Furthermore, regular reports must be made available to workers, managers, and government regulators.

## Database Design

### Requirements Analysis and Definition

- Each worker has the following attributes: ID, name, social insurance number (SIN), phone number, and email address. Also, each worker belongs to precisely one job category characterized by a job code, a title (**e.g.,** miner, radiation technician, or radiation safety officer (RSO)), and a job description. There are zero or more workers per job.
- There are one or more mining sites. Each mining site comprises zero or more buildings. Each building comprises one or more zones. Mining sites are characterized by a number, a name, a description, a location (*i.e.,* latitude and longitude), a region (*e.g.,* Saskatchewan), and a country (*e.g.,* Canada). Buildings are characterized by a number (starting at 1 for each site), a name, and a description. Zones are characterized by a number (starting at 1 for each building) and a description.
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

![logical design model](./images/erd-2.drawio.png)

### Normalization

From the normalization diagrams shown below,
it can be seen that all tables except site and lab are BCNF.
The site and lab tables are 2NF, but not 3NF as both tables contain one or more transitive dependencies. (Explain the decision to stay at 2NF.)

Note that the worker and zone tables each have a primary key (PK) as well as a second candidate key. For the worker table, worker_id is the PK whereas worker_sin (SIN) is an additional candidate key. For the zone table, zone_id is a surrogate PK, helpful for joins that involve this table. The triple (site_num, bldg_num, zone_num) is a (hierarchical) candidate key.

![normalization tables](./images/normalization-1.drawio.png)
![normalization tables](./images/normalization-2.drawio.png)

### Database Implementation and Operation

- setup
- create daily and monthly reports summarizing RnP, RnG (active) area monitoring
- create cumulative monthly, quarterly, annual RnP doses for each worker

## Discussion

Future improvements:
- equipment calibration logs
- lab shipping logs
- timecards
- worker promotions, *i.e.,* changes in job title
- worker-dosimeter assigning and tracking

## Conclusion

## References

- health physics book
- Marty
- draw.io