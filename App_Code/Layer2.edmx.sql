
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/24/2012 17:07:56
-- Generated from EDMX file: C:\Users\Lienhart\Documents\Repos\Project-LimitBreaker\App_Code\Layer2.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [bts530_123a01];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_LoggedExerciseSetAttributes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SetAttributes] DROP CONSTRAINT [FK_LoggedExerciseSetAttributes];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledExerciseExercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledExercises] DROP CONSTRAINT [FK_ScheduledExerciseExercise];
GO
IF OBJECT_ID(N'[dbo].[FK_RoutineExerciseGoal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ExerciseGoals] DROP CONSTRAINT [FK_RoutineExerciseGoal];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledRoutineRoutine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledRoutines] DROP CONSTRAINT [FK_ScheduledRoutineRoutine];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledExerciseScheduledReminder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledExercises] DROP CONSTRAINT [FK_ScheduledExerciseScheduledReminder];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledRoutineScheduledReminder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledRoutines] DROP CONSTRAINT [FK_ScheduledRoutineScheduledReminder];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledExerciseLimitBreaker]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledExercises] DROP CONSTRAINT [FK_ScheduledExerciseLimitBreaker];
GO
IF OBJECT_ID(N'[dbo].[FK_LimitBreakerEmailNotification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notifications_EmailNotification] DROP CONSTRAINT [FK_LimitBreakerEmailNotification];
GO
IF OBJECT_ID(N'[dbo].[FK_LimitBreakerStatistics]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LimitBreakers] DROP CONSTRAINT [FK_LimitBreakerStatistics];
GO
IF OBJECT_ID(N'[dbo].[FK_LimitBreakerRoutine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Routines] DROP CONSTRAINT [FK_LimitBreakerRoutine];
GO
IF OBJECT_ID(N'[dbo].[FK_LimitBreakerScheduledRoutine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledRoutines] DROP CONSTRAINT [FK_LimitBreakerScheduledRoutine];
GO
IF OBJECT_ID(N'[dbo].[FK_LimitBreakerLoggedExercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LoggedExercises] DROP CONSTRAINT [FK_LimitBreakerLoggedExercise];
GO
IF OBJECT_ID(N'[dbo].[FK_LoggedExerciseRoutine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LoggedExercises] DROP CONSTRAINT [FK_LoggedExerciseRoutine];
GO
IF OBJECT_ID(N'[dbo].[FK_ExerciseLoggedExercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LoggedExercises] DROP CONSTRAINT [FK_ExerciseLoggedExercise];
GO
IF OBJECT_ID(N'[dbo].[FK_ExerciseGoalExerciseBase]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ExerciseGoals] DROP CONSTRAINT [FK_ExerciseGoalExerciseBase];
GO
IF OBJECT_ID(N'[dbo].[FK_ExerciseExerciseExp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ExerciseExps] DROP CONSTRAINT [FK_ExerciseExerciseExp];
GO
IF OBJECT_ID(N'[dbo].[FK_SetAttributesExerciseGoal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ExerciseGoals] DROP CONSTRAINT [FK_SetAttributesExerciseGoal];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledReminder_inherits_Notification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notifications_ScheduledReminder] DROP CONSTRAINT [FK_ScheduledReminder_inherits_Notification];
GO
IF OBJECT_ID(N'[dbo].[FK_EmailNotification_inherits_Notification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notifications_EmailNotification] DROP CONSTRAINT [FK_EmailNotification_inherits_Notification];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Exercises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Exercises];
GO
IF OBJECT_ID(N'[dbo].[ScheduledExercises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduledExercises];
GO
IF OBJECT_ID(N'[dbo].[LoggedExercises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoggedExercises];
GO
IF OBJECT_ID(N'[dbo].[SetAttributes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SetAttributes];
GO
IF OBJECT_ID(N'[dbo].[ExerciseGoals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ExerciseGoals];
GO
IF OBJECT_ID(N'[dbo].[Routines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Routines];
GO
IF OBJECT_ID(N'[dbo].[ScheduledRoutines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduledRoutines];
GO
IF OBJECT_ID(N'[dbo].[LevelFormulas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LevelFormulas];
GO
IF OBJECT_ID(N'[dbo].[ExperienceAtrophies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ExperienceAtrophies];
GO
IF OBJECT_ID(N'[dbo].[Notifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notifications];
GO
IF OBJECT_ID(N'[dbo].[LimitBreakers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LimitBreakers];
GO
IF OBJECT_ID(N'[dbo].[Statistics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Statistics];
GO
IF OBJECT_ID(N'[dbo].[ExerciseExps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ExerciseExps];
GO
IF OBJECT_ID(N'[dbo].[Notifications_ScheduledReminder]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notifications_ScheduledReminder];
GO
IF OBJECT_ID(N'[dbo].[Notifications_EmailNotification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notifications_EmailNotification];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Exercises'
CREATE TABLE [dbo].[Exercises] (
    [name] nvarchar(max)  NOT NULL,
    [equipment] nvarchar(max)  NULL,
    [videoLink] nvarchar(max)  NULL,
    [rep] bit  NOT NULL,
    [weight] bit  NOT NULL,
    [distance] bit  NOT NULL,
    [time] bit  NOT NULL,
    [enabled] bit  NOT NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [muscleGroups] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ScheduledExercises'
CREATE TABLE [dbo].[ScheduledExercises] (
    [startTime] datetime  NOT NULL,
    [NeedEmailNotification] bit  NOT NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [ExerciseBase_id] int  NOT NULL,
    [ScheduledReminders_id] int  NOT NULL,
    [LimitBreakers_id] int  NOT NULL
);
GO

-- Creating table 'LoggedExercises'
CREATE TABLE [dbo].[LoggedExercises] (
    [sets] smallint  NOT NULL,
    [timeLogged] datetime  NOT NULL,
    [note] nvarchar(max)  NULL,
    [id] bigint IDENTITY(1,1) NOT NULL,
    [LimitBreaker_id] int  NOT NULL,
    [Routine_id] int  NULL,
    [ExerciseBase_id] int  NOT NULL
);
GO

-- Creating table 'SetAttributes'
CREATE TABLE [dbo].[SetAttributes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [weight] float  NULL,
    [distance] float  NULL,
    [time] bigint  NULL,
    [reps] smallint  NULL,
    [LoggedExercise_id] bigint  NOT NULL
);
GO

-- Creating table 'ExerciseGoals'
CREATE TABLE [dbo].[ExerciseGoals] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Routine_id] int  NOT NULL,
    [ExerciseBase_id] int  NOT NULL,
    [SetAttribute_id] int  NOT NULL
);
GO

-- Creating table 'Routines'
CREATE TABLE [dbo].[Routines] (
    [id] int IDENTITY(1,1) NOT NULL,
    [last_modified] datetime  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [LimitBreaker_id] int  NOT NULL
);
GO

-- Creating table 'ScheduledRoutines'
CREATE TABLE [dbo].[ScheduledRoutines] (
    [id] int IDENTITY(1,1) NOT NULL,
    [NeedEmailNotification] bit  NOT NULL,
    [startTime] datetime  NOT NULL,
    [Routine_id] int  NOT NULL,
    [ScheduledReminders_id] int  NOT NULL,
    [LimitBreaker_id] int  NOT NULL
);
GO

-- Creating table 'LevelFormulas'
CREATE TABLE [dbo].[LevelFormulas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [maxLevel] int  NOT NULL,
    [expModifier] float  NOT NULL,
    [baseRequired] float  NOT NULL
);
GO

-- Creating table 'ExperienceAtrophies'
CREATE TABLE [dbo].[ExperienceAtrophies] (
    [id] int IDENTITY(1,1) NOT NULL,
    [graceDays] int  NOT NULL,
    [baseLoss] float  NOT NULL
);
GO

-- Creating table 'Notifications'
CREATE TABLE [dbo].[Notifications] (
    [id] int IDENTITY(1,1) NOT NULL,
    [dateCreated] datetime  NOT NULL,
    [dateToBeSent] datetime  NOT NULL,
    [userEmail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LimitBreakers'
CREATE TABLE [dbo].[LimitBreakers] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL,
    [gender] nvarchar(max)  NOT NULL,
    [dateOfBirth] datetime  NOT NULL,
    [verified] bit  NOT NULL,
    [deactivated] bit  NOT NULL,
    [role] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [lastTimeSuggestionMade] datetime  NOT NULL,
    [Statistics_id] int  NOT NULL
);
GO

-- Creating table 'Statistics'
CREATE TABLE [dbo].[Statistics] (
    [id] int IDENTITY(1,1) NOT NULL,
    [level] int  NOT NULL,
    [experience] float  NOT NULL,
    [weight] float  NOT NULL,
    [height] float  NOT NULL,
    [rmr] float  NOT NULL,
    [bmr] float  NOT NULL,
    [vo2MAX] float  NOT NULL
);
GO

-- Creating table 'ExerciseExps'
CREATE TABLE [dbo].[ExerciseExps] (
    [baseExperience] float  NOT NULL,
    [weightModifier] float  NOT NULL,
    [repModifier] float  NOT NULL,
    [distanceModifier] float  NOT NULL,
    [timeModifier] float  NOT NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [Exercise_id] int  NOT NULL
);
GO

-- Creating table 'Notifications_ScheduledReminder'
CREATE TABLE [dbo].[Notifications_ScheduledReminder] (
    [message] nvarchar(max)  NOT NULL,
    [id] int  NOT NULL
);
GO

-- Creating table 'Notifications_EmailNotification'
CREATE TABLE [dbo].[Notifications_EmailNotification] (
    [message] nvarchar(max)  NOT NULL,
    [id] int  NOT NULL,
    [LimitBreaker_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Exercises'
ALTER TABLE [dbo].[Exercises]
ADD CONSTRAINT [PK_Exercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [PK_ScheduledExercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [PK_LoggedExercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'SetAttributes'
ALTER TABLE [dbo].[SetAttributes]
ADD CONSTRAINT [PK_SetAttributes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [PK_ExerciseGoals]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Routines'
ALTER TABLE [dbo].[Routines]
ADD CONSTRAINT [PK_Routines]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [PK_ScheduledRoutines]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'LevelFormulas'
ALTER TABLE [dbo].[LevelFormulas]
ADD CONSTRAINT [PK_LevelFormulas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ExperienceAtrophies'
ALTER TABLE [dbo].[ExperienceAtrophies]
ADD CONSTRAINT [PK_ExperienceAtrophies]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Notifications'
ALTER TABLE [dbo].[Notifications]
ADD CONSTRAINT [PK_Notifications]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'LimitBreakers'
ALTER TABLE [dbo].[LimitBreakers]
ADD CONSTRAINT [PK_LimitBreakers]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Statistics'
ALTER TABLE [dbo].[Statistics]
ADD CONSTRAINT [PK_Statistics]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ExerciseExps'
ALTER TABLE [dbo].[ExerciseExps]
ADD CONSTRAINT [PK_ExerciseExps]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Notifications_ScheduledReminder'
ALTER TABLE [dbo].[Notifications_ScheduledReminder]
ADD CONSTRAINT [PK_Notifications_ScheduledReminder]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Notifications_EmailNotification'
ALTER TABLE [dbo].[Notifications_EmailNotification]
ADD CONSTRAINT [PK_Notifications_EmailNotification]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LoggedExercise_id] in table 'SetAttributes'
ALTER TABLE [dbo].[SetAttributes]
ADD CONSTRAINT [FK_LoggedExerciseSetAttributes]
    FOREIGN KEY ([LoggedExercise_id])
    REFERENCES [dbo].[LoggedExercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LoggedExerciseSetAttributes'
CREATE INDEX [IX_FK_LoggedExerciseSetAttributes]
ON [dbo].[SetAttributes]
    ([LoggedExercise_id]);
GO

-- Creating foreign key on [ExerciseBase_id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [FK_ScheduledExerciseExercise]
    FOREIGN KEY ([ExerciseBase_id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledExerciseExercise'
CREATE INDEX [IX_FK_ScheduledExerciseExercise]
ON [dbo].[ScheduledExercises]
    ([ExerciseBase_id]);
GO

-- Creating foreign key on [Routine_id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [FK_RoutineExerciseGoal]
    FOREIGN KEY ([Routine_id])
    REFERENCES [dbo].[Routines]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoutineExerciseGoal'
CREATE INDEX [IX_FK_RoutineExerciseGoal]
ON [dbo].[ExerciseGoals]
    ([Routine_id]);
GO

-- Creating foreign key on [Routine_id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [FK_ScheduledRoutineRoutine]
    FOREIGN KEY ([Routine_id])
    REFERENCES [dbo].[Routines]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledRoutineRoutine'
CREATE INDEX [IX_FK_ScheduledRoutineRoutine]
ON [dbo].[ScheduledRoutines]
    ([Routine_id]);
GO

-- Creating foreign key on [ScheduledReminders_id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [FK_ScheduledExerciseScheduledReminder]
    FOREIGN KEY ([ScheduledReminders_id])
    REFERENCES [dbo].[Notifications_ScheduledReminder]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledExerciseScheduledReminder'
CREATE INDEX [IX_FK_ScheduledExerciseScheduledReminder]
ON [dbo].[ScheduledExercises]
    ([ScheduledReminders_id]);
GO

-- Creating foreign key on [ScheduledReminders_id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [FK_ScheduledRoutineScheduledReminder]
    FOREIGN KEY ([ScheduledReminders_id])
    REFERENCES [dbo].[Notifications_ScheduledReminder]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledRoutineScheduledReminder'
CREATE INDEX [IX_FK_ScheduledRoutineScheduledReminder]
ON [dbo].[ScheduledRoutines]
    ([ScheduledReminders_id]);
GO

-- Creating foreign key on [LimitBreakers_id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [FK_ScheduledExerciseLimitBreaker]
    FOREIGN KEY ([LimitBreakers_id])
    REFERENCES [dbo].[LimitBreakers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledExerciseLimitBreaker'
CREATE INDEX [IX_FK_ScheduledExerciseLimitBreaker]
ON [dbo].[ScheduledExercises]
    ([LimitBreakers_id]);
GO

-- Creating foreign key on [LimitBreaker_id] in table 'Notifications_EmailNotification'
ALTER TABLE [dbo].[Notifications_EmailNotification]
ADD CONSTRAINT [FK_LimitBreakerEmailNotification]
    FOREIGN KEY ([LimitBreaker_id])
    REFERENCES [dbo].[LimitBreakers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerEmailNotification'
CREATE INDEX [IX_FK_LimitBreakerEmailNotification]
ON [dbo].[Notifications_EmailNotification]
    ([LimitBreaker_id]);
GO

-- Creating foreign key on [Statistics_id] in table 'LimitBreakers'
ALTER TABLE [dbo].[LimitBreakers]
ADD CONSTRAINT [FK_LimitBreakerStatistics]
    FOREIGN KEY ([Statistics_id])
    REFERENCES [dbo].[Statistics]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerStatistics'
CREATE INDEX [IX_FK_LimitBreakerStatistics]
ON [dbo].[LimitBreakers]
    ([Statistics_id]);
GO

-- Creating foreign key on [LimitBreaker_id] in table 'Routines'
ALTER TABLE [dbo].[Routines]
ADD CONSTRAINT [FK_LimitBreakerRoutine]
    FOREIGN KEY ([LimitBreaker_id])
    REFERENCES [dbo].[LimitBreakers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerRoutine'
CREATE INDEX [IX_FK_LimitBreakerRoutine]
ON [dbo].[Routines]
    ([LimitBreaker_id]);
GO

-- Creating foreign key on [LimitBreaker_id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [FK_LimitBreakerScheduledRoutine]
    FOREIGN KEY ([LimitBreaker_id])
    REFERENCES [dbo].[LimitBreakers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerScheduledRoutine'
CREATE INDEX [IX_FK_LimitBreakerScheduledRoutine]
ON [dbo].[ScheduledRoutines]
    ([LimitBreaker_id]);
GO

-- Creating foreign key on [LimitBreaker_id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [FK_LimitBreakerLoggedExercise]
    FOREIGN KEY ([LimitBreaker_id])
    REFERENCES [dbo].[LimitBreakers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerLoggedExercise'
CREATE INDEX [IX_FK_LimitBreakerLoggedExercise]
ON [dbo].[LoggedExercises]
    ([LimitBreaker_id]);
GO

-- Creating foreign key on [Routine_id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [FK_LoggedExerciseRoutine]
    FOREIGN KEY ([Routine_id])
    REFERENCES [dbo].[Routines]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LoggedExerciseRoutine'
CREATE INDEX [IX_FK_LoggedExerciseRoutine]
ON [dbo].[LoggedExercises]
    ([Routine_id]);
GO

-- Creating foreign key on [ExerciseBase_id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [FK_ExerciseLoggedExercise]
    FOREIGN KEY ([ExerciseBase_id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExerciseLoggedExercise'
CREATE INDEX [IX_FK_ExerciseLoggedExercise]
ON [dbo].[LoggedExercises]
    ([ExerciseBase_id]);
GO

-- Creating foreign key on [ExerciseBase_id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [FK_ExerciseGoalExerciseBase]
    FOREIGN KEY ([ExerciseBase_id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExerciseGoalExerciseBase'
CREATE INDEX [IX_FK_ExerciseGoalExerciseBase]
ON [dbo].[ExerciseGoals]
    ([ExerciseBase_id]);
GO

-- Creating foreign key on [Exercise_id] in table 'ExerciseExps'
ALTER TABLE [dbo].[ExerciseExps]
ADD CONSTRAINT [FK_ExerciseExerciseExp]
    FOREIGN KEY ([Exercise_id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExerciseExerciseExp'
CREATE INDEX [IX_FK_ExerciseExerciseExp]
ON [dbo].[ExerciseExps]
    ([Exercise_id]);
GO

-- Creating foreign key on [SetAttribute_id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [FK_SetAttributesExerciseGoal]
    FOREIGN KEY ([SetAttribute_id])
    REFERENCES [dbo].[SetAttributes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SetAttributesExerciseGoal'
CREATE INDEX [IX_FK_SetAttributesExerciseGoal]
ON [dbo].[ExerciseGoals]
    ([SetAttribute_id]);
GO

-- Creating foreign key on [id] in table 'Notifications_ScheduledReminder'
ALTER TABLE [dbo].[Notifications_ScheduledReminder]
ADD CONSTRAINT [FK_ScheduledReminder_inherits_Notification]
    FOREIGN KEY ([id])
    REFERENCES [dbo].[Notifications]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [id] in table 'Notifications_EmailNotification'
ALTER TABLE [dbo].[Notifications_EmailNotification]
ADD CONSTRAINT [FK_EmailNotification_inherits_Notification]
    FOREIGN KEY ([id])
    REFERENCES [dbo].[Notifications]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------