# Read dataset and standardize variable names

# Set ASD_DATA_PATH to the authorized restricted CSV file before running.
# Example: Sys.setenv(ASD_DATA_PATH = "C:/path/to/asd_newvar_merged.csv")
data_path <- Sys.getenv("ASD_DATA_PATH", unset = "")
if (!nzchar(data_path) || !file.exists(data_path)) {
  stop("Set ASD_DATA_PATH to an existing, authorized restricted input CSV file.")
}
df <- read_csv(data_path) |>
  janitor::clean_names()

glimpse(df)

# Re-clean column names
df <- df |> clean_names()

# Define ASD outcome variable
# Children linked to DDS records (aut_levl = 1) are classified as ASD cases.
# Children without DDS linkage (aut_levl = NA) are classified as non-ASD.

df <- df |> 
  mutate(
    ASD = ifelse(is.na(aut_levl), 0, aut_levl)
  )

# Extract birth year from date
df <- df |> 
  mutate(
    birth_date = mdy(b_bthday),
    Year = year(birth_date)
  )

# Define Asian subgroup mapping
race_map <- c(
  `40`="Asian-Unspecified",
  `41`="Asian-Specified",
  `42`="Chinese",
  `43`="Japanese",
  `44`="Korean",
  `45`="Vietnamese",
  `46`="Cambodian",
  `47`="Thai",
  `48`="Laotian",
  `49`="Hmong",
  `52`="Indian",
  `53`="Filipino"
)

df <- df |> 
  mutate(
    Race_Label = race_map[as.character(b_mrace1)]
  )

# Retain Asian subgroups only
df <- df |> 
  filter(!is.na(Race_Label))