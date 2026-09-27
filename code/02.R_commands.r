# Libraries.
library(haven)


# open and start log file.
if (!dir.exists("C:/CLAUDE/Projects/Project2/output")) {
  dir.create("C:/CLAUDE/Projects/Project2/output")
}
log_file <- file.path("C:/CLAUDE/Projects/Project2/output", "02.R_commands.txt")
sink(log_file, append = FALSE, split = TRUE)

#commands.
print(2+2) 
print(4+4) 
#timestamp
print(Sys.time())
# Stop logging
sink()








