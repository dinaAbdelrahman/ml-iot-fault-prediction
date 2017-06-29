WITH machinelearning AS (
   SELECT EventEnqueuedUtcTime,
        batchID,
        IoTHub.ConnectionDeviceId,
        Time, 
        CAST([Fermentation volume] AS FLOAT) as [Fermentation volume], 
        CAST([Dissolved oxygen concentration] AS FLOAT) as [Dissolved oxygen concentration], 
        CAST([Dissolved CO2 concentration] AS FLOAT) as [Dissolved CO2 concentration], 
        CAST([Reactor temperature] AS FLOAT) as [Reactor temperature], 
        CAST(pH AS FLOAT) as pH, 
        CAST([Feed rate] AS FLOAT) as [Feed rate] , 
        CAST([Feed temperature] AS FLOAT) as [Feed temperature], 
        CAST([Agitator power] AS FLOAT) as [Agitator power], 
        CAST([Cooling/heating medium flow rate] AS FLOAT) as [Cooling/heating medium flow rate], 
        CAST([Cumulative Base flow] AS FLOAT) as [Cumulative Base flow], 
        CAST([Cumulative Acid flow] AS FLOAT) as [Cumulative Acid flow], 
   batchcheck (Time,
            [Fermentation volume], 
            [Dissolved oxygen concentration], 
            [Dissolved CO2 concentration], 
            [Reactor temperature], 
            pH , 
            [Feed rate], 
            [Feed temperature] , 
            [Agitator power] , 
            [Cooling/heating medium flow rate] , 
            [Cumulative Base flow] , 
            [Cumulative Acid flow],  
            [Fermentation volume prior1], 
            [Dissolved oxygen concentration prior1], 
            [Dissolved CO2 concentration prior1], 
            [Reactor temperature prior1], 
            [pH prior1] , 
            [Feed rate prior1], 
            [Feed temperature prior1] , 
            [Agitator power prior1] , 
            [Cooling/heating medium flow rate prior1] , 
            [Cumulative Base flow prior1] , 
            [Cumulative Acid flow prior1],
            [Fermentation volume prior2], 
            [Dissolved oxygen concentration prior2], 
            [Dissolved CO2 concentration prior2], 
            [Reactor temperature prior2], 
            [pH prior2] , 
            [Feed rate prior2], 
            [Feed temperature prior2] , 
            [Agitator power prior2] , 
            [Cooling/heating medium flow rate prior2] , 
            [Cumulative Base flow prior2], 
            [Cumulative Acid flow prior2]
            ) as [Probability Normal] 
   from [inputdata]
)
Select EventEnqueuedUtcTime,
        ConnectionDeviceId,
        batchID,
        Time, 
        [Fermentation volume], 
        [Dissolved oxygen concentration], 
        [Dissolved CO2 concentration], 
        [Reactor temperature], 
        pH , 
        [Feed rate], 
        [Feed temperature] , 
        [Agitator power] , 
        [Cooling/heating medium flow rate] , 
        [Cumulative Base flow] , 
        [Cumulative Acid flow], 
        [Probability Normal]
Into [outputdata]
From machinelearning

Select EventEnqueuedUtcTime,
        ConnectionDeviceId,
        batchID,
        Time, 
        [Fermentation volume], 
        [Dissolved oxygen concentration], 
        [Dissolved CO2 concentration], 
        [Reactor temperature], 
        pH , 
        [Feed rate], 
        [Feed temperature] , 
        [Agitator power] , 
        [Cooling/heating medium flow rate] , 
        [Cumulative Base flow] , 
        [Cumulative Acid flow], 
        [Probability Normal]
Into [powerbiout]
From machinelearning