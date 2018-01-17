# Personal-Info-Masking
Script created with Powershell to take a data integration file and mask personal and private information for use in Test regions

The following script was created to mask private information in date files that were used for testing. This allowed testers to work freely without fear that personal information could be exposed and made public.

Powershell was a new language I researched to create this script. I used the StackOverflow community to help me with this script.

https://stackoverflow.com/questions/45009700/masking-fields-duplications

There are 3 files needed.

First: The Date Integration file that contains the un-masked personal information. Personal-Info-Original.svd

Second: Powershell Script file that took in the first un-masked data file.

Third: When the Powershell Script is run it will output the Personal-Info-Output.svd file with the masked fields.
