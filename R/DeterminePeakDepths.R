
# Define a function that determines the reads depths for the extended peaks
DeterminePeakDepths <-function(bedtools,bedtoolsgenome,extendreads,tagAlignfile,
                               tagAlignfileExt,peaksfileslop,temppeakoverlap, verbose = FALSE)
{
  # overlap the peak and tagAlign files
  cmd1 = paste(bedtools," slop -l 0 -r ", extendreads ," -s -i ",tagAlignfile, " -g ",bedtoolsgenome, " > ", tagAlignfileExt,sep="")
  if(verbose  == TRUE){
  	print(cmd1)
  }
  system(cmd1)
  cmd2 = paste(bedtools, " intersect -wo -a ",tagAlignfileExt," -b " , peaksfileslop, " > " ,temppeakoverlap ,sep = "")
  if(verbose  == TRUE){
  	print(cmd2)
  }
  system(cmd2)
  
  # make a new peak file with depth info
  DeterminePeakDepthsC(temppeakoverlap,peaksfileslopdepth)
}
