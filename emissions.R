#importing dataset
emissions <- read.csv("C:/Users/Administrator/Downloads/archive (1)/emissions.csv", header=FALSE)

# Assign column names from the first row
colnames(emissions) <- emissions[1, ]
# Remove the first row
emissions <- emissions[-1, ]
View(emissions)

# View the first few rows of the dataset
head(emissions)

# Get summary statistics of the dataset
summary(emissions)

# Check the structure of the dataset
str(emissions)

# Example: Selecting specific columns and melting the data
emissions_data <- emissions %>%
  select(Country, Sector, Gas, `2010`:`2018`) %>%
  pivot_longer(cols = `2010`:`2018`, names_to = "Year", values_to = "Emissions")

# Example: Calculate total emissions per country
total_emissions_by_country <- emissions %>%
  group_by(Country) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = TRUE))
print(total_emissions_by_country)

# Create a bar plot of total emissions by country
ggplot(total_emissions_by_country, aes(x = Country, y = Total_Emissions)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Emissions by Country", x = "Country", y = "Total Emissions")



