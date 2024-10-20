library(cleaningtools)
library(dplyr)

my_raw_dataset <- cleaningtools::cleaningtools_raw_data
my_kobo_survey <- cleaningtools::cleaningtools_survey
my_kobo_choice <- cleaningtools::cleaningtools_choices

# PRÁCTICA 1
my_raw_dataset %>% 
  check_pii(uuid_column = "X_uuid")

# PRÁCTICA 2
missing <- my_raw_dataset %>%
  add_percentage_missing(kobo_survey = my_kobo_survey)

missing %>%
  check_percentage_missing(uuid_colum="X_uuid")

logical_check_list <- readxl::read_excel("./Curso Impact R framework/inputs/02 - check_list.xlsx")
logical_check_list

example_logic2 <- my_raw_dataset %>% 
  check_logical_with_list(uuid_column = "X_uuid",
                          list_of_check = logical_check_list,
                          check_id_column = "check_id",
                          check_to_perform_column = "check_to_perform",
                          columns_to_clean_column = "columns_to_clean",
                          description_column = "description")

example_logic2$logical_all %>% 
  head()