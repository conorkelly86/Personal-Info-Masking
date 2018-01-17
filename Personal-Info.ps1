clear

#Powershell scripts used to mask Private Personal Information on data files.

#path to PERM file
$path = "E:\TEMPWORK\y317\PS\ML2K_PCLOAS.ILS.I0.BLK5NBPN.G1233V00.DAT"

#get file content
$content = Get-Content $path


$content | 
  ForEach-Object { 	

  $mask81 = 'D' * 81
  $mask50 = 'X' * 50																		#variables to makes fields by letter according to length
  $mask30 = 'Y' * 30
  $mask20 = 'A' * 20
  $mask08 = 'Z' * 8
  $mask05 = 'B' * 5
  $mask16 = 'C' * 16


   	if ($_.Substring(0,10) -eq 'STARTDELIV') 													
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[3] = $mask30													#To Fax Name
		$SplitString[9] = $mask50													#To Email Address
		
		$SplitString -Join '|'
		
    }
 
   	elseif ($_.Substring(0,10) -eq 'CLAIDCA010') 													
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask30													#Customer name - Customer name
		$SplitString[2] = $mask30													#Claimant name - Claimant name
		$SplitString[6] = $mask30													#Assignee - Assignee name
		
		$SplitString -Join '|'
		
    }
	
	elseif ($_.Substring(0,10) -eq 'CLAIENCASH') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[2] = $mask30													#Customer name
		$SplitString[3] = $mask30													#Assignee - Asignee name
		$SplitString[14] = $mask30													#Female Life - Female Life Name
		$SplitString[18] = $mask81													#Assignee Address, Assignee Address
		$SplitString[25] = $mask30													#Payee Name
		$SplitString[27] = $mask16													#account number - Account Number
		$SplitString[32] = $mask30													#Other payee - Other payee
		$SplitString[40] = $mask30													#Client Name - Client Name
		64..67 | ForEach-Object { $SplitString[$_] = $mask30 }						#Cheque Name - Cheque Name / Cheque Add 2 / Cheque Add 3/ Cheque Add  4
		$SplitString[79] = $mask30													#Claimant Name
			
		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'POLDETAIL1') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[7] = $mask08													#Policyno - Policy Number
		8..9 |ForEach-Object { $SplitString[$_] = $mask30 }							#Life 1 Assured / Life 2 Assured
		10..11 |ForEach-Object { $SplitString[$_] = $mask50 }						#Addname1 / Addname 2
		12..15 |ForEach-Object { $SplitString[$_] = $mask30 }						#Add1 / Add2 / Add3 / Add4
		$SplitString[16] = $mask08													#Postcode - Postcode
		$SplitString[17] = $mask50													#Salutation - Salutation
		$SplitString[19] = $mask50													#Policyname - Policy name
		24..25 |ForEach-Object { $SplitString[$_] = $mask50 }						#Copy Addres Name 1 /Copy Addres Name 2
		26..29 |ForEach-Object { $SplitString[$_] = $mask30 }						#Copy Add1 / Copy Add2 / Copy Add3 / Copy Add4
		$SplitString[30] = $mask08													#Copy Postcode - Copy Postcode	

				
		$SplitString -Join '|'
		
    }
	
	elseif ($_.Substring(0,10) -eq 'CLAIPCP010') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[2] = $mask30													#Customer Name
		$SplitString[14] = $mask30													#Female Life - Female Life Name
		$SplitString[18] = $mask81													#Assignee Address, Assignee Address		
		$SplitString[25] = $mask30													#Payee Name
		$SplitString[27] = $mask16													#account number - Account Number
		$SplitString[32] = $mask30													#Other payee - Other payee
		$SplitString[40] = $mask30													#Client Name - Client Name
		64..67 | ForEach-Object { $SplitString[$_] = $mask30 }						#Cheque Name - Cheque Name / Cheque Add 2 / Cheque Add 3/ Cheque Add  4
		$SplitString[79] = $mask30													#Claimant Nam

				
		$SplitString -Join '|'
		
    }
	
		elseif ($_.Substring(0,10) -eq 'CLAITRAN10') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[2] = $mask30													#Customer Name
				
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'CLAICAN010') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[21] = $mask16													#Bank Account Number
				
		$SplitString -Join '|'
		
    }	
	
		elseif ($_.Substring(0,10) -eq 'CUSTCOMM10') 												
	{ 
		$SplitString = $_.Split('|')
		
		47..48 | ForEach-Object { $SplitString[$_] = $mask50 }						#Client address name 1 / Client address name 2
		49..52 | ForEach-Object { $SplitString[$_] = $mask30 }						#Client address 1/ Client address 2 / Client address 3 / Client address 4
		$SplitString[53] = $mask08													#Client Postcode	
		
		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'HOMECOVER1') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy Number	
		3..4 | ForEach-Object { $SplitString[$_] = $mask50 }						#LIFE 1 / Life 2
				
		$SplitString -Join '|'
		
    }	
	
		elseif ($_.Substring(0,10) -eq 'TAXCRTPENS') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[4] = $mask08													#Policy Number	
		$SplitString[7] = $mask03													#Life 1 
		$SplitString[21] = $mask08													#PPS Number
		
				
		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'SCHED01PEN') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[5] = $mask08													#Plan Number	
		$SplitString[13] = $30														#Life 1 
		$SplitString[17] = $30														#Life 2
		53..57 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address 1 / Address 2 / Address 3 / Address 4
		
				
		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'SCHED01SAV') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[5] = $mask08													#Plan Number	
		$SplitString[13] = $30														#Life 1 
		$SplitString[17] = $30														#Life 2
		53..57 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address 1 / Address 2 / Address 3 / Address 4
		
				
		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'SCHED01INV') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[5] = $mask08													#Plan Number	
		$SplitString[13] = $30														#Life 1 
		$SplitString[17] = $30														#Life 2
		53..57 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address 1 / Address 2 / Address 3 / Address 4
		
				
		$SplitString -Join '|'
		
    }
	
		elseif ($_.Substring(0,10) -eq 'PREMBILL10') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[6] = $mask30													#Customername - Customer name	

		$SplitString -Join '|'
		
    }		
		elseif ($_.Substring(0,10) -eq 'PRSACERT01') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy Number
		$SplitString[4] = $mask30													#Life 1 Assured
		$SplitString[18] = $mask08													#PPS Number

		$SplitString -Join '|'
		
    }
	
		elseif ($_.Substring(0,10) -eq 'SRPPENS001') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy No
		$SplitString[2] = $mask30													#Life 1 Assured
		$SplitString[18] = $mask08													#PPS Number

		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'PLCYLIFE01')
	{
	$SplitString = $_.Split('|')
		
		$SplitString[2] = $mask50															#Fields : L1 Person Name
		$SplitString[23] = $mask50															
		
	$SplitString -Join '|'
	}
		elseif ($_.Substring(0,10) -eq 'COMMLET010') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy No
		13..14 | ForEach-Object { $SplitString[$_] = $mask50 }						#Customer name 1 / Customer name 2
		
		$SplitString -Join '|'
		
    }
	
		elseif ($_.Substring(0,10) -eq 'ADDRDETAIL') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[7] = $mask08													#Policy Number
		8..10 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address Name 1 / Address Name 2 / Salutation
		11..14 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[15] = $mask08													#Post Code
		20..21 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address Name 1 / Address Name 2 / Salutation
		22..25 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[26] = $mask08													#Post Code
		
		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'POLICYDATA') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy Number
		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'BILINGDATA') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy Number
		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'BENEFITOVR') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy Number
		
		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'PMAADDRESS') 												
	{ 
		$SplitString = $_.Split('|')
		
		1..2 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address Name 1 / Address Name 2 / Salutation
		3..6 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[7] = $mask08													#Post Code		
		$SplitString -Join '|'
		
    }
	
		elseif ($_.Substring(0,10) -eq 'LIFEADDRES') 												
	{ 
		$SplitString = $_.Split('|')
		
		2..3 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address Name 1 / Address Name 2 / Salutation
		4..7 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[8] = $mask08													#Post Code		
		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'PROPOSER01') 												
	{ 
		$SplitString = $_.Split('|')
		
		1..2 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address Name 1 / Address Name 2 / Salutation
		3..6 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[7] = $mask08													#Post Code		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'COVER01PRO') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[10] = $mask08													#Policy Number
		11..12 | ForEach-Object { $SplitString[$_] = $mask50 }						#Address Name 1 / Address Name 2 / Salutation
		13..16 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[17] = $mask08													#Post Code		
		22..23 | ForEach-Object { $SplitString[$_] = $mask50 }													#Life 1 / Life 2
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'AGENT01ZZZ') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[4] = $mask08													#Policy Number
		5..6 | ForEach-Object { $SplitString[$_] = $mask30 }						#Life 1 / Life 2
		$SplitString[10] = $mask50													#Addname		
		11..14 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4
		$SplitString[15] = $mask08													#Post Code	
		$SplitString[22] = $mask50													#Salutation

		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'SCHED01PRO') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[5] = $mask08													#Policy Number
		$SplitString[13] = $mask30													#Life 1
		$SplitString[17] = $mask30													#Life 2	

		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'CIN0001PRO') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[7] = $mask08													#Policy Number

		$SplitString -Join '|'
		
    }	
		elseif ($_.Substring(0,10) -eq 'TAXCRTINPR') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[4] = $mask08													#Policy Number
		$SplitString[6] = $mask30													#Life 1	
		$SplitString[8] = $mask08													#CustomerName		
		9..12 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4		

		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'NEWBUS20HD') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[1] = $mask08													#Policy Number
		3..4 | ForEach-Object { $SplitString[$_] = $mask50 }						#Life 1 / Life 2
	
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'ABSPRSAAGT') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[4] = $mask08													#Policy Number
		5..6 | ForEach-Object { $SplitString[$_] = $mask30 }						#Life 1 / Life 2
		$SplitString[10] = $mask50													#CustomerName		
		11..14 | ForEach-Object { $SplitString[$_] = $mask30 }						#Address Line 1 / Address Line 2 / Address Line 3 / Address Line 4		
		$SplitString[15] = $mask08													#Post Code		
		$SplitString[22] = $mask50													#Salutation
		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'CLAIAUTINC') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[2] = $mask30													#Customer Name
		

		
		$SplitString -Join '|'
		
    }
		elseif ($_.Substring(0,10) -eq 'PLCYCLIENT') 												
	{ 
		$SplitString = $_.Split('|')
		
		$SplitString[2] = $mask50													#Customer Name
		$SplitString[21] = $mask08													#PPS Number
		$SplitString[23] = $mask50													#Email Address
		
		$SplitString -Join '|'
		
    }
	
	else {
	$_
	}

	
  } | 
  Out-File "E:\TEMPWORK\y317\PS\ML2K_PCLOAS.ILS.I0.BLK5NBPN.G1233V00-Output.DAT" -Encoding ASCII