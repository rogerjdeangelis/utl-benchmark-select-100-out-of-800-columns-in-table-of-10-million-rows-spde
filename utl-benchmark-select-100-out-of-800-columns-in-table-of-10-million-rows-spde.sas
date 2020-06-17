Benchmark select 100 out of 800 columns in table of 10 million rows spde                                                        
                                                                                                                                
github                                                                                                                          
https://tinyurl.com/ycewrz7z                                                                                                    
https://github.com/rogerjdeangelis/utl-benchmark-select-100-out-of-800-columns-in-table-of-10-million-rows-spde                 
                                                                                                                                
     Benchmarks               Seconds                                                                                           
                                                                                                                                
         a. Engine SPDE         36      * I can speed this up a little but why)                                                 
         b. Engine V9          136                                                                                              
                                                                                                                                
Run on a $1,000 Dell T7610 with 128gb ram, 16 cores(32 threads), Dual XEON 3.5Gz, and NVMe Drives                               
                                                                                                                                
SAS-L                                                                                                                           
https://listserv.uga.edu/cgi-bin/wa?A2=SAS-L;c46978d4.2006c                                                                     
                                                                                                                                
Looks like you have been stung by the hive.                                                                                     
                                                                                                                                
I was going to partition the input and mutitask (run 16 parallel tasks)                                                         
but 35 second runtime does not demad it.                                                                                        
                                                                                                                                
Incodentally it took 4 times longer without SPDE.                                                                               
*_                   _                                                                                                          
(_)_ __  _ __  _   _| |_                                                                                                        
| | '_ \| '_ \| | | | __|                                                                                                       
| | | | | |_) | |_| | |_                                                                                                        
|_|_| |_| .__/ \__,_|\__|                                                                                                       
        |_|                                                                                                                     
;                                                                                                                               
                                                                                                                                
libname spde spde 'f:\wrk\';                                                                                                    
                                                                                                                                
data spde.have_spde;                                                                                                            
                                                                                                                                
  array num[400] n1-n400;                                                                                                       
  array chr[400] $16 c1-c400;                                                                                                   
                                                                                                                                
  do rec=1 to 10e6;                                                                                                             
    do i=1 to 400;                                                                                                              
       num[i]=1234;                                                                                                             
       chr[i]='abcdefghabcdefgh';                                                                                               
    end;                                                                                                                        
    output;                                                                                                                     
  end;                                                                                                                          
  drop rec i;                                                                                                                   
  stop;                                                                                                                         
run;quit;                                                                                                                       
                                                                                                                                
  10 million rows, 800 Columms, 400 Numeric and 400 Charac                                                                      
                                                                                                                                
                                                                                                                                
 The CONTENTS Procedure                                                                                                         
                                                                                                                                
 Data Set Name        SPDE.HAVE_SPDE         Observations          10000000                                                     
 Member Type          DATA                   Variables             800                                                          
 Engine               SPDE                   Indexes               0                                                            
 Created              06/17/2020 08:13:08    Observation Length    9600                                                         
 Last Modified        06/17/2020 08:13:08    Deleted Observations  0                                                            
 Protection                                  Compressed            NO                                                           
 Data Set Type                               Sorted                NO                                                           
                                                                                                                                
                                                                                                                                
   Engine/Host Dependent Information                                                                                            
                                                                                                                                
 Blocking Factor (obs/block)  109                                                                                               
 Data Partsize                133939200                                                                                         
                                                                                                                                
                                                                                                                                
 Alphabetic List of Variables and Attributes                                                                                    
                                                                                                                                
    1    N1          Num       8                                                                                                
    2    N2          Num       8                                                                                                
    3    N3          Num       8                                                                                                
   ...                                                                                                                          
   400    N400        Num       8                                                                                               
                                                                                                                                
   401    C1          Char     16                                                                                               
   402    C2          Char     16                                                                                               
   403    C3          Char     16                                                                                               
   ...                                                                                                                          
   800    C400        Char     16                                                                                               
