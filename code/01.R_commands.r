library(haven)

# Create outputs folder if it doesn't exist
if (!dir.exists("C:/CLAUDE/Projects/Project2/output")) {
  dir.create("C:/CLAUDE/Projects/Project2/output")
}

# Log file path
log_file <- file.path("C:/CLAUDE/Projects/Project2/output", "01.R_commands.txt")

# Start logging
sink(log_file, append = FALSE, split = TRUE)

print(2+2) 
print(Sys.time())
# Stop logging
sink()
