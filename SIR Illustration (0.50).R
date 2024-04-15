# Initialize parameters
S <- 9000
I <- 1000
R <- 0

alpha1 <- 0.001*0.50
alpha2 <- 1

# Define function for the complete simulation (deterministic)
SIR_manual <- function(S0,I0,R0,alpha1,alpha2,tf,dt=0.01){
  t <- 0
  
  t_vec <- c(t)
  
  S_vec <- c(S0)
  I_vec <- c(I0)
  R_vec <- c(R0)
  
  dS_vec <- c(0)
  dI_vec <- c(0)
  dR_vec <- c(0)
  
  S <- S0
  I <- I0
  R <- R0
  
  while(t<tf){
    # Calculate differentials
    dS <- -alpha1*S*I*dt
    dR <- alpha2*I*dt
    dI <- -dS - dR
    
    # calculate compartments
    S <- S + dS
    I <- I + dI
    R <- R + dR
    
    # Record values
    S_vec <- c(S_vec, S)
    I_vec <- c(I_vec, I)
    R_vec <- c(R_vec, R)
    
    dS_vec <- c(dS_vec, dS)
    dI_vec <- c(dI_vec, dI)
    dR_vec <- c(dR_vec, dR)
    
    # print something so that I know where I am in the simulations
    t <- t + dt
    t_vec <- c(t_vec, t)
    
    current_prog <- (t)/tf
    print(paste0("Current progress is ", 100*current_prog, "%"))
  }
  
  out <- data.frame(t_vec, S_vec, I_vec, R_vec, dS_vec, dI_vec, dR_vec)
  return(out)
}


sample_output <- SIR_manual(S,I,R,alpha1,alpha2,23)

# Draw some basic plots
library(ggplot2)
library(ggplot2)
plt1 <- ggplot(data = sample_output) + 
  geom_point(mapping = aes(x=t_vec, y=S_vec), color="green") +
  geom_point(mapping = aes(x=t_vec, y=I_vec), color="red") +
  geom_point(mapping = aes(x=t_vec, y=R_vec), color="blue") +
  xlab("Time") + 
  ylab("Number of Borrowers")
plt1

