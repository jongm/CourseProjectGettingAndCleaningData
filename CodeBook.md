#Code Book

####Data

This data was collected measuring the acceleration and angular velocity of different individuals while performing certain physical activities. Each individual was carrying a smartphone with an integrated accelerometer and gyroscope to perform the measures.

####Variables

- Subject: id of each individual that participated in the experiments. There were 30 participants in total.
- Activity: name of the physical activity that the individual was performing while the measure was taken.
- Measurements: contains the averages of 81 of the original measurements according to each subject and activity.

Measurements are defined in the following way:
- The prefix "Time" or "Freq" indicates if the variable is a time domain signal or a frequency domain signal.
- "Body" or "Gravity" indicate if the acceleration signal came from the body of the subject or from gravity.
- "Accelerometer" or "Gyroscope" indicate the device that took the measurement.
- "(Mean)" or "(Std)" indicate if the given measure is the mean of the original measurement or its standard deviation.
- "X", "Y" or "Z" indicate the axis that is being measured by the device.
- "Jerk" indicates that the variable is a Jerk signal of the original linear acceleration or angular velocity.
- "Mag" indicates that the variable is the magnitude of the measurement according to the Euclidean norm.