*            _               _                                                                                                  
  ___  _   _| |_ _ __  _   _| |_                                                                                                
 / _ \| | | | __| '_ \| | | | __|                                                                                               
| (_) | |_| | |_| |_) | |_| | |_                                                                                                
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                               
                |_|                                                                                                             
;                                                                                                                               
                                                                                                                                
   10 million rows, 100 Columms, 50 Numeric and 50 Character                                                                    
                                                                                                                                
Data Set Name        WORK.WANT                     Observations          10000000                                               
Member Type          DATA                          Variables             100                                                    
Engine               V9                            Indexes               0                                                      
Created              06/17/2020 08:21:59           Observation Length    1200                                                   
Last Modified        06/17/2020 08:21:59           Deleted Observations  0                                                      
Protection                                         Compressed            NO                                                     
Data Set Type                                      Sorted                NO                                                     
                                                                                                                                
               Engine/Host Dependent Information                                                                                
                                                                                                                                
Data Set Page Size          65536                                                                                               
Number of Data Set Pages    185186                                                                                              
First Data Page             1                                                                                                   
Max Obs per Page            54                                                                                                  
Obs in First Data Page      46                                                                                                  
Number of Data Set Repairs  0                                                                                                   
ExtendObsCounter            YES                                                                                                 
Filename                    f:\wrk\_TD12612_T7610_\want.sas7bdat                                                                
Release Created             9.0401M6                                                                                            
Host Created                X64_10PRO                                                                                           
File Size                   11GB                                                                                                
File Size (bytes)           12136415232                                                                                         
                                                                                                                                
Alphabetic List of Variables and Attributes                                                                                     
                                                                                                                                
  #    Variable    Type    Len                                                                                                  
                                                                                                                                
  1    N1          Num       8                                                                                                  
  2    N2          Num       8                                                                                                  
  3    N3          Num       8                                                                                                  
 ...                                                                                                                            
 48    N48         Num       8                                                                                                  
 49    N49         Num       8                                                                                                  
 50    N50         Num       8                                                                                                  
...                                                                                                                             
 51    C1          Char     16                                                                                                  
 52    C2          Char     16                                                                                                  
 53    C3          Char     16                                                                                                  
 54    C4          Char     16                                                                                                  
...                                                                                                                             
 97    C47         Char     16                                                                                                  
 98    C48         Char     16                                                                                                  
 99    C49         Char     16                                                                                                  
100    C50         Char     16                                                                                                  
                                                                                                                                
*                                                                                                                               
 _ __  _ __ ___   ___ ___  ___ ___                                                                                              
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                             
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                             
| .__/|_|  \___/ \___\___||___/___/                                                                                             
|_|                                                                                                                             
;                                                                                                                               
                                                                                                                                
data want;                                                                                                                      
                                                                                                                                
  set spde.have_spde(keep=n1-n50 c1-c50);                                                                                       
                                                                                                                                
run;quit;                                                                                                                       
                                                                                                                                
*_                                                                                                                              
| | ___   __ _                                                                                                                  
| |/ _ \ / _` |                                                                                                                 
| | (_) | (_| |                                                                                                                 
|_|\___/ \__, |                                                                                                                 
         |___/                                                                                                                  
;                                                                                                                               
                                                                                                                                
74    data want;                                                                                                                
75      set spde.have_spde(keep=n1-n50 c1-c50);                                                                                 
76    run;                                                                                                                      
                                                                                                                                
NOTE: There were 10,000,000 observations read from the data set SPDE.HAVE_SPDE.                                                 
NOTE: The data set WORK.WANT has 10000000 observations and 100 variables.                                                       
NOTE: DATA statement used (Total process time):                                                                                 
      real time           35.63 seconds                                                                                         
      cpu time            32.76 seconds                                                                                         
                                                                                                                                
76  !     quit;                                                                                                                 
                                                                                                                                
                                                                                                                                
