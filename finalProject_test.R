setwd("~/Documents/Documents - Gregory’s Mac mini/GitHub/LIS5937")
library(ggplot2)
library(gridExtra)

#Variables to include in s4 objects: Height (in cm), weight (in kg), age (in years), gender (M or F),
athlete <- setClass("athlete",
                    slots=list(
                      name="character",
                      height="numeric",
                      weight="numeric",
                      age="numeric",
                      gender="character"
                    ))

Greg <- new("athlete", name="Greg Foster", height=176, weight=70, age=22, gender="Male")
init_prog()
#Natasha <- new("athlete", name="Natasha Swiss", height=176, weight=55, age=22, gender="Female")


setMethod("show",
          "athlete",
          function(object){
            cat("Physical Stats for", object@name, ":\n")
            cat("Height:", object@height, "cm\n")
            cat("Weight:", object@weight, "kg\n")
            cat("Age:", object@age, "\n")
            cat("Gender:", object@gender, "\n")
            cat("=============================\n")
            if (object@gender == "Male") {
              cat("Basal Metabolic Rate:", ((10*object@weight) + (6.25*object@height) - (5*object@age)) + 5, "Calories per day")
              Basal_Metabolic_Rate <<- ((10*object@weight) + (6.25*object@height) - (5*object@age)) + 5
              }
            else {
              cat("Basal Metabolic Rate:", ((10*object@weight) + (6.25*object@height) - (5*object@age)) - 161, "Calories per day")
              Basal_Metabolic_Rate <<- ((10*object@weight) + (6.25*object@height) - (5*object@age)) - 161
            }
          })


Greg
#Natasha

#Initialize Calorie and Weight Vectors (can also be used to reset progress stats when needed)
init_prog <- function() {
  wvec <<- c()
  intakes <<- c()
}

init_prog()


#Daily Caloric Intake Tracker
intake_tracker <- function(c) {
  intakes <<- c(intakes, c)
  days <<- c(1:length(intakes))
  cdf <<- data.frame(days, intakes)
  ggplot(data=cdf, aes(days, intakes, col=intakes)) +
    geom_line() +
    geom_point() +
    labs(title = "Daily Caloric Intake") +
    xlab("Days") +
    ylab("Calories (Kcal)") +
    geom_hline(aes(yintercept=Basal_Metabolic_Rate), color="green", linetype="dashed") +
    geom_text(aes(0,Basal_Metabolic_Rate,label = "BMR", vjust = -1)) +
    theme_bw() +
    theme(legend.title = "Calories")
    theme(plot.title = element_text(hjust = 0.5))
}

intake_tracker(2100)
intake_tracker(2150)
intake_tracker(2100)
intake_tracker(2200)
intake_tracker(2100)
intake_tracker(2050)
intake_tracker(2130)
intake_tracker(2100)
intake_tracker(2150)
intake_tracker(2100)
intake_tracker(2200)
intake_tracker(2100)
intake_tracker(2050)
intake_tracker(2130)
intake_tracker(2100)
intake_tracker(2150)
intake_tracker(2100)
intake_tracker(2200)
intake_tracker(2100)
intake_tracker(2050)
intake_tracker(2130)
intake_tracker(2100)
intake_tracker(2150)
intake_tracker(2100)
intake_tracker(2200)
intake_tracker(2100)
intake_tracker(2050)
intake_tracker(2130)

#Weekly Weight Tracker
#Generates Plot of Weekly Weights, Shows Progress Towards Goal

weight_tracker <- function(w,g) {
  weights <<- c(weights, w)
  x <<- c(1:length(weights))
  wdf <<- data.frame(x, weights)
  ggplot(data=wdf, aes(x, weights, col=weights)) +
    geom_line() +
    geom_point() +
    labs(title = "Weekly Body Weight Progression") +
    xlab("Weeks") +
    ylab("Bodyweight (kg)") +
    geom_hline(aes(yintercept=g), color="green", linetype="dashed") +
    geom_text(aes(0,g,label = "Goal", vjust = -1)) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5))

}

weight_tracker(70,72)
weight_tracker(70.5,72)
weight_tracker(71,72)
weight_tracker(71.5,72)
weight_tracker(72,72)

weight_calorie_matrix <- function() {
  wplot <- ggplot(data=wdf, aes(x, weights, col=weights)) +
              geom_line() +
              geom_point() +
              labs(title = "Weekly Body Weight Progression") +
              xlab("Weeks") +
              ylab("Bodyweight (kg)") +
              theme_bw() +
              theme(plot.title = element_text(hjust = 0.5))
  cplot <- ggplot(data=cdf, aes(days, intakes, col=intakes)) +
    geom_line() +
    geom_point() +
    labs(title = "Daily Caloric Intake") +
    xlab("Days") +
    ylab("Calories (Kcal)") +
    geom_hline(aes(yintercept=Basal_Metabolic_Rate), color="green", linetype="dashed") +
    geom_text(aes(0,Basal_Metabolic_Rate,label = "BMR", vjust = -1)) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5))
  grid.arrange(wplot, cplot, ncol = 2)
}

weight_calorie_matrix()

#Once body weight changes by a couple of pounds, use this function to change your profile stat:
Greg@weight <- 72
Greg


