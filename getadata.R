
data_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
data_folder <- 'data'
temp_destfile_zip <- paste(data_folder, '/household_power_consumption.zip', sep='')
temp_destfile_txt <- paste(data_folder, '/household_power_consumption.txt', sep='')
file_col_classes <- c(rep('character',2), rep('numeric', 7))

# get the read the data.frame for this file
read_power_consumption <- function() {
  get_and_extract_data()
  my_data <- read.table(temp_destfile_txt, sep=';', header=TRUE,
             colClasses=file_col_classes, na.strings='?')
  # apply filter to return only those two dataes
  my_data[my_data$Date == "1/2/2007" | my_data$Date == '2/2/2007',]
}

# function used to get and extract the data into local filesystem if
# is not already loaded
get_and_extract_data <- function(){
  # create folder if does not exists
  if(!file.exists(data_folder)) {
    dir.create(data_folder)
  }

  # donwlod file if is not downloaded
  if(!file.exists(temp_destfile_zip)){
    download.file(data_url, destfile=temp_destfile_zip, method='curl')
  }

  # unzip file if is not unziped
  if(!file.exists(temp_destfile_txt)){
    unzip(temp_destfile_zip,exdir=data_folder)
  }
}
