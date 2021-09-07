# This is an example R script

# Here I load the libraries/packages I need:
library(ggplot2)
library(dplyr)

# Here I read my data set:
my_data_set <- read.csv(
  file.path("data", "iris.csv")
)

# Now I am going to make a graph about some Iris petal data
my_graph <- ggplot(my_data_set) +
  aes(x = Sepal.Length, y = Sepal.Width, color = Species) +
  geom_point() +
  theme_minimal() +
  ggtitle("Sepal length and width for different iris species") +
  xlab("Length") +
  ylab("Width") +
  scale_color_manual(values = c("magenta4", "orangered2", "turquoise4"))

# Here I will save my graph
ggsave(file.path("example_scripts", "iris_graph.png"))

# Here I will summarize my data and then save it as a CSV
summarized_data <- my_data_set %>%
  group_by(Species) %>%
  summarize(
    mean_petal_length = mean(Petal.Length),
    mean_metal_width  = mean(Petal.Width)
  )
write.csv(
  summarized_data, 
  file.path("data", "summarized_iris.csv"),
  row.names = FALSE
)
  

