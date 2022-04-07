# Account Aggregator Ecosystem: API Specs & FI Schemas

## Overview

This repository contains:

- OpenAPI specifications for Account Aggregator (`specs/aa.yaml`), **F**inancial **I**nformation **P**rovider (`specs/fip.yaml`) and **F**inancial **I**nformation **U**ser (`specs/fiu.yaml`).
- Supported Financial Instrument type schemas (`schemas/**/*.xsd`).

## Maintaining the API Specifications

### [Specifications Folder](specs/)

The [specs/](specs/) folder contains the OpenAPI specification files:

- **aa.yaml** - to define the Account Aggregator APIs
- **fip.yaml** - defines the API specification for a FIP
- **fiu.yaml** - defines the API specification for a FIU

### Submitting a Specification Change

Update the specification in `specs/*.yaml` file(s) that contains your changes and additions.  
When changes are done, create a Pull Request that contains all the files you modified. An automatic validation script will verify if the changes results in a valid OpenAPI specification.   
Besides automated validation, a manual review will also be done and if found correct and valid by reviewers, the changes will be merged.

## Maintaining the FI Schemas

### [Schema Folder](schemas/)

FI schemas are contained in [schemas/](schemas/) folder. Sample directory organization as follows:

- [schemas/deposit/](schemas/deposit/) - contains schema definition file for **Deposit** FI Type
- [schemas/credit_card/](schemas/credit_card/) - contains schema definition for **Credit Card** FI type
- and so on

### Submitting a FI Schema Change

Update the schema definition file for one or more FI types which require changes.  
Once changes are done, create a Pull Request that contains the required changes. 
Depending on FI schemas modified, set of common and specific validation scripts will verify the changes.  
A manual review of PR will be done by reviewers, and changes will be merged if found correct and valid.
