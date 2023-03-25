# Libraries
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("plotly")
# install.packages("hrbrthemes")

library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)

# Load dataset
data <- read.csv("data/chronology.csv")
# data <- read.csv("data/music_2.csv")

f <- list(
  family = "Arial, monospace",
  size = 12,
  color = "#7f7f7f"
)
x <- list(
  title = "Giorni <br> Fonte: <b>L. Picciotto, <i>Libro della Memoria. Gli ebrei deportati dall’Italia (1943-1945).</b> Milano, Mursia, 2a ed., 2002</i>",
  titlefont = f
)
y <- list(
  title = "Arresti",
  titlefont = f
)

# annotations
a <- list(
  text = "Periodo: 1943-1945.</b></i>",
  
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.8,
  y = 0.985,
  showarrow = FALSE
)

b <- list(
  text = "",
  font = f,
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.5,
  y = 0.95,
  showarrow = FALSE
)


# Area chart with 2 groups
p <- plot_ly(x = data$arrestDate, 
             y = data$tutti,
             type="scatter", 
             mode="markers", 
             fill = "tozeroy",
             name = "Tutti gli arresti") 

p <- p %>% add_trace(y = data$italiani, 
                     name = "Arresti compiuti da italiani") 

p <- p %>% add_trace(y = data$tedeschi, 
                     name = "Arresti compiuti da tedeschi") 

p <- p %>% add_trace(y = data$nazifascisti, 
                     name = "Arresti compiuti da tedeschi e italiani") 

p <- p %>% add_trace(y = data$sconosciuto, 
                     name = "Arresti di cui non si conoscono gli autori") 

p <- p %>% layout(xaxis = x, 
                  yaxis = y, 
                  title= "<b>Statistica degli ebrei arrestati nella città di Milano</b>", 
                  annotations = list(a, b))

p

